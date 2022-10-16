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
    (3, 'Portugues'),
    (3, 'Ingles'),
    (6, 'Sociologia'),
    (5, 'Portugues'),
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
select a.nome_aluno as aluno, t.nome_turma as turma, m.nome_materia as materia
from alunos_turmas a_t
inner join alunos a
on a.codigo_aluno = a_t.codigo_aluno
inner join turmas t
on t.codigo_turma = a_t.codigo_turma
inner join materias m
on m.codigo_materia = a_t.codigo_materia;


-- 2) Nome de cada professor e materia que leciona.
select p.nome_professor as professor, m.nome_materia as materia
from materias m
inner join professores p
on p.codigo_professor = m.codigo_professor;


-- 3) Quantidade de alunos em cada turma.
select t.nome_turma as turma, count(*) as qtd_alunos
from turmas t, alunos_turmas a_t
where t.codigo_turma = a_t.codigo_turma
group by a_t.codigo_turma;


-- 4) Quantidade de alunos por turno.
select t.turno_turma as turno, count(*) as qtd_alunos
from turmas t, alunos_turmas a_t
where t.codigo_turma = a_t.codigo_turma
group by t.turno_turma;


-- 5) Listar todos os alunos (nome do aluno), turma e materia em que o professor Renato leciona.
select a.nome_aluno as aluno, t.nome_turma as turma, m.nome_materia as materia, p.nome_professor as professor
from alunos_turmas a_t
inner join alunos a
on a.codigo_aluno = a_t.codigo_aluno
inner join turmas t
on t.codigo_turma = a_t.codigo_turma
inner join materias m
on m.codigo_materia = a_t.codigo_materia
inner join professores p
on p.codigo_professor = m.codigo_professor
where p.nome_professor = 'Renato';


-- 6) Listar o nome de todos os professores que lecionam quimica.
select distinct p.nome_professor as professores_quimica
from materias m
inner join professores p
on p.codigo_professor = m.codigo_professor
where m.nome_materia = 'Quimica';


-- 7) Quais alunos estão cadastrados na materia de historia?
select a.nome_aluno as aluno_historia
from alunos_turmas a_t
inner join alunos a
on a.codigo_aluno = a_t.codigo_aluno
inner join materias m
on m.codigo_materia = a_t.codigo_materia
where m.nome_materia = 'Historia';


-- 8) Nome do professor que leciona as materias de português e inglês.
select p.nome_professor as professor, group_concat(m.nome_materia) as materias
from professores p
inner join materias m
on m.codigo_professor = p.codigo_professor
group by p.nome_professor
having materias like '%Portugues%' and materias like '%Ingles%';

# OU

select p.nome_professor
from professores p
inner join materias m
on p.codigo_professor = m.codigo_professor
where m.nome_materia in ("Portugues","Ingles")
group by p.nome_professor
having count(distinct m.nome_materia) = 2;


-- 9) Quantidade de alunos matriculados por materia.
select m.nome_materia as materia, count(*) qtd_alunos
from alunos_turmas a_t
inner join materias m
on m.codigo_materia = a_t.codigo_materia
group by m.nome_materia;


-- 10) Quais são os alunos que tem aula com a professor Catia da materia de ingles?
select a.nome_aluno as alunos_ing_catia
from alunos_turmas a_t
inner join alunos a
on a.codigo_aluno = a_t.codigo_aluno
inner join materias m
on m.codigo_materia = a_t.codigo_materia
inner join professores p
on p.codigo_professor = m.codigo_professor
where p.nome_professor = 'Catia' and m.nome_materia = 'Ingles';


-- 11) Quantidade de alunos da turma 6A que tem aula de matematica com o professor Renato?
select count(*) as alunos_6a_mat_renato
from alunos_turmas a_t
inner join alunos a
on a.codigo_aluno = a_t.codigo_aluno
inner join turmas t
on t.codigo_turma = a_t.codigo_turma
inner join materias m
on m.codigo_materia = a_t.codigo_materia
inner join professores p
on p.codigo_professor = m.codigo_professor
where p.nome_professor = 'Renato' and m.nome_materia = 'Matematica' and t.nome_turma = '6A';


-- 12) Exiba quais materias o professor Airton leciona.
select distinct m.nome_materia as materias_airton 
from materias m
inner join professores p
on p.codigo_professor = m.codigo_professor
where p.nome_professor = 'Airton';


-- 13) Quantidade de alunos no periodo vespertino que estão tendo aula de biologia.
select count(*) as qtd_alunos_vesp_biologia
from alunos_turmas a_t
inner join turmas t
on t.codigo_turma = a_t.codigo_turma
inner join materias m
on m.codigo_materia = a_t.codigo_materia
where m.nome_materia = 'Biologia' and t.turno_turma = 'Vespertino';


-- 14) Remover todas as tabelas.
drop table professores;
drop table materias;
drop table turmas;
drop table alunos;
drop table alunos_turmas;





# EXERCÍCIO 7 
create table professores(
    codigo_professor int primary key auto_increment,
    nome_professor varchar(20)
);

create table cursos(
    codigo_curso int primary key auto_increment,
    nome_curso varchar(20),
    valor_curso double,
    codigo_professor int not null,
    constraint fk_professores foreign key (codigo_professor) references professores(codigo_professor)
);

create table alunos(
    codigo_aluno int primary key auto_increment,
    nome_aluno varchar(20),
    nascimento_aluno date,
    estado_aluno varchar(20),
    cidade_aluno varchar(40)
);
    
create table alunos_cursos(
    codigo_aluno int not null,
    codigo_curso int not null,
    status varchar(20),
    constraint fk_alunos foreign key (codigo_aluno) references alunos(codigo_aluno),
    constraint fk_cursos foreign key (codigo_curso) references cursos(codigo_curso),
    primary key (codigo_aluno, codigo_curso)
);

insert into professores(nome_professor) values 
	('Larissa'), 
    ('Daniel'),
    ('Gustavo'),
    ('Carla'),
    ('Guilherme'),
    ('Carina'),
    ('Lucio'),
    ('Bianca');

insert into cursos(nome_curso, valor_curso, codigo_professor) values 
	('Java - Basico', 1000, 2),
    ('Java - Avançado', 1250, 2),
    ('Spring Boot', 1800, 2), 
    ('C#', 1140, 7),
    ('ASP.NET Core', 1800, 7), 
    ('Python', 900, 4), 
    ('Flask', 1020, 4), 
    ('Django', 1400, 4), 
    ('PHP', 950, 4), 
    ('Laravel', 1600, 4), 
    ('Angular', 2300, 1), 
    ('React', 2100, 1), 
    ('HTML', 500, 8), 
    ('CSS', 700, 8), 
    ('JavaScript', 900, 4), 
    ('Banco de dados', 600, 3), 
    ('Design Patterns', 2700, 8);
                                                        
insert into alunos (nome_aluno, nascimento_aluno, estado_aluno, cidade_aluno) values 
	('Aline', '1997-03-01', 'Santa Catarina', 'Blumenau'),
	('Mariana', '1993-08-28', 'Santa Catarina', 'Joinville'),
	('Gustavo', '2000-11-14', 'São Paulo', 'Campinas'),
	('Bianca', '1999-01-07', 'Santa Catarina', 'Blumenau'),
    ('Ricardo', '2002-07-30', 'Parana', 'Curitiba'),
    ('Tamara', '2005-02-22', 'São Paulo', 'São Paulo'),
    ('Juliano', '1986-09-19', 'Parana', 'Londrina'),
    ('Fernanda', '1987-01-28', 'São Paulo', 'São Paulo'),
    ('Alice', '2001-06-13', 'Santa Catarina', 'Blumenau'),
    ('Henrique', '1991-01-24', 'Rio de Janeiro', 'Niteroi'),
    ('Marcelo', '1988-12-08', 'Parana', 'Curitiba'),
    ('Daniela', '1998-10-14', 'Santa Catarina', 'Florianopolis'),
    ('Caroline', '2002-04-10', 'Parana', 'Maringa'),
    ('Leticia', '1993-08-22', 'São Paulo', 'São Paulo'),
    ('Mauro', '1996-09-08', 'Santa Catarina', 'Jaragua do Sul');
                                                            
insert into alunos_cursos (codigo_aluno, codigo_curso, status) values 
	(1, 2, 'Concluído'), 
    (3, 6, 'Em andamento'), 
    (1, 7, 'Concluído'), 
    (4, 2, 'Em andamento'), 
    (9, 16, 'Não iniciado'), 
    (8, 10, 'Concluído'),
    (1, 4, 'Concluído'),
    (4, 9, 'Não iniciado'),
    (10, 2, 'Em andamento'),
    (7, 1, 'Concluído'),
    (12, 2, 'Não iniciado'),
    (2, 1, 'Não iniciado'),
    (15, 7, 'Não iniciado'),
    (11, 2, 'Concluído'),
    (6, 13, 'Em andamento'),
    (3, 4, 'Em andamento'),
    (4, 10, 'Em andamento'),
    (9, 17, 'Concluído'),
    (1, 5, 'Em andamento'),
    (10, 8, 'Em andamento');
                                                                    
-- 1) Listar a quantidade de cursos que cada aluno esteja participando. Deverá obrigatoriamente exibir o nome de todos os alunos e a quantidade de cursos.
select nome_aluno, count(ac.codigo_curso) as qtd_cursos 
from alunos a
left join alunos_cursos ac
on ac.codigo_aluno = a.codigo_aluno
group by a.nome_aluno;


-- 2) Exibir a quantidade de cursos atraves do status.
select status, count(codigo_curso) as qtd_cursos
from alunos_cursos
group by status;


-- 3) Exiba o nome do aluno e o nome do curso, onde o status esteja concluido e o valor do curso seja de pelo menos R$1.000,00.
select a.nome_aluno as aluno, c.nome_curso as curso, ac.status
from alunos_cursos ac
inner join cursos c
on c.codigo_curso = ac.codigo_curso
inner join alunos a
on a.codigo_aluno = ac.codigo_aluno
where ac.status = 'Concluído' and c.valor_curso >= 1000;


-- 4) Exibir a quantidade de alunos, agrupando pelo estado onde vive.
select a.estado_aluno as estado, count(ac.codigo_aluno) as qtd_alunos
from alunos_cursos ac, alunos a
where ac.codigo_aluno = a.codigo_aluno
group by a.estado_aluno;


-- 5) Listar o nome dos alunos e o nome dos cursos, em que o status seja 'Não iniciado'.
select a.nome_aluno as aluno, c.nome_curso as curso, ac.status
from alunos_cursos ac
inner join cursos c
on c.codigo_curso = ac.codigo_curso
inner join alunos a
on a.codigo_aluno = ac.codigo_aluno
where ac.status = 'Não iniciado';


-- 6) Exiba o nome dos alunos e quantidade de cursos em que estão cadastrados para os que tenham idade inferior a 18 anos (devera levar em consideração a data e hora atuais).
select a.nome_aluno as aluno, count(ac.codigo_curso) as qtd_cursos
from alunos_cursos ac, alunos a
where ac.codigo_aluno = a.codigo_aluno 
and timestampdiff(year, nascimento_aluno, current_date) < 18
group by a.nome_aluno;


-- 7) Exiba o nome do curso mais caro, seu valor e a quantidade de alunos que estão participando.
select c.nome_curso as curso, c.valor_curso as valor, count(ac.codigo_aluno) as qtd_alunos
from cursos c, alunos_cursos ac
where c.codigo_curso = ac.codigo_curso
and c.valor_curso = (select max(valor_curso) from cursos)
group by c.nome_curso;


-- 8) Exiba os nomes de todos os professores e a quantidade de cursos que eles lecionam.
select p.nome_professor as professor, count(c.codigo_professor) as qtd_cursos
from cursos c, professores p
where c.codigo_professor = p.codigo_professor
group by p.nome_professor;


-- 9) Exiba o nome de todos os professores e a quantidade de alunos que participam dos cursos lecionados por eles.
select p.nome_professor as professor, count(ac.codigo_aluno) as qtd_alunos
from alunos_cursos ac
inner join cursos c
on c.codigo_curso = ac.codigo_curso
inner join professores p
on p.codigo_professor = c.codigo_professor
group by p.nome_professor;


-- 10) Exibir o nome de todos os alunos, alem do nome do curso, valor do curso e nome do professor contidos na tabela alunos_cursos.
select a.nome_aluno as aluno, c.nome_curso as curso, c.valor_curso as valor, p.nome_professor as professor
from alunos_cursos ac
inner join cursos c
on c.codigo_curso = ac.codigo_curso
inner join alunos a
on a.codigo_aluno = ac.codigo_aluno
inner join professores p
on p.codigo_professor = c.codigo_professor;


-- 11) Realize a media dos valores comercializados em todos os cursos.
select round(avg(valor_curso), 2) as media_valor
from cursos;


-- 12) Retorne o nome do curso, valor e quantidade de alunos, onde o valor do curso seja maior ou igual a media.
select c.nome_curso as curso, c.valor_curso as valor, count(ac.codigo_aluno) as qtd_alunos
from alunos_cursos ac
inner join cursos c
on c.codigo_curso = ac.codigo_curso
where c.valor_curso >= (select round(avg(valor_curso), 2) from cursos)
group by c.nome_curso;

# OU

select c.nome_curso as curso, c.valor_curso as valor, count(ac.codigo_aluno) as qtd_alunos
from alunos_cursos ac, cursos c
where ac.codigo_curso = c.codigo_curso
and c.valor_curso >= (select round(avg(valor_curso), 2) from cursos)
group by c.nome_curso;


-- 13) Remover todos os alunos com idade superior a 30 anos.
alter table alunos_cursos
add constraint foreign key(codigo_aluno)
references alunos(codigo_aluno) on delete cascade;
delete
from alunos
where timestampdiff(year, nascimento_aluno, current_date) >= 30;


-- 14) Excluir todas as tabelas.
drop table alunos_cursos;
drop table cursos;
drop table alunos;
drop table professores;





# EXERCÍCIO 8
-- 1) Criar uma tabela chamada clientes.
create table clientes(
    codigo_cliente int primary key,
    nome_cliente varchar(30),
    email_cliente varchar(50)
); 


-- 2) Criar uma sequência para a coluna codigo_cliente.
DELIMITER $$
create procedure inserir_codigo()
begin
	insert into clientes(codigo_cliente) 
    values((select last_insert_id()));
end $$
DELIMITER ;

call inserir_codigo();
select * from clientes;


-- 3) Criar uma procedure para cadastrar os clientes, os parâmetros obrigatórios serão: nome e e-mail.
DELIMITER $$
create procedure cadastrar_cliente(in nome varchar(30), in email varchar(50)) 
begin
	declare codigo int;
    set codigo = (select ifnull(max(codigo_cliente), 0) + 1 from clientes);
    if(nome is not null and email is not null)
		then 
        insert into clientes(codigo_cliente, nome_cliente, email_cliente) 
        values(codigo, nome, email);
	end if;
end $$
DELIMITER ;

# OU

DELIMITER $$
create procedure cadastrar_cliente(in nome varchar(30), in email varchar(50)) 
begin
	declare msg varchar(100);
    declare codigo int;
	select ifnull(max(codigo_cliente), 0) + 1 into codigo from clientes;
    if(nome is not null and email is not null)
		then 
        insert into clientes(codigo_cliente, nome_cliente, email_cliente) 
        values(codigo, nome, email);
        set msg = 'Cliente cadastrado com sucesso!';
	end if;
    select msg;
end $$
DELIMITER ;


-- 4) Insira um cliente através da procedure criada.
call cadastrar_cliente('Aline', 'aline@email.com');
select * from clientes;


-- 5) Implemente a procedure de cadastro com as seguintes regras de negócio: 
	-- a. O nome deve ter pelo menos 3 caracteres e no máximo 30;
    -- b. O campo e-mail é obrigatório e deverá ter pelo menos 10 caracteres;
    -- c. Não poderá haver e-mails iguais;
    -- d. O e-mail deve ter apenas um @;
DELIMITER $$
create procedure validar_nome(in nome varchar(30), out msg varchar(100)) 
begin
    if length(nome) < 3 or length(nome) > 30 then 
		set msg = 'O nome do cliente deve conter entre 3 e 30 caracteres!';
	end if;
end $$
DELIMITER ;


DELIMITER $$
create procedure validar_email(in email varchar(30), out msg varchar(100)) 
begin
	declare qtd int;
    if length(email) > 10 then 
		if (not(length(email) - length(replace(email,'@', '')) = 1)) then
			set msg = 'Email pode conter apenas um @!';
		else
			select count(*) into qtd from clientes where email = email_cliente;
            if qtd > 0 then
				set msg = 'Já existe cliente cadastrado com esse email!';
			end if;
		end if;
    else
		set msg = 'Email deve conter ao menos 10 caracteres!';
	end if;
end $$
DELIMITER ;
   
   
DELIMITER $$
create procedure cadastrar_cliente(in nome varchar(30), in email varchar(50)) 
begin
	declare msg varchar(100);   
	declare codigo int;
    set msg = '';

    call validar_nome(nome, msg);
    if msg is null then
		call validar_email(email, msg);
	end if;
    if msg is null then
		select ifnull(max(codigo_cliente), 0) + 1 into codigo from clientes;
        insert into clientes(codigo_cliente, nome_cliente, email_cliente) 
        values(codigo, nome, email);
        set msg = 'Cliente cadastrado com sucesso!';
	end if;
    
    select msg;
end $$
DELIMITER ;


-- 6) Criar uma procedure para efetuar a alteração de dados. Essa procedure deverá ter três parâmetros, sendo eles: O email que desejamos alterar, o novo nome e o novo e-mail. Caso não tenha o email informado, deverá retornar uma mensagem que o mesmo não existe.
DELIMITER $$
create procedure alterar_cliente(in email_atual varchar(30), in email_novo varchar(30), in nome varchar(30)) 
begin
	declare qtd int;
    declare msg varchar(100);
    
    select count(*) into qtd from clientes where email_cliente = email_atual;
    
    if qtd > 0 then
		update clientes set
		email_cliente = email_novo,
		nome_cliente = nome
		where email_cliente = email_atual;
        set msg = 'Dados do cliente alterados com sucesso!';
    else
		set msg = 'O cliente informado não existe!';
    end if;

    select msg;
    end $$
DELIMITER ;


-- 7) Criar uma procedure para remover clientes através do nome. Retorne uma mensagem informando se a exclusão foi efetuada ou não.
DELIMITER $$
create procedure alterar_cliente(in nome varchar(30)) 
begin
	declare qtd int;
    declare msg varchar(100);
    
    select count(*) into qtd from clientes where nome_cliente = nome;
    
    if qtd > 0 then
		delete from clientes
		where nome_cliente = nome;
        set msg = 'Dados do cliente excluídos com sucesso!';
    else
		set msg = 'O cliente informado não existe!';
    end if;

    select msg;
    end $$
DELIMITER ;


-- 8) Criar uma procedure para remover clientes através do e-mail. Retorne uma mensagem informando se a exclusão foi efetuada ou não.
DELIMITER $$
create procedure alterar_cliente(in email varchar(30)) 
begin
	declare qtd int;
    declare msg varchar(100);
    
    select count(*) into qtd from clientes where email_cliente = email;
    
    if qtd > 0 then
		delete from clientes
		where email_cliente = email;
        set msg = 'Dados do cliente excluídos com sucesso!';
    else
		set msg = 'O cliente informado não existe!';
    end if;

    select msg;
    end $$
DELIMITER ;





#EXERCÍCIO 9
create table produtos(
    id_produto int primary key,
    descricao_produto varchar(30),
    valor_unitario float,
    estoque float
); 

create table itens_carrinho(
    id_carrinho int primary key,
    id_produto int primary key,
    quantidade float,
    valor_unitario float,
    constraint fk_produto foreign key (id_produto) references produtos(id_produto)
);

-- 1) Criar trigger para atualizar o estoque ao inserir, atualizar ou excluir um item;
DELIMITER $
create trigger tgr_inserir after insert
on itens_carrinho
for each row
begin
	update produtos set estoque = estoque - new.quantidade
where id_produto = new.id_produto;
end$

create trigger tgr_deletar after delete
on itens_carrinho
for each row
begin
	update produtos set estoque = estoque + old.quantidade
where id_produto = old.id_produto;
end$

create trigger tgr_atualizar after update
on itens_carrinho
for each row
begin
	update produtos set estoque = new.estoque - old.estoque
where id_produto = old.id_produto;
end$
DELIMITER ;


-- 2) Criar uma tabela para inserir o historico das movimentações ocorridas na tabela de produto. Informar chave primaria do item e qual foi a operação.
    create table historico(
    id_carrinho int primary key,
    id_produto int primary key,
    datahora datetime,
    descricao varchar(100),
	constraint fk_carrinho foreign key (id_carrinho) references itens_carrinho(id_carrinho),
    constraint fk_produto foreign key (id_produto) references produtos(id_produto)
);
    

