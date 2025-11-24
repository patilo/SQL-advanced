-- Vistas (Views)
-- =================================================================

-- 1. Vista Simple: Simplificar una consulta de unión frecuente
-- Útil para que los usuarios o Power BI solo accedan a una "tabla" sencilla y pre-unida.
CREATE VIEW Empleados_Vista_Completa AS
SELECT
    E.empleado_id,
    CONCAT(E.nombre, ' ', E.apellido) AS Nombre_Completo,
    E.salario,
    D.nombre_depto,
    D.ubicacion
FROM
    Empleados E
INNER JOIN
    Departamentos D ON E.departamento_id = D.departamento_id;

-- Uso de la Vista: La tratas como una tabla normal
SELECT Nombre_Completo, nombre_depto
FROM Empleados_Vista_Completa
WHERE ubicacion = 'Santiago';





-- 2. Vista con JOINS y Funciones: Reporte de Empleados para Finanzas
-- Combina datos de Empleados y Departamentos, calcula el salario anual y usa COALESCE para la ubicacion.

CREATE VIEW Empleados_Reporte_Finanzas AS
SELECT
    E.empleado_id,
    E.nombre,
    E.apellido,
    D.nombre_depto AS Departamento,
    -- Calcula el salario anual (asumiendo 12 pagos)
    ROUND(E.salario * 12, 0) AS Salario_Anual,
    -- Usa COALESCE: Si la ubicación es NULL, la muestra como 'Ubicación Desconocida'
    COALESCE(D.ubicacion, 'Ubicación Desconocida') AS Ubicacion_Sede
FROM
    Empleados E
LEFT JOIN -- Usamos LEFT JOIN para incluir a empleados sin departamento asignado (si los hay)
    Departamentos D ON E.departamento_id = D.departamento_id;




    -- para poder observar los resultados de la vista
SELECT *
FROM Empleados_Reporte_Finanzas
WHERE Salario_Anual > 80000;