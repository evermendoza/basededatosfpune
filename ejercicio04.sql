drop table if exists agenda;
create table agenda( 
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);
insert into agenda (nombre, domicilio, telefono) values('Alberto Mores','Colon 123','4234567');
insert into agenda (nombre, domicilio, telefono) values('Juan Torres','Avellaneda 135','4458787');
select * from agenda;
drop table if exists agenda;
drop table agenda;
drop table if exists libros;
create table libros(
cadena varchar(20),
autor varchar(30),
editorial varchar(15)
);
show tables;
describe libros;
insert into libros(cadena, autor, editorial) values('El aleph', 'Borges', 'Planeta');
insert into libros(cadena, autor, editorial) values('Martin Fierro', 'Jose Hernandez', 'Emece');
insert into libros(cadena, autor, editorial) values('Aprenda PHP', 'Mario Molina', 'Emece');
select* from libros;