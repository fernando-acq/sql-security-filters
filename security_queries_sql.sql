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

SELECT *
FROM log_in_attempts
WHERE login_time > '18:00:00' AND success = 0;

-- ============================================
-- CENÁRIO 2: Atividade Suspeita em Datas Específicas
-- ============================================
-- Objetivo: Investigar evento suspeito ocorrido em 2022-05-09
-- e no dia anterior (2022-05-08)

SELECT *
FROM log_in_attempts
WHERE login_date = '2022-05-09' OR login_date = '2022-05-08';

-- ============================================
-- CENÁRIO 3: Tentativas de Login Fora do México
-- ============================================
-- Objetivo: Investigar atividade suspeita originada fora do México
-- Usa wildcard (%) para capturar variações (MEX, MEXICO)

SELECT *
FROM log_in_attempts
WHERE NOT country LIKE 'MEX%';

-- ============================================
-- CENÁRIO 4: Funcionários do Marketing no Prédio Leste
-- ============================================
-- Objetivo: Identificar máquinas do departamento de Marketing
-- localizadas no prédio Leste para aplicar updates de segurança

SELECT *
FROM employees
WHERE department = 'Marketing' AND office LIKE 'East%';

-- ============================================
-- CENÁRIO 5: Funcionários de Finanças ou Vendas
-- ============================================
-- Objetivo: Aplicar atualização de segurança em máquinas dos
-- departamentos de Vendas (Sales) e Finanças (Finance)

SELECT *
FROM employees
WHERE department = 'Finance' OR department = 'Sales';

-- ============================================
-- CENÁRIO 6: Funcionários Fora do Departamento de TI
-- ============================================
-- Objetivo: Identificar colaboradores que ainda precisam receber
-- update de segurança (TI já foi atualizado)

SELECT *
FROM employees
WHERE NOT department = 'Information Technology';

-- ============================================
-- ANÁLISES EXTRAS - Queries Complementares
-- ============================================

-- Contar total de tentativas de login falhadas
SELECT COUNT(*) AS total_falhas
FROM log_in_attempts
WHERE success = 0;

-- Contar total de tentativas de login bem-sucedidas
SELECT COUNT(*) AS total_sucessos
FROM log_in_attempts
WHERE success = 1;

-- Contar tentativas de login do México
SELECT COUNT(*) AS tentativas_mexico
FROM log_in_attempts
WHERE country LIKE 'MEX%';

-- Contar funcionários do departamento de Marketing
SELECT COUNT(*) AS total_marketing
FROM employees
WHERE department = 'Marketing';

-- Listar todos os departamentos únicos
SELECT DISTINCT department
FROM employees;
