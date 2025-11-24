-- Procedimientos Almacenados (Functions en PostgreSQL)
-- =================================================================

-- 1. Funcion Simple (Escalar): Calcular un bono del 10%
-- Esta funcion acepta el salario como parámetro y devuelve el valor del bono.
CREATE OR REPLACE FUNCTION calcular_bono(salario_base DECIMAL)
RETURNS DECIMAL AS $$
BEGIN
    RETURN salario_base * 0.10; -- Retorna el 10% del salario
END;
$$ LANGUAGE plpgsql;

-- Uso de la funcion:
SELECT
    nombre,
    salario,
    calcular_bono(salario) AS bono_calculado
FROM
    Empleados;

-- 2. Funcion que acepta parametros y realiza un UPDATE (logica de negocio)
-- Incrementa el salario a todos los empleados de un departamento especifico.
CREATE OR REPLACE FUNCTION incrementar_salario_depto(
    id_depto INT,
    porcentaje DECIMAL
)
RETURNS VOID AS $$
BEGIN
    UPDATE Empleados
    SET salario = salario * (1 + porcentaje / 100)
    WHERE departamento_id = id_depto;

    RAISE NOTICE 'Se actualizaron los salarios del departamento % en un %%.', id_depto, porcentaje;
END;
$$ LANGUAGE plpgsql;

-- Ejecución de la Función: (Incrementa el salario del depto 10 en un 5%)
SELECT incrementar_salario_depto(10, 5);

-- (Para SQL Server/MySQL se usaría CREATE PROCEDURE)