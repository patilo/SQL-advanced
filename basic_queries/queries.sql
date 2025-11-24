-- cuando queramos hacer consultas, si estamos en la nube y utilizamos
-- un notebook como buena practica es indicarle la bd que usaremos 
-- por ejemplo la bd empresa

USE empresa;

SELECT * FROM Empleados;
-- listamos la tabla empleados
--  Seleccionar el nombre, apellido y salario, ordenados por salario descendente
SELECT nombre, apellido, salario
FROM Empleados
ORDER BY salario DESC;

-- Filtrar empleados con salario mayor a 65000
SELECT nombre, apellido, salario
FROM Empleados
WHERE salario > 65000.00;

-- Concatenar nombre y apellido para mostrar el 'Nombre Completo'
SELECT empleado_id, CONCAT(nombre, ' ', apellido) AS NombreCompleto
FROM Empleados;

-- Filtrar empleados con salario entre $50,000 y $75,000 (inclusive)
SELECT nombre, apellido, salario
FROM Empleados
WHERE salario BETWEEN 50000.00 AND 75000.00
ORDER BY salario ASC;

-- Filtrar empleados cuyo 'departamento_id' sea 10 o 30
-- IN es mucho más legible que usar múltiples OR
SELECT nombre, apellido, departamento_id
FROM Empleados
WHERE departamento_id IN (10, 30);

-- Filtrar empleados cuyo nombre comience con la letra 'A'
-- El operador LIKE permite buscar patrones. El '%' significa 'cero o más caracteres'.
SELECT nombre, apellido
FROM Empleados
WHERE nombre LIKE 'A%';

-- Filtrar empleados cuyo apellido tenga 'ez' en cualquier posición
SELECT nombre, apellido
FROM Empleados
WHERE apellido LIKE '%ez%';

-- Filtrar empleados cuyo nombre tenga una 'a' como segundo carácter (ej. J_a_vier)
-- El operador '_' (guion bajo) significa 'exactamente un carácter'.
SELECT nombre, apellido
FROM Empleados
WHERE nombre LIKE '_a%';




-- filtrados logicos como AND/OR

-- Filtrar empleados con salario mayor a $70,000 Y que pertenezcan al departamento 20
SELECT nombre, apellido, salario, departamento_id
FROM Empleados
WHERE salario > 70000.00 AND departamento_id = 20;

-- Filtrar empleados en el departamento 10 O aquellos contratados después del año 2023
SELECT nombre, apellido, departamento_id, fecha_contrato
FROM Empleados
WHERE departamento_id = 10 OR fecha_contrato > '2023-01-01';

-- Encontrar empleados que NO tienen un departamento asignado
-- Es CRUCIAL usar IS NULL (o IS NOT NULL), NO se debe usar = NULL.
SELECT nombre, apellido
FROM Empleados
WHERE departamento_id IS NULL;