# Banco de Dados do Linkedin com o Postgres

## Autores:
- José Pedro Dresch
- Phelipe Gabriel Lima da Silva
- Murilo Granemann de Souza
- Luis Eduardo Weigert Weiss

## Requisitos

- Linux
- PostgreSQL instalado
- Git instalado

---

# 1. Clonar o repositório

```bash
git clone https://github.com/Jose-Pedro-Dresch/bd_fase_3_dbms_implementation.git
cd bd_fase_3_dbms_implementation
```

---

# 2. Criar o banco de dados

Criar o banco `linkedin`:

```bash
sudo -u postgres createdb linkedin
```

---

# 3. Entrar no PostgreSQL

```bash
sudo -u postgres psql
```

Listar os bancos:

```sql
\l
```

Conectar ao banco `linkedin`:

```sql
\c linkedin
```

Sair do PostgreSQL:

```sql
\q
```

---

# 4. Criar as tabelas e inserir os dados

Executar o script SQL principal:

```bash
sudo -u postgres psql -d linkedin -f DDL_schema.sql
```

```bash
sudo -u postgres psql -d linkedin -f DML_inserts.sql
```

---

# 5. Verificar os dados

Entrar no banco:

```bash
sudo -u postgres psql -d linkedin
```

Exemplo de consulta:

```sql
SELECT * FROM conta;
```

Sair:

```sql
\q
```

---

# 6. Gerar o backup lógico

(apenas se você quiser, pois o backup já está feito na pasta ./linkedin_bd_backup)

O backup será salvo em `/tmp`, pois o usuário `postgres`
possui permissão de escrita nessa pasta.

```bash
sudo -u postgres pg_dump -v -f /tmp/backup.sql linkedin
```

Copiar o backup para o projeto:

```bash
sudo cp /tmp/backup.sql ./linkedin_db_backup/
```

---

# 7. Simular perda de dados

Entrar no PostgreSQL:

```bash
sudo -u postgres psql
```

Apagar o banco:

```sql
DROP DATABASE linkedin WITH (FORCE);
```

Sair:

```sql
\q
```

---

# 8. Restaurar o banco a partir do backup

Criar novamente o banco vazio:

```bash
sudo -u postgres createdb linkedin
```

Restaurar o backup:

```bash
sudo -u postgres psql -d linkedin -f ./linkedin_db_backup/backup.sql
```

---

# 9. Verificar a restauração

Entrar no banco:

```bash
sudo -u postgres psql -d linkedin
```

Executar uma consulta:

```sql
SELECT * FROM conta;
```

Sair:

```sql
\q
```

# Pronto!
