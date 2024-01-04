create database San_Antonio_Gym;

use San_Antonio_Gym;

create table Gimnasio(
    nombre varchar(50),
    constraint pk_Gimnasio primary key(nombre)
);

create table Persona(
    dni varchar(9),
    nombre varchar(50) not null,
    primerApellido varchar(50) not null,
    constraint pk_Persona primary key(dni)
);

create table Entrenador(
    id int auto_increment,
    dniPersona varchar(9) not null,
    salario float(4) not null,
    NombreGimnasio varchar(50) not null,
    constraint pk_Entrenador primary key(id),
    constraint fk_Entrenador_Persona foreign key(dniPersona) references Persona(dni),
    constraint fk_Entrenador_Gimnasio foreign key(NombreGimnasio) references Gimnasio(nombre)
);

create table Cliente(
    id int auto_increment,
    dniPersona varchar(9) not null,
    fechaIns date not null,
    constraint pk_Cliente primary key(id),
    constraint fk_Persona_Cliente foreign key(dniPersona) references Persona(dni)
);

create table Planificacion(
    codigo varchar(10),
    fechaCreada date not null,
    constraint pk_Planificacion primary key(codigo)
);

create table Entrenador_Cliente_Planificacion(
    id int auto_increment,
    dniPersonaEntrenador varchar(9) not null,
    dniPersonaCliente varchar(9) not null,
    codigoPlanificacion varchar(10) not null,
    constraint pk_Entrenador_Cliente_Planificacion primary key(id),
    constraint fk_dniPersonaEntrenador_Entrenador_Cliente_Planificacion foreign key(dniPersonaEntrenador) references Persona(dni),
    constraint fk_dniPersonaCliente_Entrenador_Cliente_Planificacion foreign key(dniPersonaCliente) references Persona(dni),
    constraint fk_codigoPlanificacion_Entrenador_Cliente_Planificacion foreign key(codigoPlanificacion) references Planificacion(codigo)
);

create table Entrenamiento(
    codigo varchar(10),
    codigoPlanificacion varchar(10) not null,
    fechaCreada date not null,
    constraint pk_Entrenamiento primary key(codigo),
    constraint fk_codigoPlanificacion_Entrenamiento foreign key(codigoPlanificacion) references Planificacion(codigo)
);

create table Ejercicio(
    nombre varchar(50),
    numSeries int(1) not null,
    repeticiones int(2) not null,
    constraint pk_Ejercicio primary key(nombre)
);

create table Entrenamiento_Ejercicio(
    id int auto_increment,
    codigoEntrenamiento varchar(10) not null,
    nombreEjercicio varchar(50) not null,
    constraint pk_Entrenamiento_Ejercicio primary key(id),
    constraint fk_codigoEntrenamiento_Entrenamiento_Ejercicio foreign key(codigoEntrenamiento) references Entrenamiento(codigo),
    constraint fk_nombreEjercicio_Entrenamiento_Ejercicio foreign key(nombreEjercicio) references Ejercicio(nombre)
);

create table Material(
    nombre varchar(50),
    constraint pk_Material primary key(nombre)
);

create table Ejercicio_Material(
    id int auto_increment,
    nombreEjercicio varchar(50) not null,
    nombreMaterial varchar(50),
    constraint pk_Ejercicio_Material primary key(id),
    constraint fk_nombreEjercicio_Ejercicio_Material foreign key(nombreEjercicio) references Ejercicio(nombre),
    constraint fk_nombreMaterial_Ejercicio_Material foreign key(nombreMaterial) references Material(nombre)
);

