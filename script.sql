create schema if not exists videoclub;

set schema 'videoclub';

-- TEMP tabla con datos
CREATE TABLE tmp_videoclub (
	id_copia int4 NULL,
	fecha_alquiler_texto date NULL,
	dni varchar(50) NULL,
	nombre varchar(50) NULL,
	apellido_1 varchar(50) NULL,
	apellido_2 varchar(50) NULL,
	email varchar(50) NULL,
	telefono varchar(50) NULL,
	codigo_postal varchar(5) NULL,
	fecha_nacimiento varchar(50) NULL,
	numero varchar(5) NULL,
	piso varchar(5) NULL,
	letra varchar NULL,
	calle varchar NULL,
	ext varchar(50) NULL,
	titulo varchar(80) NULL,
	genero varchar(50) NULL,
	sinopsis text NULL,
	director varchar(80) NULL,
	fecha_alquiler date NULL,
	fecha_devolucion date NULL
);

-- SOCIO: num_socio (PK), nombre, appelido_1, apellido_2, fecha_nacimiento, telefono, dni
create table if not exists socio(
	num_socio SERIAL primary key,
	nombre VARCHAR(25) not null,
	apellido_1 VARCHAR(30) not null,
	apellido_2 VARCHAR(30) not null,
	fecha_nacimiento DATE not null,
	telefono VARCHAR(25) not null,
	dni VARCHAR(10) not null
);

-- DIRECCION: num_socio (PK, FK), calle, numero, piso, cp_id(FK)
-- Asumimos que cada socio puede tener almacenada UNA sola direccion postal
create table if not exists direccion(
	num_socio INT primary key,
	calle VARCHAR(100) not null,
	numero VARCHAR(25) not null,
	piso VARCHAR(25) not null,
	cp_id INT not null
);

-- CODIGO_POSTAL: id_cp (PK), cp
create table if not exists codigo_postal(
	id_cp SERIAL primary key,
	cp VARCHAR(5) not null
);

-- GENERO: id_genero (PK), nombre_genero
-- Asumimos que cada pelicula puede tener asociado UN unico genero
create table if not exists genero(
	id_genero SERIAL primary key,
	nombre_genero VARCHAR(50) not null
);


-- DIRECTOR: id_director (PK), nombre_director
-- Asumimos que cada pelicula puede tener UN solo director
create table if not exists director(
	id_director SERIAL primary key,
	nombre_director VARCHAR(50) not null
);

-- PELICULA: id_pelicula(PK), titulo, anyo, sinopsis, genero_id (FK), director_id (FK)
create table if not exists pelicula(
	id_pelicula SERIAL primary key,
	titulo VARCHAR(100) not null,
	anyo int not null,
	sinopsis VARCHAR(1000) not null,
	genero_id INT not null,
	director_id INT not null
);

-- PELICULA_COPIAS: id_copia(PK), pelicula_id(FK)
create table if not exists pelicula_copias(
	id_copia SERIAL primary key,
	pelicula_id INT not null
);

-- ALQUILER: id_alquiler(PK), num_socio(FK), copia_id(FK), fecha_alquiler, fecha_devolucion
create table if not exists alquiler(
	id_alquiler SERIAL primary key,
	num_socio INT not null,
	copia_id INT not null,
	fecha_alquiler DATE not null,
	fecha_devolucion DATE
);

-- Anadimos las FOREIGN KEYS a todas las tablas
alter table direccion
add constraint fk_socio_direccion
foreign key (num_socio)
references socio(num_socio);

alter table direccion
add constraint fk_codigopostal_direccion
foreign key (cp_id)
references codigo_postal(id_cp);

alter table pelicula
add constraint fk_genero_pelicula
foreign key (genero_id)
references genero(id_genero);

alter table pelicula
add constraint fk_director_pelicula
foreign key (director_id)
references director(id_director);

alter table pelicula_copias
add constraint fk_pelicula_peliculacopias
foreign key (pelicula_id)
references pelicula(id_pelicula);

alter table alquiler
add constraint fk_socio_alquiler
foreign key (num_socio)
references socio(num_socio);

alter table alquiler
add constraint fk_peliculacopias_alquiler
foreign key (copia_id)
references pelicula_copias(id_copia);

-- Y algunos constraints mas para indicar atributos que deben de tener valores unicos
alter table socio  
add constraint unique_personal_id
unique (dni);

alter table codigo_postal
add constraint unique_postalcode
unique (cp);

alter table director 
add constraint unique_director
unique (nombre_director);

alter table genero 
add constraint unique_genero
unique (nombre_genero);

