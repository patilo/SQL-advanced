-- creamos la tabla departamentos
CREATE TABLE Departamentos (
    departamento_id INT PRIMARY KEY, -- Clave Primaria
    nombre_depto VARCHAR(100) NOT NULL UNIQUE,
    ubicacion VARCHAR(100)
);

-- creamos la tabla empleados
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) CHECK (salario > 0), -- restriccion: el salario debe ser positivo
    fecha_contrato DATE DEFAULT GETDATE(), -- fecha actual
    departamento_id INT,
    
    -- Clave Foranea
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id)
);