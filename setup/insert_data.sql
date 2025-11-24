-- insertamos datos
INSERT INTO Departamentos (departamento_id, nombre_depto, ubicacion)
VALUES 
(10, 'Ventas', 'Oficina Central'),
(20, 'Recursos Humanos', 'Edificio B'),
(30, 'IT', 'Sede Remota');

    -- Inserción en la tabla de Empleados referenciando IDs existentes ya q tiene fk
INSERT INTO Empleados (empleado_id, nombre, apellido, salario, departamento_id)
VALUES
(101, 'Ana', 'Gómez', 60000.00, 10), -- Ana esta en Ventas (ID 10)
(102, 'Luis', 'Pérez', 75000.00, 30), -- Luis está en IT (ID 30)
(103, 'Marta', 'Díaz', 55000.00, 10), -- Marta esta en Ventas
(104, 'Juan', 'Soto', 80000.00, NULL); -- Juan aun no tiene un departamento asignado