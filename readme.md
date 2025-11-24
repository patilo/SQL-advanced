SQL-Avanzado-PostgreSQL
Este repositorio está diseñado para ser una guía exhaustiva y práctica en el dominio de SQL avanzado, centrándose en el potente motor de base de datos PostgreSQL. Desde la configuración inicial del esquema hasta la implementación de objetos programables complejos, este proyecto busca solidificar tus habilidades en la manipulación y optimización de datos, crucial para roles de Data Analyst, Data Engineer y Desarrollador Backend.

El objetivo es transformar el conocimiento teórico en habilidades aplicables, demostrando cómo construir lógica de negocio robusta directamente en la base de datos para la escalabilidad, eficiencia y mantenimiento.

Contenido y Estructura del Repositorio
El repositorio está organizado en secciones progresivas, que van desde la creación del esquema hasta las consultas y objetos más complejos:

SQL-Avanzado-PostgreSQL/
├── advanced_queries/             # Consultas y Objetos SQL complejos
│   ├── ctes_windows.sql          # CTEs y Funciones de Ventana (RANK, LAG, etc.)
│   ├── index.sql                 # Creación de Índices simples, compuestos y únicos
│   ├── joins.sql                 # INNER, LEFT, RIGHT, FULL, CROSS y SELF JOINS
│   ├── procedures.sql            # Procedimientos/Funciones que ejecutan lógica (UPDATE, IF/ELSE)
│   ├── subqueries.sql            # Subconsultas Escalares, de Múltiples Filas, Correlacionadas
│   ├── triggers.sql              # Automatización de eventos (auditoría, validación)
│   └── views.sql                 # Vistas simples, con JOINS y cálculos (Ej. Reporte Finanzas)
├── basic_queries/                # Consultas Fundamentales
│   └── queries.sql               # SELECT, WHERE, ORDER BY, LIKE, IN, COUNT, SUM, AVG
└── setup/                        # Archivos de Configuración de la Base de Datos
    ├── create_bd.sql             # Comando para crear la Base de Datos
    ├── create_tables.sql         # CREATE TABLE (Empleados, Departamentos, etc.)
    └── insert_data.sql           # INSERT INTO para poblar con datos de prueba

Tecnologías Utilizadas
Base de Datos: PostgreSQL
Lenguaje: SQL

