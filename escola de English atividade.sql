CREATE DATABASE db_english;
USE db_english;

CREATE TABLE tb_aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_cadastro DATE NOT NULL,
    email_aluno VARCHAR(50) NOT NULL,
    telefone_aluno VARCHAR(20) NOT NULL,
    cpf_aluno CHAR(14) NOT NULL
);

INSERT INTO tb_aluno (nome_aluno, data_nascimento, data_cadastro, email_aluno, telefone_aluno, cpf_aluno) VALUES
('João Silva', '2000-05-10', '2026-02-23', 'joao@gmail.com', '11999991111', '123.456.789-00'),
('Maria Souza', '1999-08-21', '2026-02-14', 'maria@gmail.com', '11999992222', '234.567.890-11'),
('Pedro Santos', '2001-02-15', '2026-04-13', 'pedro@gmail.com', '11999993333', '345.678.901-22'),
('Ana Lima', '2002-11-30', '2026-04-10', 'ana@gmail.com', '11999994444', '456.789.012-33'),
('Carlos Mendes', '1998-07-19', '2026-04-25', 'carlos@gmail.com', '11999995555', '567.890.123-44'),
('Fernanda Rocha', '2003-01-25', '2026-06-20', 'fernanda@gmail.com', '11999996666', '678.901.234-55');


CREATE TABLE tb_professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email_professor VARCHAR(50) NOT NULL,
    cpf_professor CHAR(14) NOT NULL,
    telefone_professor VARCHAR(20) NOT NULL,
    disciplina_professor VARCHAR(30) NOT NULL,
    tipo_contrato VARCHAR(20) NOT NULL
);

INSERT INTO tb_professor (nome_professor, data_nascimento, email_professor, cpf_professor, telefone_professor, disciplina_professor, tipo_contrato) VALUES
('John Smith', '1985-04-12', 'john@englishschool.com', '123.456.789-00', '11999991111', 'Grammar', 'CLT'),
('Emily Johnson', '1990-08-20', 'emily@englishschool.com', '234.567.890-11', '11999992222', 'Conversation', 'CLT'),
('Michael Brown', '1988-03-15', 'michael@englishschool.com', '345.678.901-22', '11999993333', 'Listening', 'CLT'),
('Sarah Davis', '1992-11-30', 'sarah@englishschool.com', '456.789.012-33', '11999994444', 'Writing', 'CLT'),
('David Wilson', '1987-07-19', 'david@englishschool.com', '567.890.123-44', '11999995555', 'Reading', 'CLT'),
('Anna Taylor', '1993-01-25', 'anna@englishschool.com', '678.901.234-55', '11999996666', 'Pronunciation', 'CLT');


CREATE TABLE tb_responsavel (
    id_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    nome_responsavel VARCHAR(100) NOT NULL,
    cpf_responsavel CHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone_responsavel VARCHAR(20) NOT NULL,
    endereco_responsavel VARCHAR(100) NOT NULL,
    cep_responsavel CHAR(8) NOT NULL
);

INSERT INTO tb_responsavel (nome_responsavel, cpf_responsavel, data_nascimento, telefone_responsavel, endereco_responsavel, cep_responsavel) VALUES
('Carlos Oliveira', '123.456.789-00', '1980-05-12', '11999991111', 'Rua das Flores, 120', '06700000'),
('Mariana Souza', '234.567.890-11', '1978-08-25', '11999992222', 'Av. Brasil, 450', '06701000'),
('Roberto Lima', '345.678.901-22', '1985-03-18', '11999993333', 'Rua Central, 89', '06702000'),
('Fernanda Alves', '456.789.012-33', '1982-11-07', '11999994444', 'Rua São Paulo, 300', '06703000');


CREATE TABLE tb_curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(50) NOT NULL,
    idioma_curso VARCHAR(30) NOT NULL,
    nivel_curso VARCHAR(20) NOT NULL,
    duracao_meses INT NOT NULL,
    valor_curso DECIMAL(8,2) NOT NULL
);

INSERT INTO tb_curso (nome_curso, idioma_curso, nivel_curso, duracao_meses, valor_curso) VALUES
('English Basic', 'Inglês', 'Básico', 6, 350.00),
('English Intermediate', 'Inglês', 'Intermediário', 8, 450.00),
('English Advanced', 'Inglês', 'Avançado', 12, 600.00),
('Business English', 'Inglês', 'Profissional', 6, 700.00),
('English Conversation', 'Inglês', 'Conversação', 4, 300.00);


CREATE TABLE tb_turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_professor INT NOT NULL,
    horario_turma TIME NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    vagas_turma INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES tb_curso(id_curso),
    FOREIGN KEY (id_professor) REFERENCES tb_professor(id_professor)
);

INSERT INTO tb_turma (id_curso, id_professor, horario_turma, dia_semana, data_inicio, data_fim, vagas_turma) VALUES
(1, 1, '08:00:00', 'Segunda-feira', '2026-07-01', '2026-12-20', 25),
(2, 2, '09:30:00', 'Terça-feira', '2026-07-01', '2026-12-20', 20),
(3, 3, '14:00:00', 'Quarta-feira', '2026-07-01', '2026-12-20', 30),
(4, 4, '16:00:00', 'Quinta-feira', '2026-07-01', '2026-12-20', 18),
(5, 5, '18:30:00', 'Sexta-feira', '2026-07-01', '2026-12-20', 22),
(1, 6, '10:00:00', 'Sábado', '2026-07-01', '2026-12-20', 15);


CREATE TABLE tb_pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    valor_pagamento DECIMAL(8,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL,
    forma_pagamento VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES tb_aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES tb_turma(id_turma)
);

INSERT INTO tb_pagamento (id_aluno, id_turma, valor_pagamento, data_vencimento, data_pagamento, status_pagamento, forma_pagamento) VALUES
(1, 1, 350.00, '2026-07-10', '2026-07-05', 'Pago', 'Pix'),
(2, 2, 450.00, '2026-07-10', '2026-07-08', 'Pago', 'Cartão'),
(3, 3, 600.00, '2026-07-10', '2026-07-09', 'Pendente', 'Boleto');