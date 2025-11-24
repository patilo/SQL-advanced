-- Índices
-- =================================================================

-- 1. Índice Simple: Mejora la velocidad de las consultas WHERE
-- Creamos un índice en la columna 'salario' ya que probablemente se use en filtros.
CREATE INDEX idx_empleados_salario
ON Empleados (salario);

-- 2. Índice Compuesto: Útil cuando se filtra frecuentemente por dos o más columnas
-- Ejemplo: Filtrar por departamento Y ordenar por fecha de contrato.
CREATE INDEX idx_empleados_depto_fecha
ON Empleados (departamento_id, fecha_contrato DESC);

-- 3. Índice Único: Asegura que la columna tenga valores únicos (adicional a UNIQUE constraint)
-- Si la tabla Departamentos no tuviera un UNIQUE constraint en nombre_depto, lo haríamos aquí.
CREATE UNIQUE INDEX uix_departamentos_nombre
ON Departamentos (nombre_depto);