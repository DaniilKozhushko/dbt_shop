-- увеличение лимита символов
ALTER TABLE raw.statuses ALTER COLUMN name TYPE VARCHAR(10);

-- увеличение лимита символов
ALTER TABLE raw.statuses ALTER COLUMN name TYPE VARCHAR(22);