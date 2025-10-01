-- ============================================
-- SQL Security Filters - Security Queries
-- Consultas SQL para investigação de incidentes de segurança
-- ============================================

USE security_db;

-- ============================================
-- CENÁRIO 1: Tentativas de Login Falhadas Após o Expediente
-- ============================================
-- Objetivo: Identificar possível incidente de segurança ocorrido 
-- fora do horário comercial (após 18:00)

SELECT 
    'CENÁRIO 1: Tentativas de Login Falhadas Após Expediente' AS Investigacao;

SELECT 
    attempt_id,
    username,
    login_date,
    login_time,
    country,
    ip_address
FROM log_in_attempts
WHERE login_time > '18:00:00' AND success = 0
ORDER BY login_date, login_time;

-- ============================================
-- CENÁRIO 2: Atividade Suspeita em Datas Específicas
-- ============================================
-- Objetivo: Investigar evento suspeito ocorrido em 2022-05-09
-- e no dia anterior (2022-05-08)

SELECT 
    'CENÁRIO 2: Tentativas de Login nas Datas 2022-05-08 e 2022-05-09' AS Investigacao;

SELECT 
    attempt_id,
    username,
    login_date,
    login_time,
    country,
    ip_address,
    CASE 
        WHEN success = 1 THEN 'Sucesso'
        ELSE 'Falha'
    END AS status_login
FROM log_in_attempts
WHERE login_date = '2022-05-09' OR login_date = '2022-05-08'
ORDER BY login_date, login_time;

-- ============================================
-- CENÁRIO 3: Tentativas de Login Fora do México
-- ============================================
-- Objetivo: Investigar atividade suspeita originada fora do México
-- Usa wildcard (%) para capturar variações (MEX, MEXICO)

SELECT 
    'CENÁRIO 3: Tentativas de Login Fora do México' AS Investigacao;

SELECT 
    attempt_id,
    username,
    login_date,
    login_time,
    country,
    ip_address,
    CASE 
        WHEN success = 1 THEN 'Sucesso'
        ELSE 'Falha'
    END AS status_login
FROM log_in_attempts
WHERE NOT country LIKE 'MEX%'
ORDER BY login_date, login_time;

-- ============================================
-- CENÁRIO 4: Funcionários do Marketing no Prédio Leste
-- ============================================
-- Objetivo: Identificar máquinas do departamento de Marketing
-- localizadas no prédio Leste para aplicar updates de segurança

SELECT 
    'CENÁRIO 4: Funcionários de Marketing no Prédio Leste' AS Investigacao;

SELECT 
    employee_id,
    username,
    department,
    office,
    email
FROM employees
WHERE department = 'Marketing' AND office LIKE 'East%'
ORDER BY office;

-- ============================================
-- CENÁRIO 5: Funcionários de Finanças ou Vendas
-- ============================================
-- Objetivo: Aplicar atualização de segurança em máquinas dos
-- departamentos de Vendas (Sales) e Finanças (Finance)

SELECT 
    'CENÁRIO 5: Funcionários de Finanças ou Vendas' AS Investigacao;

SELECT 
    employee_id,
    username,
    department,
    office,
    email
FROM employees
WHERE department = 'Finance' OR department = 'Sales'
ORDER BY department, username;

-- ============================================
-- CENÁRIO 6: Funcionários Fora do Departamento de TI
-- ============================================
-- Objetivo: Identificar colaboradores que ainda precisam receber
-- update de segurança (TI já foi atualizado)

SELECT 
    'CENÁRIO 6: Funcionários Fora do Departamento de TI' AS Investigacao;

SELECT 
    employee_id,
    username,
    department,
    office,
    email
FROM employees
WHERE NOT department = 'Information Technology'
ORDER BY department, username;

-- ============================================
-- ANÁLISES ADICIONAIS
-- ============================================

-- Estatísticas de tentativas de login por país
SELECT 
    'ANÁLISE EXTRA: Tentativas de Login por País' AS Investigacao;

SELECT 
    country AS Pais,
    COUNT(*) AS Total_Tentativas,
    SUM(CASE WHEN success = 1 THEN 1 ELSE 0 END) AS Sucessos,
    SUM(CASE WHEN success = 0 THEN 1 ELSE 0 END) AS Falhas,
    ROUND(SUM(CASE WHEN success = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Taxa_Sucesso
FROM log_in_attempts
GROUP BY country
ORDER BY Total_Tentativas DESC;

-- Distribuição de funcionários por departamento
SELECT 
    'ANÁLISE EXTRA: Funcionários por Departamento' AS Investigacao;

SELECT 
    department AS Departamento,
    COUNT(*) AS Total_Funcionarios
FROM employees
GROUP BY department
ORDER BY Total_Funcionarios DESC;

-- Tentativas de login por hora do dia
SELECT 
    'ANÁLISE EXTRA: Tentativas de Login por Horário' AS Investigacao;

SELECT 
    HOUR(login_time) AS Hora,
    COUNT(*) AS Total_Tentativas,
    SUM(CASE WHEN success = 0 THEN 1 ELSE 0 END) AS Falhas
FROM log_in_attempts
GROUP BY HOUR(login_time)
ORDER BY Hora;