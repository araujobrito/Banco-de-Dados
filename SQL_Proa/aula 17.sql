create database banco_api;
use banco_api;

create table tb_user(
id_user int auto_increment primary key,
nome_user varchar(100) not null,
tel_user char(14) not null,
cpf_user char(14) not null unique,
email_user varchar(50) not null unique,
data_nasc date not null,
ende_user varchar(100)
);

insert into tb_user (nome_user, tel_user, cfp_user, data_nasc, ende_user) values
('João Victor','(11)93766-5216','12345678999','araujodebritoj@gmail.com','2003-8-25', 'rua tito 45'),
('julia','(11)91238-4567','459719027486','julia@gmail.com', '1987-6-14', 'avenida publicidade 56'),
('nakura','(11)98945-6123','189563253412','nakura@hotmail.com','2001-4-30','avenida são jorge 105')
select *from tb_user;
