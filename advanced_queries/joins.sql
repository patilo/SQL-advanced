--INNER JOIN: Empleados que SÍ tienen un departamento asignado
--nos muestra solo los datos que tienen en comun las 2 tablas
SELECT
    E.nombre,
    E.apellido,
    D.nombre_depto
FROM
    Empreados E 
INNER JOIN
    Departamentos D ON E.departamento_id = D.departamento_id;



--LEFT JOIN: TODOS los empleados, incluso si no tienen departamento (como Juan Soto)
SELECT
    E.nombre,
    E.apellido,
    D.nombre_depto
FROM
    Empleados E 
LEFT JOIN
    Departamentos D ON E.departamento_id = D.departamento_id;
    


--RIGHT JOIN: TODOS los departamentos, incluso si no tienen empleados
-- (si tuvieramos un depto 40 sin empleados, aparecerian aqui)
SELECT
    D.nombre_depto,
    E.nombre,
    E.apellido
FROM
    Empreados E 
RIGHT JOIN
    Departamentos D ON E.departamento_id = D.departamento_id;



-- FUNCION COALESCE DONDE REEMPLAZAMOS EL NULL CON "SIN ASIGNAR"
SELECT
    E.nombre,
    E.apellido,
    -- Si D.nombre_depto es NULL, COALESCE lo reemplaza con 'Sin Asignar'.
    COALESCE(D.nombre_depto, 'Sin Asignar') AS departamento_final
FROM
    Empleados E
LEFT JOIN
    Departamentos D ON E.departamento_id = D.departamento_id;



-- FUNCION WHERE PARA FILTRAR LA TABLA SECUNDARIA
-- LEFT JOIN con WHERE: Muestra TODOS los empleados, pero solo los datos del Depto 'Ventas'
-- El filtro se aplica DESPUES de la union.
SELECT
    E.nombre,
    E.apellido,
    D.nombre_depto
FROM
    Empleados E
LEFT JOIN
    Departamentos D ON E.departamento_id = D.departamento_id
WHERE
    D.nombre_depto = 'Ventas' OR D.nombre_depto IS NULL; -- necesitamos  NULL para ver los no coincidentes




-- funcion having en el cual filtramos los grupos
-- partimos de la pregunta: ¿Cuáles son los departamentos que tienen un salario promedio superior a $50,000?"
-- Queremos ver solo los departamentos donde el salario promedio es superior a 60000
SELECT
    D.nombre_depto,
    -- usamos la funcion de agregación AVG()
    AVG(E.salario) AS salario_promedio_depto
FROM
    Empleados E
INNER JOIN
    Departamentos D ON E.departamento_id = D.departamento_id
GROUP BY
    D.nombre_depto --agrupamos los salarios por departamento
-- usamos HAVING para filtrar la columna AVG(E.salario)
HAVING
    AVG(E.salario) > 60000;



-- ahora le agregamos casos
-- Ejemplo usando CONCAT, UPPER y CASE WHEN
SELECT
    -- crea el nombre completo en mayssculas
    UPPER(CONCAT(E.nombre, ' ', E.apellido)) AS nombre_completo,
    E.salario,
    -- clasifica el salario con lógica condicional
    CASE
        WHEN E.salario > 90000 THEN 'Senior'
        WHEN E.salario BETWEEN 50000 AND 90000 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS Nivel_Salarial
FROM
    Empleados E;