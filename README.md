# 🔍 SQL Security Filters

Aplicação de filtros SQL para análise de logs de segurança, investigação de incidentes e gestão de dados em cenários de cibersegurança.

## 📋 Descrição

Este projeto demonstra o uso estratégico de consultas SQL aplicadas a cenários reais de segurança da informação. Utilizando operadores como `AND`, `OR`, `NOT` e `LIKE`, foram desenvolvidas queries para filtrar registros em bancos de dados, detectar incidentes de segurança, segmentar funcionários por departamento e identificar padrões suspeitos em tentativas de login.

O projeto simula um ambiente corporativo onde é necessário investigar eventos de segurança, aplicar atualizações em máquinas específicas e analisar logs de acesso.

## 🎯 Objetivos do Projeto

- Demonstrar domínio técnico em SQL aplicado à segurança
- Investigar incidentes através de análise de logs
- Filtrar dados de forma eficiente usando operadores lógicos
- Identificar padrões suspeitos em tentativas de login
- Segmentar funcionários para aplicação de updates de segurança

## 🛠️ Tecnologias Utilizadas

- **SQL** (Structured Query Language)
- **MySQL/MariaDB** (compatível com outros SGBDs)
- Operadores: `AND`, `OR`, `NOT`, `LIKE`, `WHERE`
- Wildcards: `%` (para padrões de busca)

## 📁 Estrutura do Projeto

```
sql-security-filters/
│
├── README.md                    # Documentação do projeto
├── database_setup.sql           # Criação do banco de dados e tabelas
├── sample_data.sql              # Dados de exemplo para testes
├── security_queries.sql         # Todas as queries de segurança
└── query_results.md             # Exemplos de resultados das queries
```

## 🚀 Como Usar

### Pré-requisitos

- MySQL, MariaDB ou PostgreSQL instalado
- Cliente SQL (MySQL Workbench, DBeaver, ou terminal)

### Configuração do Ambiente

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/fernando-acq/sql-security-filters.git
   cd sql-security-filters
   ```

2. **Crie o banco de dados:**
   ```bash
   mysql -u seu_usuario -p < database_setup.sql
   ```

3. **Insira os dados de exemplo:**
   ```bash
   mysql -u seu_usuario -p security_db < sample_data.sql
   ```

4. **Execute as queries de segurança:**
   ```bash
   mysql -u seu_usuario -p security_db < security_queries.sql
   ```

### Execução Manual

Você também pode copiar e executar as queries individualmente no seu cliente SQL favorito.

## 📊 Cenários de Investigação

### 🔴 Cenário 1: Tentativas de Login Falhadas Após o Expediente

**Objetivo:** Identificar possível incidente de segurança ocorrido fora do horário comercial.

**Query:**
```sql
SELECT *
FROM log_in_attempts
WHERE login_time > '18:00:00' AND success = 0;
```

**Resultado:** Lista todas as tentativas de login mal-sucedidas após as 18:00.

---

### 🟡 Cenário 2: Atividade Suspeita em Datas Específicas

**Objetivo:** Investigar evento suspeito ocorrido em 2022-05-09 e dia anterior.

**Query:**
```sql
SELECT *
FROM log_in_attempts
WHERE login_date = '2022-05-09' OR login_date = '2022-05-08';
```

**Resultado:** Recupera todos os registros de login das duas datas.

---

### 🟠 Cenário 3: Tentativas de Login Fora do México

**Objetivo:** Investigar atividade suspeita originada fora do México.

**Query:**
```sql
SELECT *
FROM log_in_attempts
WHERE NOT country LIKE 'MEX%';
```

**Resultado:** Exclui registros do México usando wildcard para capturar variações (MEX, MEXICO).

---

### 🔵 Cenário 4: Funcionários do Marketing no Prédio Leste

**Objetivo:** Identificar máquinas do departamento de Marketing no prédio Leste para aplicar updates.

**Query:**
```sql
SELECT *
FROM employees
WHERE department = 'Marketing' AND office LIKE 'East%';
```

**Resultado:** Lista funcionários de Marketing em escritórios como East-170, East-460, etc.

---

### 🟢 Cenário 5: Funcionários de Finanças ou Vendas

**Objetivo:** Aplicar atualização de segurança em máquinas dos departamentos de Vendas e Finanças.

**Query:**
```sql
SELECT *
FROM employees
WHERE department = 'Finance' OR department = 'Sales';
```

**Resultado:** Retorna todos os colaboradores dos dois departamentos.

---

### 🟣 Cenário 6: Funcionários Fora do Departamento de TI

**Objetivo:** Identificar colaboradores que ainda não receberam update (TI já foi atualizado).

**Query:**
```sql
SELECT *
FROM employees
WHERE NOT department = 'Information Technology';
```

**Resultado:** Lista todos os funcionários exceto os de TI.

## 📈 Estrutura do Banco de Dados

### Tabela: `log_in_attempts`

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| attempt_id | INT | ID único da tentativa |
| username | VARCHAR | Nome do usuário |
| login_date | DATE | Data da tentativa |
| login_time | TIME | Hora da tentativa |
| country | VARCHAR | País de origem |
| ip_address | VARCHAR | Endereço IP |
| success | BOOLEAN | 1 = sucesso, 0 = falha |

### Tabela: `employees`

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| employee_id | INT | ID único do funcionário |
| username | VARCHAR | Nome de usuário |
| department | VARCHAR | Departamento |
| office | VARCHAR | Localização do escritório |
| email | VARCHAR | Email corporativo |

## 💡 Operadores SQL Utilizados

### `AND`
Combina múltiplas condições que devem ser verdadeiras simultaneamente.
```sql
WHERE login_time > '18:00:00' AND success = 0
```

### `OR`
Retorna registros onde pelo menos uma condição é verdadeira.
```sql
WHERE department = 'Finance' OR department = 'Sales'
```

### `NOT`
Exclui registros que atendem à condição especificada.
```sql
WHERE NOT department = 'Information Technology'
```

### `LIKE` com Wildcards
Busca padrões em strings. O `%` representa qualquer sequência de caracteres.
```sql
WHERE country LIKE 'MEX%'  -- Captura MEX, MEXICO, etc.
WHERE office LIKE 'East%'   -- Captura East-170, East-460, etc.
```

## 🎓 Conceitos Aplicados

- **Análise de Logs de Segurança:** Investigação de tentativas de acesso
- **Filtros Complexos:** Combinação de múltiplos operadores
- **Pattern Matching:** Uso de wildcards para buscas flexíveis
- **Segmentação de Dados:** Organização por departamento e localização
- **Resposta a Incidentes:** Queries orientadas a cenários reais

## 🔒 Aplicações em Cibersegurança

Este projeto demonstra habilidades essenciais para:

- ✅ **SOC Analyst:** Análise de logs e detecção de anomalias
- ✅ **Incident Response:** Investigação de eventos de segurança
- ✅ **SIEM Operations:** Criação de queries para ferramentas como Splunk
- ✅ **Threat Hunting:** Busca proativa por ameaças em logs
- ✅ **Compliance:** Auditoria de acessos e conformidade

## 📚 Aprendizados

- Aplicação prática de SQL em contextos de segurança
- Análise eficiente de grandes volumes de dados de log
- Identificação de padrões suspeitos através de filtros
- Otimização de queries para investigações rápidas
- Documentação clara de processos de investigação

## 🤝 Contribuições

Sugestões e melhorias são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 👤 Autor

**Fernando Acquesta**
- GitHub: [@fernando-acq](https://github.com/fernando-acq)
- LinkedIn: [Fernando Acquesta](https://www.linkedin.com/in/fernando-acquesta-cybersecurity)

---

⭐ Se este projeto foi útil para seus estudos em SQL e segurança, considere dar uma estrela no repositório!
