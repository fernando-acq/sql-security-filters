-- ============================================
-- SQL Security Filters - Sample Data
-- Dados de exemplo para testes e demonstrações
-- ============================================

USE security_db;

-- ============================================
-- Inserir dados na tabela log_in_attempts
-- ============================================

INSERT INTO log_in_attempts (username, login_date, login_time, country, ip_address, success) VALUES
-- Tentativas suspeitas após expediente
('jsmith', '2022-05-09', '19:30:00', 'USA', '192.168.1.100', 0),
('mjones', '2022-05-09', '20:15:00', 'CANADA', '192.168.1.101', 0),
('rthomas', '2022-05-09', '18:45:00', 'UK', '192.168.1.102', 0),
('agarcia', '2022-05-09', '21:00:00', 'SPAIN', '192.168.1.103', 0),

-- Tentativas nas datas específicas (2022-05-08 e 2022-05-09)
('lmartinez', '2022-05-08', '14:30:00', 'MEXICO', '192.168.1.104', 1),
('pbrown', '2022-05-08', '09:15:00', 'USA', '192.168.1.105', 1),
('kdavis', '2022-05-09', '10:00:00', 'CANADA', '192.168.1.106', 1),
('jwilson', '2022-05-09', '11:30:00', 'UK', '192.168.1.107', 0),

-- Tentativas de diferentes países (incluindo México)
('mmiller', '2022-05-10', '08:00:00', 'MEX', '192.168.1.108', 1),
('tanderson', '2022-05-10', '09:00:00', 'MEXICO', '192.168.1.109', 1),
('jthomas', '2022-05-10', '10:00:00', 'USA', '192.168.1.110', 1),
('swilliams', '2022-05-10', '11:00:00', 'BRAZIL', '192.168.1.111', 1),
('mjackson', '2022-05-10', '12:00:00', 'ARGENTINA', '192.168.1.112', 0),

-- Tentativas durante expediente (sucesso)
('rwhite', '2022-05-11', '09:00:00', 'USA', '192.168.1.113', 1),
('bharris', '2022-05-11', '10:30:00', 'CANADA', '192.168.1.114', 1),
('cmartin', '2022-05-11', '14:00:00', 'UK', '192.168.1.115', 1),

-- Mais tentativas falhadas após expediente
('dthompson', '2022-05-11', '19:00:00', 'CHINA', '192.168.1.116', 0),
('egarcia', '2022-05-11', '20:30:00', 'RUSSIA', '192.168.1.117', 0),
('fmartinez', '2022-05-11', '22:00:00', 'INDIA', '192.168.1.118', 0);

-- ============================================
-- Inserir dados na tabela employees
-- ============================================

INSERT INTO employees (username, department, office, email) VALUES
-- Departamento de Marketing no Prédio Leste
('jsmith', 'Marketing', 'East-170', 'jsmith@company.com'),
('mjones', 'Marketing', 'East-230', 'mjones@company.com'),
('rthomas', 'Marketing', 'East-460', 'rthomas@company.com'),

-- Departamento de Marketing em outros prédios
('agarcia', 'Marketing', 'West-120', 'agarcia@company.com'),
('lmartinez', 'Marketing', 'North-340', 'lmartinez@company.com'),

-- Departamento de Finanças
('pbrown', 'Finance', 'South-210', 'pbrown@company.com'),
('kdavis', 'Finance', 'South-310', 'kdavis@company.com'),
('jwilson', 'Finance', 'East-450', 'jwilson@company.com'),

-- Departamento de Vendas
('mmiller', 'Sales', 'West-250', 'mmiller@company.com'),
('tanderson', 'Sales', 'North-180', 'tanderson@company.com'),
('jthomas', 'Sales', 'East-320', 'jthomas@company.com'),

-- Departamento de TI
('swilliams', 'Information Technology', 'Central-100', 'swilliams@company.com'),
('mjackson', 'Information Technology', 'Central-150', 'mjackson@company.com'),
('rwhite', 'Information Technology', 'Central-200', 'rwhite@company.com'),

-- Departamento de RH
('bharris', 'Human Resources', 'West-110', 'bharris@company.com'),
('cmartin', 'Human Resources', 'North-220', 'cmartin@company.com'),

-- Outros departamentos
('dthompson', 'Operations', 'South-400', 'dthompson@company.com'),
('egarcia', 'Legal', 'East-550', 'egarcia@company.com'),
('fmartinez', 'Research', 'West-600', 'fmartinez@company.com');

-- ============================================
-- Confirmação de inserção dos dados
-- ============================================

SELECT 'Dados de exemplo inseridos com sucesso!' AS Status;

-- Verificar totais
SELECT COUNT(*) AS 'Total de Tentativas de Login' FROM log_in_attempts;
SELECT COUNT(*) AS 'Total de Funcionários' FROM employees;