-- ============================================
-- SQL Security Filters - Database Setup
-- Criação do banco de dados e estrutura das tabelas
-- ============================================

-- Cria o banco de dados
CREATE DATABASE IF NOT EXISTS security_db;
USE security_db;

-- ============================================
-- Tabela: log_in_attempts
-- Armazena tentativas de login do sistema
-- ============================================

CREATE TABLE IF NOT EXISTS log_in_attempts (
    attempt_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    login_date DATE NOT NULL,
    login_time TIME NOT NULL,
    country VARCHAR(50) NOT NULL,
    ip_address VARCHAR(15) NOT NULL,
    success BOOLEAN NOT NULL,
    INDEX idx_date (login_date),
    INDEX idx_time (login_time),
    INDEX idx_country (country),
    INDEX idx_success (success)
);

-- ============================================
-- Tabela: employees
-- Armazena informações dos funcionários
-- ============================================

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    department VARCHAR(50) NOT NULL,
    office VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    INDEX idx_department (department),
    INDEX idx_office (office)
);

-- ============================================
-- Confirmação de criação das tabelas
-- ============================================

SELECT 'Banco de dados e tabelas criados com sucesso!' AS Status;