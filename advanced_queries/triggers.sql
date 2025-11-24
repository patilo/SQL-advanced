-- 0. Crear tabla de auditoraa para el Trigger
CREATE TABLE Log_Auditoria_Salario (
    log_id SERIAL PRIMARY KEY,
    empleado_id INT,
    salario_anterior DECIMAL(10, 2),
    salario_nuevo DECIMAL(10, 2),
    fecha_cambio TIMESTAMP DEFAULT NOW()
);

-- Triggers
-- =================================================================

-- 1. Funcion trigger: Logica que se ejecuta al activarse el trigger
CREATE OR REPLACE FUNCTION registrar_cambio_salario()
RETURNS TRIGGER AS $$
BEGIN
    -- OLD y NEW son variables especiales que contienen el estado de la fila antes y despues del evento.
    IF NEW.salario <> OLD.salario THEN
        INSERT INTO Log_Auditoria_Salario (empleado_id, salario_anterior, salario_nuevo)
        VALUES (OLD.empleado_id, OLD.salario, NEW.salario);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Creacion del Trigger: asocia la funcion a la tabla y evento
CREATE TRIGGER trg_salario_update
AFTER UPDATE ON Empleados -- Se dispara despues de una operación de UPDATE
FOR EACH ROW              -- Se dispara una vez por cada fila afectada
EXECUTE FUNCTION registrar_cambio_salario();

-- Prueba del Trigger:
-- Ejecutas un UPDATE normal y la tabla Log_Auditoria_Salario se llena automaticamente.
-- UPDATE Empleados SET salario = 95000.00 WHERE empleado_id = 1;