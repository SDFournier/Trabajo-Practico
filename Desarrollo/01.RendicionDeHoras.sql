/*rendicion por dia*/

delimiter $$
DROP PROCEDURE if exists rendicion_hs_por_dia;
 	
CREATE PROCEDURE rendicion_hs_por_dia (in id_part INT, IN horas_ingresadas int, IN fecha_Actual DATE)
 
begin
	 
				INSERT INTO asignacion (id_participacion, cantidad_horas, fecha)
				VALUES(id_part, horas_ingresadas, fecha_actual);	
			 
END;
$$


	/*rendicion por semana*/
	
delimiter $$
DROP PROCEDURE if exists rendicion_hs_por_semana;
 	
CREATE PROCEDURE rendicion_hs_por_semana (in id_part INT, IN horas_ingresadas int, IN fecha_Actual DATE)
 
begin
	 
DECLARE ultimo_dia_semana date; 
SET ultimo_dia_semana= adddate(fecha_actual, INTERVAL 7 DAY);
		
			while (fecha_actual<ultimo_dia_semana) do
	
			
				INSERT INTO asignacion (id_participacion, cantidad_horas, fecha)
				VALUES(id_part, horas_ingresadas, fecha_actual);
				
				SET fecha_actual=ADDDATE(fecha_actual, INTERVAL 1 DAY);
			 
			END while;
			 
END;
$$

	/*rendicion por mes*/

delimiter $$
DROP  PROCEDURE if exists rendicion_hs_por_mes;
CREATE PROCEDURE rendicion_hs_por_mes (in id_part INT, IN horas_ingresadas int, IN fecha_actual DATE)
 
begin
	 
DECLARE ultimo_dia_mes DATE;	 
SET ultimo_dia_mes= ADDDATE(fecha_actual, INTERVAL 30 DAY);
		
			
			while (fecha_actual<ultimo_dia_mes) do
		
			
				INSERT INTO asignacion (id_participacion, cantidad_horas, fecha)
				VALUES(id_part, cantidad_horas, fecha_actual);
				
				SET fecha_actual=ADDDATE(fecha_actual, INTERVAL 1 DAY);
			 
			END while;
			 
END;
$$