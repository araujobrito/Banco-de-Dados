create database db_banco_escola;
use db_banco_escola;


create table Aluno(
	id_aluno int auto_increment primary key,
    nome_aluno varchar(100) not null,
    data_nasc date not null,
    genero enum ("f", "m", "outro") not null,
    data_cadastro date not null
);

describe Aluno; /* Exibe a estrutura da tabela */

select * from Curso; /* Exibe todos os dados da tabela e estrutura */

/* Criação da tabela curso*/

create table Curso(
	id_curso int auto_increment primary key,
    nome_curso varchar(50) not null,
    descricao varchar(100) not null,
    data_cadastro date not null,
    valor_curso decimal(7,2) not null
);

insert into Aluno(nome_aluno, data_nasc, genero, data_cadastro) values
("Matheus Araújo", "1985-08-04", "m", "2026-05-18"),
("Ana", "2000-10-04", "f", "2026-05-18");

insert into Curso(nome_curso, descricao, data_cadastro, valor_curso) values
("Back-End com Java", "Curso voltado para aprofundamento da Linguagem Java", "2026-05-20", 3200.00);

Alter table Aluno /* Altera a estrutura da tabela */
add column email_aluno varchar(50) not null 
default "sem_email@exemplo.com";

Alter table Curso
add column carga_horaria varchar(50) not null
default "60h";

/* Deletar coluna */
Alter table Curso drop column carga_horaria;

Update Curso
set carga_horaria = 40
where id_curso = 1;

Update Curso
set carga_horaria = "200h"
where id_curso = 6;

delete from Curso
where id_curso = 2;

/* Criar tabela professor - 8 atributos - 5 registros*/

create table Professor(
	id_professor int auto_increment primary key,
    nome_professor varchar(50) not null,
    data_nascimento date not null,
    data_cadastro date not null,
    cpf_professor char(14) not null,
    endereco varchar(100) not null,
    escola varchar(50) not null,
    turma varchar(50) not null
);

describe Professor;

delete from Professor;

select * from Professor;

insert into Professor(nome_professor, data_nascimento, data_cadastro, cpf_professor, endereco, escola, turma) values
("Ricardo Souza", "1970-05-05", "2026-05-20", "12345678952450", "Rua dos Alfinetes", "Hogwarts", "Sonserina"),
("Felipe Carlos", "1975-07-12", "2026-05-20", "12345678951452", "Rua da Casa", "Escola Teodoro", "Turma manhã"),
("Bruno Silva", "1990-02-25", "2026-05-20", "123.455.789.20", "Rua do Apartamento", "Escola João XX", "Turma de Java"),
("Carlos Santana", "1987-12-05", "2026-05-20", "123.456.789.45", "Rua das Flores", "Escola Estadual XXI", "Turma de Inglês I"),
("Santiago Carlos", "1970-05-30", "2026-05-20", "123.456.789.12", "Rua das Acácias", "Etec XXI", "Turma de ADS");

alter table Professor
add column salario decimal(6,2)
default 00.00;

Update Professor
set salario = 2200.00
where id_professor = 7;

Update Professor
set salario = 2000.00
where id_professor = 8;

Update Professor
set salario = 2600.00
where id_professor = 9;

Update Professor
set salario = 3000
where id_professor = 10;

Update Professor
set salario = 5000.00
where id_professor = 11;

alter table Professor
add column estado_civil enum("casado(a)", "solteiro(a)", "divorciado(a)")
default "solteiro(a)";

Update Professor
set estado_civil = "casado(a)"
where id_professor = 11;
