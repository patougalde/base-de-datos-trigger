CREATE DATABASE disparadores;
USE disparadores;
CREATE TABLE alumnos(
id_alumno INT PRIMARY KEY,
nombre VARCHAR(20),
apellido1 VARCHAR (20),
apellido2 VARCHAR (20),
calificacion INT (2));

DELIMITER //
CREATE TRIGGER validar_calificacion
BEFORE INSERT 
ON alumnos 
FOR EACH ROW 
BEGIN 
	IF NEW.calificacion<0 THEN 
    SET NEW.calificacion=0;
    ELSEIF NEW.calificacion>10 THEN 
    SET NEW.calificacion=10;
    END IF;
	
END; //
DELIMITER ;

DELIMITER $$
CREATE TRIGGER actualizar_calificacion
BEFORE UPDATE 
ON alumnos 
FOR EACH ROW 
BEGIN 
	IF NEW.calificacion<0 THEN 
    SET NEW.calificacion=0;
    ELSEIF NEW.calificacion>10 THEN 
    SET NEW.calificacion=10;
    END IF;
	
END; $$
DELIMITER ;

INSERT INTO alumnos(id_alumno,nombre,apellido1,apellido2,calificacion)
VALUES
(1,"victor","ugalde","villafaña",-6),
(2,"jesica","ugalde","lopez",8),
(3,"norma","villafaña","ibarra",17);

UPDATE alumnos
SET calificacion =12
WHERE nombre = "victor";