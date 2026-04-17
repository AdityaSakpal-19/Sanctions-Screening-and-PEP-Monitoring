-- 1. Create the table structure based on your CSV columns
CREATE TABLE IF NOT EXISTS compliance_log (
    customer_id TEXT,
    customer_name TEXT,
    country TEXT,
    date_of_birth TEXT,
    gender TEXT,
    address TEXT,
    id_number TEXT,
    customer_type TEXT,
    onboarding_date TEXT,
    matched_name TEXT,
    match_score INTEGER,
    list_source TEXT,
    matched_sdn_program TEXT,
    matched_pep_details TEXT,
    screening_risk_level TEXT,
    final_decision TEXT
);

-- 2. Import the CSV data (This is specific to SQLite)
.mode csv
.import 'D:\New Resumes\Latest\Projects\Sanctions Screening Project\SQL\final_df.csv' compliance_log

-- 3. The Investigator's Query: Pull the critical alerts
SELECT 
    customer_id TEXT,
    customer_name TEXT,
    country TEXT,
    date_of_birth TEXT,
    gender TEXT,
    address TEXT,
    id_number TEXT,
    customer_type TEXT,
    onboarding_date TEXT,
    matched_name TEXT,
    match_score INTEGER,
    list_source TEXT,
    matched_sdn_program TEXT,
    matched_pep_details TEXT,
    screening_risk_level TEXT,
    final_decision TEXT
    compliance_log
WHERE 
    screening_risk_level IN ('CRITICAL', 'HIGH RISK') 
    AND final_decision = 'BLOCK'
ORDER BY 
    match_score DESC;


-- 4. The Investigator's Query: Pull ONLY the high alerts
SELECT 
    customer_id TEXT,
    customer_name TEXT,
    country TEXT,
    date_of_birth TEXT,
    gender TEXT,
    address TEXT,
    id_number TEXT,
    customer_type TEXT,
    onboarding_date TEXT,
    matched_name TEXT,
    match_score INTEGER,
    list_source TEXT,
    matched_sdn_program TEXT,
    matched_pep_details TEXT,
    screening_risk_level TEXT,
    final_decision TEXT
    compliance_log
FROM 
    compliance_log
WHERE 
    screening_risk_level = 'CRITICAL'  -- This is the only line that changed
    AND final_decision = 'BLOCK'
ORDER BY 
    match_score DESC;