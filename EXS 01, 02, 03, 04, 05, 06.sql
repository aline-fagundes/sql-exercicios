# EXERCÍCIO 1
create table clientes(
	codigo int primary key auto_increment,
    nome varchar(40),
    cidade varchar(20),
    idade int
);
    
select * from clientes;

insert into clientes(nome, cidade, idade) values('Erica', 'Curitiba', 28);
insert into clientes(nome, cidade, idade) values('Lucas', 'Blumenau', 16);
insert into clientes(nome, cidade, idade) values('Larissa', 'Florianopolis', 36);
insert into clientes(nome, cidade, idade) values('Murilo', 'Joinville', 23);
insert into clientes(nome, cidade, idade) values('Cristiane', 'Blumenau', 31);
insert into clientes(nome, cidade, idade) values('Robson', 'Joinville', 42);
insert into clientes(nome, idade) values('Mariana', 37);
insert into clientes(nome, cidade, idade) values('Jean', 'Blumenau', 43);
insert into clientes(nome, cidade, idade) values('Luana', 'Pomerode', 19);
insert into clientes(nome, cidade, idade) values('Cleber', 'Brusque', 34);
insert into clientes(nome, cidade, idade) values('Hellen', 'Blumenau', 28);
insert into clientes(nome, cidade, idade) values('Paulo', 'Joinville', 44);
insert into clientes(nome, cidade, idade) values('Alessandra', 'São Paulo', 28);
insert into clientes(nome, cidade, idade) values('Denis', 'Blumenau', 37);
insert into clientes(nome, cidade, idade) values('Bianca', 'Campinas', 23);
insert into clientes(nome, cidade, idade) values('Gabriel', 'São Paulo', 26);

-- 1) Selecionar todos os registros da tabela.
select * from clientes;


-- 2) Contar quantos registros possui a tabela.
select count(*) as qtd_clientes from clientes;


-- 3) Retornar a maior idade e o nome da pessoa com essa idade.
select nome from clientes where idade = (select max(idade) from clientes);


-- 4) Exiba todas as cidades registradas sem repetição.
select distinct cidade from clientes;


-- 5) Exibir todas as cidades registradas e a quantidade de pessoas que moram na respectivacidade.
select count(*), cidade from clientes group by cidade;


-- 6) Exibir o nome da pessoa e a idade, onde a cidade seja nula.
select nome, idade from clientes where cidade is null;


-- 7) Exibir a media das idades arredondada.
select round(avg(idade),0) as media_idades from clientes;


-- 8) Informar o nome e a idade da pessoa mais jovem.
select nome, idade from clientes where idade = (select min(idade) from clientes);


-- 9) Exibir o nome e a idade de todas as pessoas com idade maior ou igual a media de todas as idades cadastradas.
select nome, idade from clientes where idade >= (select avg(idade) from clientes);


-- 10) Listar nome, cidade e idade de todas as pessoas com idade entre 20 e 30 anos.
select nome, cidade, idade from clientes where idade > 20 and idade < 30;
select nome, cidade, idade from clientes where idade between 20 and 30;


-- 11) Exibir o nome, cidade e idade de todos os clientes que moram em Blumenau e tem idade maior ou igual a 30 anos.
select nome, cidade, idade from clientes where cidade = 'Blumenau' and idade >= 30;


-- 12) Listar o nome e cidade de todos os clientes que moram em Florianopolis ou Curitiba.
select nome, cidade from clientes where cidade = 'Florianopolis' or cidade = 'Curitiba';


-- 13) Listar o nome de todos os clientes que contenham a letra L.
select * from clientes where nome like '%l%';


-- 14) Exibir todos os nomes em ordem.
select * from clientes order by nome;


-- 15) Alterar para Blumenau todos os registros onde a cidade seja NULL.
update clientes set cidade = 'Blumenau' where cidade is null;


-- 16) Excluir todos os clientes onde a cidade seja diferente de Blumenau.
delete from clientes WHERE cidade != 'Blumenau';


-- 17) Excluir a tabela.
drop table clientes;





# EXERCÍCIO 2
create table produtos(
	codigo int primary key auto_increment,
    nome varchar(50),
    marca varchar(25),
    valor double,
    estoque int
);
    
select * from produtos;

insert into produtos(nome, marca, valor, estoque) values('Teclado', 'Microsoft', 220.00, 60);
insert into produtos(nome, marca, valor, estoque) values('Monitor 32', 'Samsung', 3700.00, 20);
insert into produtos(nome, marca, valor, estoque) values('Mouse', 'Logitech', 129.90, 45);
insert into produtos(nome, marca, valor, estoque) values('Impressora', 'Epson', 430.00, 15);
insert into produtos(nome, marca, valor, estoque) values('Mouse', 'Microsoft', 199.90, 50);
insert into produtos(nome, marca, valor, estoque) values('Monitor 27', 'LG', 1990.00, 30);
insert into produtos(nome, marca, valor, estoque) values('Cadeira gamer', 'Multilaser', 1170.00, 20);
insert into produtos(nome, marca, valor, estoque) values('Teclado', 'Dell', 110.00, 50);
insert into produtos(nome, marca, valor, estoque) values('Mouse', 'HP', 80.00, 70);
insert into produtos(nome, marca, valor, estoque) values('Placa de vídeo - GeForce GTX 1660', 'ASUS', 2800.00, 10);
insert into produtos(nome, marca, valor, estoque) values('SSD de 256GB', 'Kingston', 400.00, 15);
insert into produtos(nome, marca, valor, estoque) values('Processador Core i5 - 10º geração', 'Intel', 1800.00, 10);
insert into produtos(nome, marca, valor, estoque) values('Mouse', 'Multilaser', 44.90, 70);
insert into produtos(nome, marca, valor, estoque) values('Monitor 23', 'Dell', 1080.00, 40);
insert into produtos(nome, marca, valor, estoque) values('Teclado', 'HP', 199.99, 25);

-- 1) Listar o nome das marcas (sem repetição) e a quantidade de produtos de cada.
select count(*), marca from produtos group by marca; 


-- 2) Media dos valores de todos os produtos.
select avg(valor) as valor_medio from produtos;


-- 3) Exibir o nome da marca (sem repetição) e a soma dos produtos que fazem parte da respectiva marca.
select marca, sum(estoque) as estoque_total from produtos group by marca;


-- 4) Exibir o nome do produto e o valor em ordem decrescente (do mais caro para o mais barato).
select nome, valor from produtos order by valor desc;


-- 5) Nome e valor do produto mais caro.
select nome, valor from produtos where valor = (select max(valor) from produtos);


-- 6) Exibir todos os produtos, onde seu valor seja maior ou igual a media de todos os valores cadastrados.
select * from produtos where valor >= (select avg(valor) from produtos);


-- 7) Informar o nome do produto, marca, valor e quantidade em estoque do produto que possui maior estoque.
select nome, marca, valor, estoque from produtos where estoque = (select max(estoque) from produtos);


-- 8) Exibir o nome do produto, marca e valor, onde os valores dos produtos estejam entre R$100,00 e R$500,00.
select nome, marca, valor from produtos where valor between 100.00 and 500.00;


-- 9) Listar o nome, marca e valor de todos os produtos que sejam mouses, exiba em ordem crescente de preço (do menor para o maior).
select nome, marca, valor from produtos where nome = 'Mouse' order by valor;


-- 10) Exiba o nome do produto e a quantidade de letras.
select nome as palavra, length(nome) as quantidade_letras from produtos;


-- 11) Troque a marca Dell para Alienware.
update produtos set marca = 'Alienware' where marca = 'Dell';


-- 12) Excluir a tabela.
drop table produtos;





# EXERCÍCIO 3
create table alunos(
	nome varchar(40) primary key,
    turma varchar(10),
    nota_1 double,
    nota_2 double,
    nota_3 double,
    turno varchar(10)
);
    
select * from alunos;

insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Ana Paula', '7A', 5, 8, 7, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Caio Neves', '8B', 3, 4, 2, 'Matutino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Isabella Fontana', '7C', 9, 8.5, 9, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Daniel Luz', '8A', 2, 5, 4, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Gabriela Braga', '8A', 10, 10, 10, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Ellen Souza', '7A', 5, 8, 7, 'Matutino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Luciana Biltz', '8B', 9.5, 10, 10, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Paulo Almeida', '8A', 10, 10, 10, 'Matutino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Carla Malta', '7B', 3, 7, 9, 'Matutino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Diogo Andrade', '8C', 10, 9, 10, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Monica Mota', '8A', 7, 7, 8, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Juliana Lima', '8C', 9, 8, 2, 'Vespertino');
insert into alunos(nome, turma, nota_1, nota_2, nota_3, turno) values('Marcelo Matos', '7A', 9, 10, 5, 'Matutino');

-- 1) Utilizando condicional IF, retorne o nome do aluno, media e a situação (media 7 ou superior aprovado, caso contrario reprovado).
select 
	nome, 
	media,
	 case 
		when media >= 7 
        then 'Aprovado!' 
        else 'Reprovado!'
        end as situacao 
    from (select nome, round((nota_1 + nota_2 + nota_3)/3, 2) as media from alunos) as tabela_medias;


-- 2) Exibir a quantidade de alunos por turno, exiba o nome do turno e a quantidade.
select turno, count(*) as qtd_alunos from alunos group by turno;


-- 3) Exibir a quantidade de alunos por turma, exiba o nome da turma e a quantidade.
select turma, count(*) as qtd_alunos from alunos group by turma;


-- 4) Nome e media de todos os alunos com media maior ou igual a 7.
select 
	nome, 
	media
    from (select nome, round((nota_1 + nota_2 + nota_3)/3, 2) as media from alunos) as tabela_medias
    where media >= 7;


-- 5) Quantidade de alunos do turno vespertino reprovados.
select count(*) from alunos where turno = 'Vespertino' and (nota_1 + nota_2 + nota_3)/3 < 7;


-- 6) Nome de todos os alunos com a maior media.
with tabela_medias as(
	select 
    nome, 
    round((nota_1 + nota_2 + nota_3)/3, 2) as media 
    from alunos
), 
maior_media as(
	select max(media) as maior_media from tabela_medias
)
select 
	nome, 
	media
    from tabela_medias
    where media in (select maior_media from maior_media);


-- 7) Exibir a media de cada turma.
select turma, roudn(avg((nota_1 + nota_2 + nota_3)/3), 2) as media from alunos group by turma;


-- 8) Migrar os alunos da 8B para a 8A.
update alunos set turma = '8A' where turma = '8B';


-- 9) Remover tabela.
drop table alunos;





# EXERCÍCIO 4
create table cargos(
	codigo int primary key auto_increment,
    nome_cargo varchar(40),
    salario double
);
    
select * from cargos;

create table colaboradores(
	codigo int primary key auto_increment,
    nome_colaborador varchar(40),
    nascimento_colaborador date,
	genero_colaborador varchar(10),
    estado_trabalho varchar(2),
    cidade_trabalho varchar(20),
    cargo_codigo int
);

alter table colaboradores add constraint fk_cargo foreign key(cargo_codigo) references cargos(codigo);

insert into cargos(nome_cargo, salario) values
('Desenvolvedor', 3000.00), 
('Analista', 4500.00), 
('Arquiteto de software', 6200.00), 
('Administrador de banco de dados', 7700.00), 
('Gerente de projetos', 9000.00);

select * from cargos;

insert into colaboradores(nome_colaborador, nascimento_colaborador, cargo_codigo, estado_trabalho, cidade_trabalho, genero_colaborador) values
('Jeferson', '1973-05-19', 1, 'SC', 'Blumenau', 'Masculino'),
('Larissa', '1991-01-22', 5, 'SC', 'Joinville', 'Feminino'),
('Cleber', '1987-03-18', 2, 'PR', 'Curitiba', 'Masculino'),
('Luciano', '1995-08-09', 1, 'SC', 'Blumenau', 'Masculino'),
('Jessica', '1988-08-22', 4, 'SC', 'Florianopolis', 'Feminino'),
('Guilherme', '1982-11-16', 2, 'SC', 'Blumenau', 'Masculino'),
('Marcelo', '1993-04-15', 2, 'PR', 'Londrina', 'Masculino'),
('Brenda', '1992-02-17', 1, 'SC', 'Joinville', 'Feminino'),
('Rebeca', '1984-06-26', 4, 'SC', 'Blumenau', 'Feminino'),
('Cristiano', '1983-07-02', 1, 'SC', 'Florianopolis', 'Masculino'),
('Eder', '1991-11-10', 1, 'SC', 'Blumenau', 'Masculino'),
('Wiliam', '1992-12-17', 2, 'PR', 'Curitiba', 'Masculino'),
('Vanessa', '1996-09-29', 1, 'SC', 'Blumenau', 'Feminino'),
('Robson', '1996-09-29', 1, 'PR', 'Londrina', 'Masculino'),
('Tatiana', '1990-02-03', 5, 'PR', 'Curitiba', 'Feminino'),
('Henrique', '1999-10-07', 1, 'SC', 'Blumenau', 'Masculino'),
('Lorena', '1996-04-20', 1, 'SC', 'Joinville', 'Feminino'),
('Carla', '1988-09-28', 4, 'PR', 'Curitiba', 'Feminino'),
('Alexandre', '1982-07-17', 2, 'SC', 'Blumenau', 'Masculino');

select * from colaboradores;

-- 1) Listar o nome do colaborador, nome do cargo e salario.
select col.nome_colaborador as nome, car.nome_cargo as cargo, car.salario 
from cargos car, colaboradores col 
where col.cargo_codigo = car.codigo;


-- 2) Listar todos os cargos (nome) e a quantidade de colaboradores em cada cargo.
select col.cargo_codigo, car.nome_cargo as cargo, count(*) as qtd_colaboradores
from cargos car, colaboradores col 
where col.cargo_codigo = car.codigo
group by car.nome_cargo;


-- 3) Media salarial por genero.
select round(avg(car.salario), 1) as media_salarial, col.genero_colaborador as genero
from cargos car, colaboradores col 
where col.cargo_codigo = car.codigo
group by col.genero_colaborador;


-- 4) Listar o nome e a data de nascimento de todos que possuem idade entre 20 e 30 anos.
select *
from (
	select 
		nome_colaborador, 
		nascimento_colaborador, 
		truncate((datediff(curdate(), nascimento_colaborador))/365, 0) as idade
	from colaboradores
) as idades
where idade between 20 and 30
order by idade;


-- 5) Quantidade de pessoas que trabalham em cada estado.
select estado_trabalho as estado, count(*) as qtd_colaboradores from colaboradores group by estado_trabalho;


-- 6) Quantidade de pessoas que trabalham em cada cidade.
select cidade_trabalho as cidade, count(*) as qtd_colaboradores from colaboradores group by cidade_trabalho;


-- 7) Quantidade de mulheres com idade superior a 30 anos e que atuam no estado do Parana.
select count(*) as selecao_mulheres
from (
    select 
		genero_colaborador,
        estado_trabalho,
        Timestampdiff(year, nascimento_colaborador, curdate()) as idade
	from colaboradores
) as tabela_informacoes
where 
	idade > 30 
    and genero_colaborador = 'Feminino' 
    and estado_trabalho = 'PR';


-- 8) Media dos salarios por cidade.
select col.cidade_trabalho, avg(car.salario) as media_salarial
from colaboradores col
inner join cargos car 
on col.cargo_codigo = car.codigo
group by col.cidade_trabalho; 


-- 9) Media dos salarios de todos os colaboradores cadastrados.
select round(avg(car.salario), 2) as media_salarial
from colaboradores col
inner join cargos car 
on col.cargo_codigo = car.codigo; 


-- 10) Exibir todos os dados do colaborador mais velho.
select 
	col.codigo, 
    col.nome_colaborador, 
    col.nascimento_colaborador, 
    col.genero_colaborador, 
    col.estado_trabalho,
    col.cidade_trabalho,
    col.cargo_codigo,
    car.nome_cargo,
    car.salario
from colaboradores col
inner join cargos car 
on col.cargo_codigo = car.codigo
where nascimento_colaborador = (select min(nascimento_colaborador) from colaboradores); 


-- 11) Exibir a quantidade de pessoas que nasceram na decada de 90.
select count(*) as nascidos_1990 from colaboradores where nascimento_colaborador between '1990-01-01' and '1999-12-31';


-- 12) Excluir a tabela.
drop table colaboradores;
drop table cargos;





# EXERCÍCIO 5
create table marcas (
    codigo_marca int primary key auto_increment,
    nome_marca varchar(20)
);

create table produtos(
    codigo_produto int primary key auto_increment,
    nome_produto varchar(50),
    valor_produto float,
    quantidade_estoque int,
    codigo_marca int,
    constraint fk_marca foreign key (codigo_marca) references marcas(codigo_marca)
); 

insert into marcas(nome_marca) values
    ('Nike'),
    ('Adidas'),
    ('Colcci'),
    ('Tommy Hilfiger'),
    ('Hering'),
    ('Vans'),
    ('Vizzano'),
    ('Aramis'),
    ('Reserva');

select * from marcas;
    
insert into produtos(nome_produto, valor_produto, quantidade_estoque, codigo_marca) values
    ('Tenis Adidas Performance', 345.00, 765, 2),
    ('Tenis Nike Revolution', 769.00, 1235, 1),
    ('Blusa feminina rosa', 99.00, 754.00, 6),
    ('Camisa social branca', 180.99, 235, 8),
    ('Bota Chelsea Lacey', 322.00, 98, 3),
    ('Blusa moletom Romance', 150.76, 324, 3),
    ('Camiseta preta base', 79.00, 1235, 4),
    ('Bolsa Colcci Lisa', 249.00, 112, 3),
    ('Camisa Adidas Originals', 346.00, 344, 2),
    ('Tenis WM preto', 988.00, 2341, 6),
    ('Bota Colcci azul', 1540.00, 143, 3),
    ('Scarpin feminino salto', 877.00, 673, 7),
    ('Camiseta Nike Dri-Fit', 124.00, 228, 1),
    ('Camisa polo azul', 233.00, 549, 8),
    ('Camisa Polo Tommy Hilfiger', 499.00, 794, 4),
    ('Sandalia Vizzano', 1540.00, 83, 7),
    ('Tenis Adidas Superstar', 769.00, 326, 2),
    ('Camiseta algodão verde', 76.99, 1214, 9),
    ('Short Nike Nk', 298.00, 683, 1),
    ('Camisa Aramis geometrica', 355.00, 1033, 8),
    ('Bolsa Nike Unissex', 265.29, 596, 1),
    ('Camiseta Aramis vermelha', 199.00, 457, 8),
    ('Bone Tommy Jeans', 204.64, 68, 4),
    ('Jaqueta Adidas ECO', 609.98, 116, 2);

select * from produtos;

-- 1) Exiba o nome do produto, nome da marca e o valor do produto.
select p.nome_produto as produto, m.nome_marca as marca, p.valor_produto as valor
from produtos p, marcas m
where p.codigo_marca = m.codigo_marca;


-- 2) Listar todas as marcas e a quantidade de produtos cadastrados por marca.
select m.nome_marca as marca, count(*) as qtd_produtos, sum(p.quantidade_estoque) as qtd_estoque 
from produtos p, marcas m
where p.codigo_marca = m.codigo_marca
group by m.nome_marca;


-- 3) Exibir o nome do produto e seu valor em ordem decrescente (do maior valor para o menor).
select nome_produto as produto, valor_produto as valor from produtos order by valor desc;


-- 4) Media dos valores dos produtos por cada marca.
select m.nome_marca, round(avg(p.valor_produto), 2) as media_valor
from produtos p, marcas m
where p.codigo_marca = m.codigo_marca
group by m.nome_marca;


-- 5) Listar nome do produto, valor, nome da marca e quantidade em estoque do produto de maior valor (haverá dois produtos, os dois terão que ser exibidos).
select p.nome_produto, p.valor_produto, m.nome_marca, p.quantidade_estoque
from produtos p
inner join marcas m
on p.codigo_marca = m.codigo_marca 
where p.valor_produto = (select max(valor_produto) from produtos);


-- 6) Listar todos os produtos (exiba todos os dados e converta o codigo da marca para o nome), em que o estoque esteja entre 500 e 1000 unidades.
select p.codigo_produto as codigo, p.nome_produto, p.valor_produto as valor, p.quantidade_estoque, m.nome_marca
from produtos p
inner join marcas m
on p.codigo_marca = m.codigo_marca 
where p.quantidade_estoque between 500 and 1000;


-- 7) Listar todos os produtos (nome, valor e estoque) que contenham os termos: Blusa, Camiseta e Camisa. Exiba em ordem decrescente de preço.
select nome_produto as nome, valor_produto as valor, quantidade_estoque
from produtos
where nome_produto like '%Blusa%' or nome_produto like '%Camiseta%' or nome_produto like '%Camisa%'
order by valor_produto desc;


-- 8) Exibir a soma dos valores de cada produto e agrupar por marcas que estejam vinculadas a algum produto.
select m.nome_marca as marca, truncate(sum(p.valor_produto), 2) as valor_total
from produtos p, marcas m
where p.codigo_marca = m.codigo_marca
group by m.nome_marca;


-- 9) Exibir o nome da marca que possui o produto mais caro.
select m.nome_marca
from marcas m
inner join produtos p
on p.codigo_marca = m.codigo_marca 
where p.valor_produto = (select max(valor_produto) from produtos);


-- 10) Listar todos os produtos (nome e estoque) em que a quantidade em estoque seja maior ou igual a media total do estoque contido na tabela de produtos.
select nome_produto, quantidade_estoque 
from produtos 
where quantidade_estoque >= (select truncate(avg(quantidade_estoque), 0) from produtos);


-- 11) Excluir todas as tabelas.
drop table marcas;
drop table produtos;





# EXERCÍCIO 6
create table professores(
    codigo_professor int primary key auto_increment,
    nome_professor varchar(20)
);

create table materias(
    codigo_materia int primary key auto_increment,
    codigo_professor int,
    nome_materia varchar(20),
    constraint fk_professor foreign key (codigo_professor) references professores(codigo_professor)
);

create table turmas(
    codigo_turma int primary key auto_increment,
    nome_turma varchar(2),
    turno_turma varchar(10)
);

create table alunos(
    codigo_aluno int primary key auto_increment,
    nome_aluno varchar(30)
);

create table alunos_turmas(
    codigo_aluno int,
    codigo_materia int,
    codigo_turma int,
    constraint fk_alunos foreign key (codigo_aluno) references alunos(codigo_aluno),
    constraint fk_materias foreign key (codigo_materia) references materias(codigo_materia),
    constraint fk_turmas foreign key (codigo_turma) references turmas(codigo_turma)
);

insert into professores(nome_professor) values
    ('Renato'),
    ('Oscar'),
    ('Catia'),
    ('Osvaldo'),
    ('Marilia'),
    ('Paula'),
    ('Otavio'),
    ('Airton');

insert into materias(codigo_professor, nome_materia) values
    (1, 'Matematica'),
    (2, 'Geografia'),
    (7, 'Quimica'),
    (6, 'Filosofia'),
    (1, 'Fisica'),
    (3, 'Portugue'),
    (3, 'Ingles'),
    (6, 'Sociologia'),
    (5, 'Portugue'),
    (4, 'Historia'),
    (4, 'Sociologia'),
    (5, 'Espanhol'),
    (8, 'Biologia'),
    (8, 'Quimica');
    
insert into turmas(nome_turma, turno_turma) values
    ('6A', 'Matutino'),
    ('6B', 'Vespertino'),
    ('7A', 'Matutino'),
    ('7B', 'Vespertino'),
    ('8A', 'Matutino'),
    ('8B', 'Vespertino');
    
insert into alunos(nome_aluno) values
    ('Alessandra'),
    ('Emanuela'),
    ('Cintia'),
    ('Diego'),
    ('Eduardo'),
    ('Larissa'),
    ('Jonathan'),
    ('Cleber'),
    ('Jessica'),
    ('Lucas'),
    ('Murilo'),
    ('Marcelo'),
    ('Rebeca'),
    ('Tatiana'),
    ('Tais'),
    ('Gabriel'),
    ('Felipe'),
    ('Eliza'),
    ('Sarah'),
    ('Patricia');

insert into alunos_turmas(codigo_aluno, codigo_materia, codigo_turma) values
    (1, 1, 1),
    (2, 5, 1),
    (3, 10, 2),
    (4, 14, 1),
    (5, 1, 1),
    (6, 2, 6),
    (7, 3, 2),
    (8, 6, 3),
    (9, 5, 4),
    (10, 4, 4),
    (11, 1, 5),
    (12, 5, 2),
    (13, 8, 3),
    (14, 13, 6),
    (15, 6, 5),
    (16, 14, 3),
    (17, 9, 5),
    (18, 3, 1),
    (19, 8, 4),
    (20, 5, 6),
    (4, 10, 3),
    (15, 2, 1),
    (12, 10, 1),
    (9, 8, 6);

-- 1) Exibir o nome do aluno, nome da materia e nome da turma.


-- 2) Nome de cada professor e materia que leciona.


-- 3) Quantidade de alunos em cada turma.


-- 4) Quantidade de alunos por turno.


-- 5) Listar todos os alunos (nome do aluno), turma e materia em que o professor Renato leciona.


-- 6) Listar o nome de todos os professores que lecionam quimica.


-- 7) Quais alunos estão cadastrados na materia de historia?


-- 8) Nome do professor que leciona as materias de português e inglês.
select p.nome as professor, m.nome as materia
    from professores as p
            inner join (select codigo, codigoProfessor from materias where nome = 'Inglês') as ing on p.codigo = ing.codigoProfessor
            inner join (select codigo, codigoProfessor from materias where nome = 'Português') as por on p.codigo = por.codigoProfessor
            inner join materias as m on m.codigoProfessor = p.codigo;

# OU 

select p.nome
from professor p
left join materia m on m.professorId = p. id
where m.nome = 'português' or m.nome='inglês'
group by p.nome
having count(1)=2;


-- 9) Quantidade de alunos matriculados por materia.


-- 10) Quais são os alunos que tem aula com a professor Catia da materia de ingles?


-- 11) Quantidade de alunos da turma 6A que tem aula de matematica com o professor Renato?


-- 12) Exiba quais materias o professor Airton leciona.


-- 13) Quantidade de alunos no periodo vespertino que estão tendo aula de biologia.


-- 14) Remover todas as tabelas.
drop table professores;
drop table materias;
drop table turmas;
drop table alunos;
drop table alunos_turmas;