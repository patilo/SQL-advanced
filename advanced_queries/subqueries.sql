-- Subconsultas
-- =================================================================

-- 1. Subconsulta Escalar (en el WHERE): Empleados que ganan MAS que el salario promedio
SELECT
    nombre,
    salario
FROM
    Empleados
WHERE
    salario > (SELECT AVG(salario) FROM Empleados); -- Subconsulta devuelve un solo valor



-- 2. Subconsulta de multiples Filas (en el WHERE con IN): Empleados en departamentos de 'Ventas' o 'Marketing'
SELECT
    nombre,
    apellido
FROM
    Empleados
WHERE
    departamento_id IN (
        SELECT departamento_id
        FROM Departamentos
        WHERE nombre_depto IN ('Ventas', 'Marketing')
    );

-- 3. Subconsulta en el FROM (Tabla Derivada): Calcular el promedio de salarios mas altos por depto
-- Primero se ejecuta la subconsulta para encontrar el salario máximo por depto.
SELECT
    AVG(max_salario_depto) AS Promedio_Maximo_Salario
FROM (
    SELECT
        MAX(salario) AS max_salario_depto
    FROM
        Empleados
    GROUP BY
        departamento_id
) AS SalariosMaximosPorDepto; -- Se requiere asignar un alias a la tabla derivada

-- 4. Subconsulta Correlacionada (Avanzado): Encontrar el empleado MEJOR pagado en CADA departamento
-- La subconsulta se re-ejecuta por cada fila de la consulta externa.
SELECT
    E1.nombre,
    E1.salario,
    E1.departamento_id
FROM
    Empleados E1
WHERE
    E1.salario = (
        SELECT MAX(E2.salario)
        FROM Empleados E2
        WHERE E2.departamento_id = E1.departamento_id -- Condicion de correlacion
    );