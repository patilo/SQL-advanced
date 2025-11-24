-- CTEs (Common Table Expressions) y Funciones de Ventana
-- =================================================================

-- 1. CTE Simple: empleados y sus departamentos, usando CTE como paso intermedio
WITH EmpleadosConDepartamento AS ( -- 1er paso: Unir tablas y calcular el salario anual
    SELECT
        E.nombre,
        D.nombre_depto,
        E.salario * 12 AS salario_anual
    FROM
        Empleados E
    INNER JOIN
        Departamentos D ON E.departamento_id = D.departamento_id
)
-- 2do paso: Consultar y filtrar el resultado de la CTE
SELECT
    nombre,
    nombre_depto,
    salario_anual
FROM
    EmpleadosConDepartamento
WHERE
    salario_anual > 75000;




-- 2. Funcion de Ventana (RANK): Encontrar los 3 salarios mas altos DENTRO de cada departamento
-- PARTITION BY crea una "ventana" separada para cada departamento_id.
WITH RanksPorDepto AS (
    SELECT
        nombre,
        departamento_id,
        salario,
        RANK() OVER (
            PARTITION BY departamento_id -- Crea grupos por departamento
            ORDER BY salario DESC       -- Ordena dentro del grupo por salario descendente
        ) AS rango_salario
    FROM
        Empleados
)
-- Consulta final: Filtramos la tabla CTE para obtener solo los 3 primeros de cada grupo
SELECT
    nombre,
    departamento_id,
    salario,
    rango_salario
FROM
    RanksPorDepto
WHERE
    rango_salario <= 3;