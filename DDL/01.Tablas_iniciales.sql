cREATE DATABASE trabajo_bdd2;
USE trabajo_bdd2;   


CREATE TABLE rol(
 rol_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(50));  
 
CREATE TABLE CLIENTE(
 ID_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL);
 
 CREATE TABLE proyecto(
 proyecto_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(50),
 id_cliente int,
 FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) );
 
 CREATE TABLE participante (
 legajo  int NOT NULL PRIMARY KEY  AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL,
 rol int NULL, proyecto INT NULL,
 CONSTRAINT fk_rol 
 foreign KEY (rol)
 REFERENCES rol(rol_id),
 CONSTRAINT fk_proyecto 
 FOREIGN KEY(proyecto)
 REFERENCES proyecto(proyecto_id)  );
 
 CREATE TABLE participacion(
 id_participacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 participante INT NOT NULL,
 proyecto INT NOT NULL,
 rol INT NOT NULl,
 FOREIGN KEY(participante) 
 REFERENCES participante(legajo),
 FOREIGN KEY(proyecto) 
 REFERENCES proyecto(proyecto_id),
 FOREIGN KEY(rol) 
 REFERENCES rol(rol_id) );
 
 CREATE TABLE asignacion(
 id_asignacion INT PRIMARY KEY AUTO_INCREMENT,
 id_participacion int NOT NUll,
 cantidad_horas INT NOT NULL,
 fecha DATE NOT NULL,
 FOREIGN KEY(id_participacion) 
 REFERENCES participacion(id_participacion) ); 
 

 
 
 CREATE TABLE liquidacion(
 id_liquidacion INT PRIMARY KEY AUTO_INCREMENT,
 rol INT NOT NULL,
 proyecto INT NOT NULL,
 cliente INT,
 cantidad_horas INT NOT NULL,
 fecha DATE,
 fecha_liqudiacion DATE,
 usuario INT,
 FOREIGN KEY(rol) 
 REFERENCES rol(rol_id),
 FOREIGN KEY(proyecto)
 REFERENCES proyecto(proyecto_id),
 FOREIGN KEY(cliente) 
 REFERENCES proyecto(id_cliente) ); 
