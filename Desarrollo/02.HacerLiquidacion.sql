--procedure que hace la liquidacion de las horas segun proyecto y rol

delimiter $$ CREATE PROCEDURE hacerliquidacion()  begin  INSERT INTO liquidacion (rol, proyecto, cliente, cantidad_horas, mes_ano,fechaliquidacion) SELECT rol,proyecto, id_cliente, SUM(cantidad_horas), fecha, curdate() FROM asignacion INNER JOIN participacion on asignacion.id_participacion=participacion.id_participacion INNER JOIN proyecto on participacion.proyecto=proyecto.proyecto_id GROUP BY rol, proyecto, MONTH(fecha) ORDER BY rol, proyecto;    END; $$
