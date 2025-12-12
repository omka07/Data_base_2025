CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  iin CHAR(12) UNIQUE NOT NULL,
  full_name TEXT NOT NULL,
  phone TEXT,
  email TEXT,
  status TEXT NOT NULL DEFAULT 'active',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  daily_limit_kzt NUMERIC(18,2) DEFAULT 500000.00
);

CREATE TABLE accounts (
  account_id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
  account_number TEXT UNIQUE NOT NULL,
  currency CHAR(3) NOT NULL CHECK (currency IN ('KZT','USD','EUR','RUB')),
  balance NUMERIC(18,2) DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  opened_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  closed_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE exchange_rates (
  rate_id SERIAL PRIMARY KEY,
  from_currency CHAR(3) NOT NULL,
  to_currency CHAR(3) NOT NULL,
  rate NUMERIC(18,8) NOT NULL,
  valid_from TIMESTAMP WITH TIME ZONE DEFAULT now(),
  valid_to TIMESTAMP WITH TIME ZONE
);

CREATE TABLE transactions (
  transaction_id SERIAL PRIMARY KEY,
  from_account_id INT REFERENCES accounts(account_id),
  to_account_id INT REFERENCES accounts(account_id),
  amount NUMERIC(18,2) NOT NULL,
  currency CHAR(3) NOT NULL,
  exchange_rate NUMERIC(18,8),
  amount_kzt NUMERIC(18,2),
  type TEXT NOT NULL CHECK (type IN ('transfer','deposit','withdrawal','salary')),
  status TEXT NOT NULL CHECK (status IN ('pending','completed','failed','reversed')) DEFAULT 'pending',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  completed_at TIMESTAMP WITH TIME ZONE,
  description TEXT
);

CREATE TABLE audit_log (
  log_id SERIAL PRIMARY KEY,
  table_name TEXT,
  record_id TEXT,
  action TEXT,
  old_values JSONB,
  new_values JSONB,
  changed_by TEXT,
  changed_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  ip_address TEXT
);

-- SAMPLE DATA

-- Customers
INSERT INTO customers (iin, full_name, phone, email, status, daily_limit_kzt)
VALUES
('880101123456','Aibek Nurlan','+7 700 111 0001','aibek@example.com','active',1000000),
('900202234567','Dinara Zhan','+7 700 111 0002','dinara@example.com','active',500000),
('910303345678','Erlan S','+7 700 111 0003','erlan@example.com','active',300000),
('920404456789','Gulnara T','+7 700 111 0004','gulnara@example.com','frozen',200000),
('930505567890','Marat K','+7 700 111 0005','marat@example.com','active',400000),
('940606678901','Zhanar B','+7 700 111 0006','zhanar@example.com','blocked',250000),
('950707789012','Serik A','+7 700 111 0007','serik@example.com','active',600000),
('960808890123','Aruzhan O','+7 700 111 0008','aruzhan@example.com','active',450000),
('970909901234','Bulat M','+7 700 111 0009','bulat@example.com','active',800000),
('981010012345','Saule P','+7 700 111 0010','saule@example.com','active',700000);

-- Accounts
INSERT INTO accounts (customer_id, account_number, currency, balance, is_active)
VALUES
(1,'KZ01AAAA0000000001','KZT',1500000,true),
(1,'KZ01AAAA0000000002','USD',2000,true),
(2,'KZ01BBBB0000000001','KZT',300000,true),
(2,'KZ01BBBB0000000002','EUR',150,true),
(3,'KZ01CCCC0000000001','KZT',100000,true),
(4,'KZ01DDDD0000000001','KZT',50000,true),
(5,'KZ01EEEE0000000001','USD',5000,true),
(6,'KZ01FFFF0000000001','KZT',25000,false),
(7,'KZ01GGGG0000000001','RUB',100000,true),
(8,'KZ01HHHH0000000001','KZT',750000,true),
(9,'KZ01IIII0000000001','EUR',1000,true),
(10,'KZ01JJJJ0000000001','KZT',600000,true);

-- Exchange rates
INSERT INTO exchange_rates (from_currency, to_currency, rate, valid_from)
VALUES
('USD','KZT',470.50, now() - interval '1 day'),
('EUR','KZT',510.75, now() - interval '1 day'),
('RUB','KZT',5.50, now() - interval '1 day'),
('KZT','KZT',1.0, now() - interval '10 year');

-- A few transactions for history
INSERT INTO transactions (from_account_id,to_account_id,amount,currency,amount_kzt,type,status,description,created_at,completed_at,exchange_rate)
VALUES
(2,3,500.00,'USD',500.00*470.5,'transfer','completed','Transfer USD -> KZT', now()-interval '2 day', now()-interval '2 day',470.5),
(1,5,100000.00,'KZT',100000,'transfer','completed','Internal transfer', now()-interval '1 day', now()-interval '1 day',1.0),
(NULL,1,200000.00,'KZT',200000,'deposit','completed','Cash deposit', now()-interval '5 day', now()-interval '5 day',1.0),
(8,9,100.00,'KZT',100,'transfer','completed','Small', now()-interval '3 hour', now()-interval '3 hour',1.0),
(5,7,50.00,'USD',50*470.5,'transfer','completed','USD to RUB route', now()-interval '6 hour', now()-interval '6 hour',470.5),
(1,4,25000.00,'KZT',25000,'transfer','failed','Insufficient funds test', now()-interval '1 hour', NULL,1.0),
(10,1,150000.00,'KZT',150000,'transfer','completed','Salary pay', now()-interval '30 day', now()-interval '30 day',1.0),
(7,3,10000,'RUB',10000*5.5,'transfer','completed','RUB -> KZT', now()-interval '10 day', now()-interval '10 day',5.5),
(9,2,200.00,'EUR',200*510.75,'transfer','completed','EUR -> USD? demo', now()-interval '20 day', now()-interval '20 day',510.75),
(3,8,50000,'KZT',50000,'transfer','completed','Large', now()-interval '2 hour', now()-interval '2 hour',1.0);

-- Audit logs
INSERT INTO audit_log (table_name, record_id, action, old_values, new_values, changed_by, ip_address)
VALUES
('accounts','1','INSERT', NULL, to_jsonb((SELECT a FROM (SELECT * FROM accounts WHERE account_id=1) a)), 'system','127.0.0.1'),
('transactions','1','INSERT', NULL, to_jsonb((SELECT t FROM (SELECT * FROM transactions WHERE transaction_id=1) t)), 'system','127.0.0.1');

-- STORED PROCEDURE: process_transfer

CREATE OR REPLACE FUNCTION process_transfer(
  p_from_acc TEXT,
  p_to_acc TEXT,
  p_amount NUMERIC,
  p_currency CHAR(3),
  p_description TEXT,
  OUT result JSONB
) RETURNS JSONB LANGUAGE plpgsql AS $$
DECLARE
  v_from_row RECORD;
  v_to_row RECORD;
  v_sender_customer RECORD;
  v_rate NUMERIC := 1.0;
  v_amount_kzt NUMERIC;
  v_today_sum NUMERIC;
  v_tx_id INT;
  v_err TEXT;
BEGIN
  result := jsonb_build_object('ok',false,'error',NULL,'code',NULL);

  -- Basic validations
  SELECT * INTO v_from_row FROM accounts WHERE account_number = p_from_acc FOR UPDATE;
  IF NOT FOUND THEN
    v_err := 'FROM_ACCOUNT_NOT_FOUND';
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('accounts', p_from_acc, 'FAILED_TRANSFER', NULL, jsonb_build_object('reason', v_err, 'amount', p_amount, 'to', p_to_acc), 'process_transfer');
    result := jsonb_build_object('ok',false,'error',v_err,'code','P1001');
    RETURN result;
  END IF;

  SELECT * INTO v_to_row FROM accounts WHERE account_number = p_to_acc FOR UPDATE;
  IF NOT FOUND THEN
    v_err := 'TO_ACCOUNT_NOT_FOUND';
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('accounts', p_to_acc, 'FAILED_TRANSFER', NULL, jsonb_build_object('reason', v_err, 'amount', p_amount, 'from', p_from_acc), 'process_transfer');
    result := jsonb_build_object('ok',false,'error',v_err,'code','P1002');
    RETURN result;
  END IF;

  IF NOT v_from_row.is_active OR NOT v_to_row.is_active THEN
    v_err := 'ACCOUNT_INACTIVE';
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('accounts', p_from_acc || '->' || p_to_acc, 'FAILED_TRANSFER', NULL, jsonb_build_object('reason', v_err), 'process_transfer');
    result := jsonb_build_object('ok',false,'error',v_err,'code','P1003');
    RETURN result;
  END IF;

  -- check sender customer status
  SELECT * INTO v_sender_customer FROM customers WHERE customer_id = v_from_row.customer_id;
  IF v_sender_customer.status <> 'active' THEN
    v_err := 'SENDER_STATUS_NOT_ACTIVE';
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('customers', v_sender_customer.customer_id::text, 'FAILED_TRANSFER', to_jsonb(v_sender_customer), jsonb_build_object('reason', v_err), 'process_transfer');
    result := jsonb_build_object('ok',false,'error',v_err,'code','P1004');
    RETURN result;
  END IF;

  -- Determine exchange rate to KZT for daily limit check and conversion
  IF p_currency <> v_from_row.currency THEN
    -- convert using exchange_rates where from_currency = p_currency and to_currency = v_from_row.currency if possible
    SELECT rate INTO v_rate FROM exchange_rates
     WHERE from_currency = p_currency AND to_currency = v_from_row.currency
     AND (valid_to IS NULL OR valid_to > now())
     ORDER BY valid_from DESC LIMIT 1;
    IF NOT FOUND THEN
      -- try direct to KZT
      SELECT rate INTO v_rate FROM exchange_rates
       WHERE from_currency = p_currency AND to_currency = 'KZT' AND (valid_to IS NULL OR valid_to > now())
       ORDER BY valid_from DESC LIMIT 1;
      IF NOT FOUND THEN
        v_err := 'EXCHANGE_RATE_NOT_FOUND';
        INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
          VALUES('exchange_rates', p_currency || '->' || v_from_row.currency, 'FAILED_TRANSFER', NULL, jsonb_build_object('reason', v_err), 'process_transfer');
        result := jsonb_build_object('ok',false,'error',v_err,'code','P1005');
        RETURN result;
      END IF;
    END IF;
  ELSE
    v_rate := 1.0;
  END IF;

  -- compute amount_kzt using a direct lookup to KZT
  IF p_currency = 'KZT' THEN
    v_amount_kzt := p_amount;
  ELSE
    SELECT rate INTO v_rate FROM exchange_rates WHERE from_currency = p_currency AND to_currency = 'KZT' AND (valid_to IS NULL OR valid_to > now()) ORDER BY valid_from DESC LIMIT 1;
    IF NOT FOUND THEN
      v_err := 'EXCHANGE_RATE_TO_KZT_NOT_FOUND';
      INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
        VALUES('exchange_rates', p_currency || '->KZT', 'FAILED_TRANSFER', NULL, jsonb_build_object('reason', v_err), 'process_transfer');
      result := jsonb_build_object('ok',false,'error',v_err,'code','P1006');
      RETURN result;
    END IF;
    v_amount_kzt := round(p_amount * v_rate,2);
  END IF;

  -- Check daily limit: sum of today's completed transfers (KZT) + this <= daily_limit_kzt
  SELECT COALESCE(SUM(amount_kzt),0) INTO v_today_sum FROM transactions t
    JOIN accounts a ON (t.from_account_id = a.account_id)
    WHERE a.customer_id = v_from_row.customer_id
      AND t.created_at >= date_trunc('day', now())
      AND t.status = 'completed';

  IF (v_today_sum + v_amount_kzt) > v_sender_customer.daily_limit_kzt THEN
    v_err := 'DAILY_LIMIT_EXCEEDED';
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('customers', v_sender_customer.customer_id::text, 'FAILED_TRANSFER', to_jsonb(v_sender_customer), jsonb_build_object('today_sum', v_today_sum, 'attempt_amount_kzt', v_amount_kzt), 'process_transfer');
    result := jsonb_build_object('ok',false,'error',v_err,'code','P1007','today_sum',v_today_sum,'attempt_amount_kzt',v_amount_kzt);
    RETURN result;
  END IF;

  -- verify sufficient balance (convert p_amount to source account currency if needed)
  -- We will treat p_amount as in p_currency: if source account currency differs, convert p_amount->source currency using rates
  DECLARE
    v_amount_in_source NUMERIC;
    v_rate_to_source NUMERIC := 1.0;
  BEGIN
    IF p_currency = v_from_row.currency THEN
      v_amount_in_source := p_amount;
    ELSE
      -- get p_currency -> source currency rate
      SELECT rate INTO v_rate_to_source FROM exchange_rates WHERE from_currency = p_currency AND to_currency = v_from_row.currency AND (valid_to IS NULL OR valid_to > now()) ORDER BY valid_from DESC LIMIT 1;
      IF NOT FOUND THEN
        -- fallback via KZT
        SELECT rate INTO v_rate FROM exchange_rates WHERE from_currency = p_currency AND to_currency = 'KZT' LIMIT 1;
        SELECT rate INTO v_rate_to_source FROM exchange_rates WHERE from_currency = 'KZT' AND to_currency = v_from_row.currency LIMIT 1;
        IF v_rate IS NULL OR v_rate_to_source IS NULL THEN
          v_err := 'EXCHANGE_ROUTE_NOT_FOUND';
          INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
            VALUES('exchange_rates', p_currency || '->' || v_from_row.currency, 'FAILED_TRANSFER', NULL, jsonb_build_object('reason', v_err), 'process_transfer');
          result := jsonb_build_object('ok',false,'error',v_err,'code','P1008');
          RETURN result;
        END IF;
        v_amount_in_source := p_amount * v_rate * v_rate_to_source;
      ELSE
        v_amount_in_source := p_amount * v_rate_to_source;
      END IF;
    END IF;
  END;

  IF v_from_row.balance < v_amount_in_source THEN
    v_err := 'INSUFFICIENT_FUNDS';
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('accounts', v_from_row.account_number, 'FAILED_TRANSFER', to_jsonb(v_from_row), jsonb_build_object('available', v_from_row.balance, 'required', v_amount_in_source), 'process_transfer');
    result := jsonb_build_object('ok',false,'error',v_err,'code','P1009');
    RETURN result;
  END IF;

  -- All checks passed: proceed with transfer inside savepoint so we can rollback partials
  SAVEPOINT sp_before_transfer;
  BEGIN
    -- create transaction record
    INSERT INTO transactions(from_account_id,to_account_id,amount,currency,exchange_rate,amount_kzt,type,status,description,created_at)
      VALUES (v_from_row.account_id, v_to_row.account_id, p_amount, p_currency, v_rate, v_amount_kzt, 'transfer','pending', p_description, now())
      RETURNING transaction_id INTO v_tx_id;

    -- debit source
    UPDATE accounts SET balance = balance - v_amount_in_source WHERE account_id = v_from_row.account_id;

    -- credit target: if currency differs, credit in target currency (assume p_amount in p_currency and convert to target currency)
    DECLARE v_credit_amount NUMERIC;
    BEGIN
      IF p_currency = v_to_row.currency THEN
        v_credit_amount := p_amount;
      ELSE
        -- convert p_currency -> target currency via KZT as intermediary if needed
        SELECT rate INTO v_rate FROM exchange_rates WHERE from_currency = p_currency AND to_currency = v_to_row.currency AND (valid_to IS NULL OR valid_to > now()) ORDER BY valid_from DESC LIMIT 1;
        IF NOT FOUND THEN
          -- via KZT
          SELECT rate INTO v_rate FROM exchange_rates WHERE from_currency = p_currency AND to_currency = 'KZT' ORDER BY valid_from DESC LIMIT 1;
          DECLARE v_kzt_to_target NUMERIC;
          SELECT rate INTO v_kzt_to_target FROM exchange_rates WHERE from_currency = 'KZT' AND to_currency = v_to_row.currency ORDER BY valid_from DESC LIMIT 1;
          IF v_kzt_to_target IS NULL OR v_rate IS NULL THEN
            RAISE EXCEPTION USING MESSAGE = 'EXCHANGE_ROUTE_NOT_FOUND_TARGET', ERRCODE = 'P1010';
          END IF;
          v_credit_amount := p_amount * v_rate * v_kzt_to_target;
        ELSE
          v_credit_amount := p_amount * v_rate;
        END IF;
      END IF;
    END;

    UPDATE accounts SET balance = balance + v_credit_amount WHERE account_id = v_to_row.account_id;

    -- mark transaction completed
    UPDATE transactions SET status = 'completed', completed_at = now() WHERE transaction_id = v_tx_id;

    -- insert audit log for success
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('transactions', v_tx_id::text, 'INSERT', NULL, (SELECT to_jsonb(t) FROM (SELECT * FROM transactions WHERE transaction_id = v_tx_id) t), 'process_transfer');

    result := jsonb_build_object('ok',true,'tx_id',v_tx_id,'amount_kzt',v_amount_kzt);
    RELEASE SAVEPOINT sp_before_transfer;
    RETURN result;
  EXCEPTION WHEN OTHERS THEN
    ROLLBACK TO SAVEPOINT sp_before_transfer;
    -- log failure
    INSERT INTO audit_log(table_name, record_id, action, old_values, new_values, changed_by)
      VALUES('transactions', NULL, 'FAILED_TRANSFER', NULL, jsonb_build_object('reason', SQLERRM, 'detail', SQLSTATE), 'process_transfer');
    result := jsonb_build_object('ok',false,'error',SQLERRM,'code',SQLSTATE);
    RETURN result;
  END;

EXCEPTION WHEN OTHERS THEN
  result := jsonb_build_object('ok',false,'error',SQLERRM,'code',SQLSTATE);
  RETURN result;
END;
$$;

-- VIEWS for reporting

-- View 1: customer_balance_summary
CREATE OR REPLACE VIEW customer_balance_summary AS
SELECT
  c.customer_id,
  c.full_name,
  c.iin,
  a.account_id,
  a.account_number,
  a.currency,
  a.balance,
  -- convert each account balance to KZT using latest rate
  COALESCE((SELECT rate FROM exchange_rates er WHERE er.from_currency = a.currency AND er.to_currency = 'KZT' AND (er.valid_to IS NULL OR er.valid_to > now()) ORDER BY er.valid_from DESC LIMIT 1) * a.balance, a.balance) AS balance_kzt,
  c.daily_limit_kzt,
  -- daily utilization: sum of today's completed tx (KZT) / daily_limit
  COALESCE((SELECT SUM(t.amount_kzt) FROM transactions t WHERE t.from_account_id = a.account_id AND t.created_at >= date_trunc('day', now()) AND t.status='completed'),0) AS today_spent_kzt
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id;

-- aggregated summary per customer with ranking
CREATE OR REPLACE VIEW customer_total_summary AS
SELECT
  customer_id,
  full_name,
  SUM(balance_kzt) AS total_balance_kzt,
  daily_limit_kzt,
  SUM(today_spent_kzt) AS today_spent_kzt,
  (SUM(today_spent_kzt)/NULLIF(daily_limit_kzt,0))*100 AS daily_limit_util_pct,
  RANK() OVER (ORDER BY SUM(balance_kzt) DESC) AS rank_by_balance
FROM customer_balance_summary
GROUP BY customer_id, full_name, daily_limit_kzt;

-- View 2: daily_transaction_report
CREATE OR REPLACE VIEW daily_transaction_report AS
SELECT
  day::date,
  type,
  SUM(total_amount) AS total_volume,
  SUM(count_tx) AS total_count,
  (SUM(total_amount)/NULLIF(SUM(count_tx),0))::numeric(18,2) AS avg_amount,
  SUM(SUM(total_amount)) OVER (ORDER BY day) AS running_total_volume,
  LAG(SUM(total_amount)) OVER (ORDER BY day) AS prev_day_volume,
  CASE WHEN LAG(SUM(total_amount)) OVER (ORDER BY day) IS NULL THEN NULL
       ELSE (SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY day)) / NULLIF(LAG(SUM(total_amount)) OVER (ORDER BY day),0) * 100 END AS day_over_day_pct
FROM (
  SELECT date_trunc('day', created_at) AS day, type, SUM(amount_kzt) AS total_amount, COUNT(*) AS count_tx
  FROM transactions
  WHERE status='completed'
  GROUP BY day, type
) s
GROUP BY day, type
ORDER BY day;

-- View 3: suspicious_activity_view (with security barrier)
CREATE OR REPLACE VIEW suspicious_activity_view WITH (security_barrier = true) AS
SELECT t.transaction_id, t.from_account_id, t.to_account_id, t.amount_kzt, t.created_at, t.status, t.description,
  -- flag big transactions
  (t.amount_kzt > 5000000) AS is_large,
  -- transactions per hour per customer
  (SELECT COUNT(*) FROM transactions tx WHERE tx.from_account_id = t.from_account_id AND tx.created_at >= t.created_at - interval '1 hour' AND tx.created_at <= t.created_at) AS txs_last_hour,
  -- rapid sequential transfers (< 1 minute apart for same sender)
  EXISTS(SELECT 1 FROM transactions tx2 WHERE tx2.from_account_id = t.from_account_id AND tx2.transaction_id <> t.transaction_id AND ABS(EXTRACT(EPOCH FROM (tx2.created_at - t.created_at))) < 60) AS is_rapid
FROM transactions t
WHERE t.status = 'completed' AND (t.amount_kzt > 5000000 OR
  (SELECT COUNT(*) FROM transactions tx WHERE tx.from_account_id = t.from_account_id AND tx.created_at >= t.created_at - interval '1 hour' AND tx.created_at <= t.created_at) > 10 OR
  EXISTS(SELECT 1 FROM transactions tx2 WHERE tx2.from_account_id = t.from_account_id AND tx2.transaction_id <> t.transaction_id AND ABS(EXTRACT(EPOCH FROM (tx2.created_at - t.created_at))) < 60)
);

-- 1) B-tree index on account_number (frequent lookup)
CREATE INDEX idx_accounts_account_number ON accounts(account_number);

-- 2) Hash index on customers.iin (equality lookups). 
CREATE INDEX idx_customers_iin_hash ON customers USING hash(iin);

-- 3) GIN index on audit_log JSONB columns for fast JSONB contains queries
CREATE INDEX idx_auditlog_jsonb_gin ON audit_log USING gin ((old_values || new_values));

-- 4) Partial index for active accounts only (covers queries that filter is_active)
CREATE INDEX idx_accounts_active_balance ON accounts(account_id) WHERE is_active = TRUE;

-- 5) Composite index for transactions on (from_account_id, created_at) - common pattern
CREATE INDEX idx_tx_from_created_composite ON transactions(from_account_id, created_at DESC) INCLUDE (amount_kzt,status);

-- 6) Expression index for case-insensitive email searches
CREATE INDEX idx_customers_email_ci ON customers ((lower(email)));


-- PROCEDURE: process_salary_batch
-- Accepts company_account_number, payments JSONB array [{iin, amount, description}, ...]
-- Uses advisory lock on company_account_number hash, validates total, uses savepoints, bypasses daily limits for salary payments

CREATE OR REPLACE FUNCTION process_salary_batch(p_company_acc TEXT, p_payments JSONB)
RETURNS JSONB LANGUAGE plpgsql AS $$
DECLARE
  v_company_account RECORD;
  v_total NUMERIC := 0;
  v_item JSONB;
  v_i INTEGER := 0;
  v_results JSONB := '[]'::jsonb;
  v_success INT := 0;
  v_failed INT := 0;
  v_failed_details JSONB := '[]'::jsonb;
  v_temp TABLE(temp_acc INT, temp_amount NUMERIC, temp_currency CHAR(3)); -- placeholder idea
  v_lock_key BIGINT;
  v_tx_id INT;
BEGIN
  -- get company account and lock it
  SELECT * INTO v_company_account FROM accounts WHERE account_number = p_company_acc FOR UPDATE;
  IF NOT FOUND THEN
    RETURN jsonb_build_object('ok',false,'error','COMPANY_ACCOUNT_NOT_FOUND');
  END IF;

  -- compute total
  FOR v_item IN SELECT * FROM jsonb_array_elements(p_payments) LOOP
    v_total := v_total + (v_item->>'amount')::numeric;
  END LOOP;

  IF v_total > v_company_account.balance THEN
    RETURN jsonb_build_object('ok',false,'error','INSUFFICIENT_COMPANY_FUNDS','total',v_total,'available',v_company_account.balance);
  END IF;

  -- advisory lock using hash of account_number to prevent concurrent batches
  v_lock_key := hashtext(p_company_acc);
  PERFORM pg_advisory_xact_lock(v_lock_key);

  -- We'll accumulate debits and credits in a temporary table and apply atomically at end
  CREATE TEMP TABLE tmp_batch_changes(account_id int, delta numeric) ON COMMIT DROP;

  -- preload company debit
  INSERT INTO tmp_batch_changes VALUES (v_company_account.account_id, -v_total);

  -- process each payment individually using savepoints
  FOR v_item IN SELECT * FROM jsonb_array_elements(p_payments) LOOP
    v_i := v_i + 1;
    BEGIN
      SAVEPOINT sp_item;
      -- find recipient by IIN
      DECLARE v_rec_customer RECORD; v_rec_account RECORD;
      SELECT * INTO v_rec_customer FROM customers WHERE iin = (v_item->>'iin')::text;
      IF NOT FOUND THEN
        ROLLBACK TO SAVEPOINT sp_item;
        v_failed := v_failed + 1;
        v_failed_details := v_failed_details || jsonb_build_object('index', v_i, 'reason','RECIPIENT_NOT_FOUND','item', v_item);
        CONTINUE;
      END IF;

      -- choose recipient default account (first active)
      SELECT * INTO v_rec_account FROM accounts WHERE customer_id = v_rec_customer.customer_id AND is_active = true LIMIT 1 FOR UPDATE;
      IF NOT FOUND THEN
        ROLLBACK TO SAVEPOINT sp_item;
        v_failed := v_failed + 1;
        v_failed_details := v_failed_details || jsonb_build_object('index', v_i, 'reason','RECIPIENT_NO_ACTIVE_ACCOUNT','item', v_item);
        CONTINUE;
      END IF;

      -- add credit to tmp table
      INSERT INTO tmp_batch_changes VALUES (v_rec_account.account_id, (v_item->>'amount')::numeric);

      -- create a pending transaction record (salary type) bypassing daily limits
      INSERT INTO transactions(from_account_id,to_account_id,amount,currency,amount_kzt,type,status,description,created_at)
        VALUES (v_company_account.account_id, v_rec_account.account_id, (v_item->>'amount')::numeric, v_company_account.currency, ((v_item->>'amount')::numeric * COALESCE((SELECT rate FROM exchange_rates WHERE from_currency = v_company_account.currency AND to_currency='KZT' ORDER BY valid_from DESC LIMIT 1),1)), 'salary','completed', v_item->>'description', now())
        RETURNING transaction_id INTO v_tx_id;

      v_success := v_success + 1;
      RELEASE SAVEPOINT sp_item;
    EXCEPTION WHEN OTHERS THEN
      ROLLBACK TO SAVEPOINT sp_item;
      v_failed := v_failed + 1;
      v_failed_details := v_failed_details || jsonb_build_object('index', v_i, 'reason', SQLERRM);
    END;
  END LOOP;

  -- apply tmp_batch_changes atomically
  -- aggregate deltas
  WITH agg AS (
    SELECT account_id, SUM(delta) AS delta_sum FROM tmp_batch_changes GROUP BY account_id
  )
  UPDATE accounts a SET balance = a.balance + agg.delta_sum
  FROM agg WHERE a.account_id = agg.account_id;

  RETURN jsonb_build_object('ok',true,'successful_count',v_success,'failed_count',v_failed,'failed_details',v_failed_details,'total_amount',v_total);
END;
$$;

-- SAMPLE TEST CASES

-- Simple successful transfer (KZT -> KZT)
-- SELECT process_transfer('KZ01AAAA0000000001','KZ01EEEE0000000001',10000,'KZT','Test transfer');

-- Transfer with insufficient funds
-- SELECT process_transfer('KZ01CCCC0000000001','KZ01EEEE0000000001',1000000,'KZT','Should fail');

-- Transfer to inactive account
-- SELECT process_transfer('KZ01AAAA0000000001','KZ01FFFF0000000001',1000,'KZT','To inactive');

-- Salary batch example
-- SELECT process_salary_batch('KZ01AAAA0000000001', '[{"iin":"900202234567","amount":100000,"description":"Aug salary"},{"iin":"910303345678","amount":50000,"description":"Aug salary"}]'::jsonb);

-- EXPLAIN ANALYZE placeholders
-- The environment here cannot run EXPLAIN ANALYZE, but you should run the following locally and save outputs as required by the assignment.
-- EXAMPLES:
-- EXPLAIN ANALYZE SELECT * FROM accounts WHERE account_number = 'KZ01AAAA0000000001';
-- EXPLAIN ANALYZE SELECT * FROM transactions WHERE from_account_id = 1 ORDER BY created_at DESC LIMIT 10;

-- SIMPLE DOCUMENTATION NOTES
-- 1) process_transfer uses SELECT ... FOR UPDATE on both accounts to avoid race conditions.
-- 2) process_transfer computes KZT equivalents for daily limit checking.
-- 3) process_salary_batch aggregates changes and applies them once to ensure atomic balances update.
-- 4) Indexes: chosen to speed up account lookups, jsonb searches, filtering active accounts, and frequent transaction queries.