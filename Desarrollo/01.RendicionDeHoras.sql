
DROP PROCEDURE RendicionDeHoras_dia;


--para llamarlo pide estos parametros: legajo, proyecto, horas, fecha

delimiter $$ 
CREATE PROCEDURE RendicionDeHoras(in legajo_insert INT, in proyecto_insert int, in horas INT, IN fecha_ingresada DATE  )  
BEGIN 
DECLARE DONE INT DEFAULT FALSE;
 DECLARE v_participacion INT; 
 DECLARE v_legajo INT;
 DECLARE v_proyecto INT;  
 DECLARE cur_participacion CURSOR FOR SELECT id_participacion, participante, proyecto FROM participacion; 
 DECLARE CONTINUE handler FOR NOT FOUND SET done = TRUE;    
 
 OPEN cur_participacion; 
 
 lectura_de_iteracion: loop  
 fetch cur_participacion INTO v_participacion, v_legajo, v_proyecto;   
 
 if done then   
	leave lectura_de_iteracion; 
END if;   

if (legajo_insert=v_legajo AND proyecto_insert=v_proyecto ) then   
	INSERT INTO asignacion (id_participacion, cantidad_horas, fecha)   
    VALUES(v_participacion, horas, fecha_ingresada);  
    
END IF; 
END loop;  
close cur_participacion;
END;
$$
