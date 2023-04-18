-- Crear tabla tbProveedor si no existe
CREATE TABLE IF NOT EXISTS tbProveedor (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    telefono TEXT,
    direccion TEXT
);

-- Crear tabla tbProducto si no existe
CREATE TABLE IF NOT EXISTS tbProducto (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    sku TEXT NOT NULL UNIQUE,
    costo REAL NOT NULL,
    precio REAL NOT NULL,
    stock_minimo INTEGER NOT NULL
);

-- Crear tabla tbAlmacen si no existe
CREATE TABLE IF NOT EXISTS tbAlmacen (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    capacidad INTEGER NOT NULL
);

-- Crear tabla tbPedidos si no existe
CREATE TABLE IF NOT EXISTS tbPedidos (
    id INTEGER PRIMARY KEY,
    fecha TEXT NOT NULL,
    id_proveedor INTEGER NOT NULL,
    estado TEXT NOT NULL,
    valor REAL NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES tbProveedor (id)
);

-- Crear tabla tbStock si no existe
CREATE TABLE IF NOT EXISTS tbStock (
    id INTEGER PRIMARY KEY,
    cant INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    id_almacen INTEGER NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES tbProducto (id),
    FOREIGN KEY (id_almacen) REFERENCES tbAlmacen (id)
);




INSERT INTO tbAlmacen (nombre, capacidad)
VALUES 
    ('Villa Mella', 372),
    ('Ens. Ozama', 454),
    ('La Feria', 298),
    ('Herrera', 445),
    ('Haina', 236),
    ('Boca Chica', 487),
    ('Alcarrizos', 264),
    ('San Isidro', 322),
    ('Guerra', 418),
    ('San Luis', 496);

INSERT INTO tbProducto (nombre, sku, costo, precio, stock_minimo)
VALUES 
    ('Filtro de aceite', 'FA1', 80, 150, 10),
    ('Bujía', 'BJ2', 60, 100, 20),
    ('Correa de distribución', 'CD3', 500, 750, 15),
    ('Radiador', 'RD4', 1800, 2400, 12),
    ('Amortiguador', 'AM5', 2000, 2800, 30),
    ('Batería', 'BT6', 2500, 3500, 25),
    ('Pastillas de freno', 'PF7', 800, 1100, 20),
    ('Alternador', 'AT8', 4000, 5000, 10),
    ('Filtro de aire', 'FA9', 100, 150, 15),
    ('Bomba de agua', 'BA10', 1200, 1700, 30);

INSERT INTO tbProveedor (nombre, telefono, direccion)
VALUES 
    ('Refacciones García', '809-123-4567', 'Calle 1 #10, Santo Domingo'),
    ('Repuestos Martínez', '829-234-5678', 'Avenida 2 #20, Santiago'),
    ('Autopartes Rodríguez', '849-345-6789', 'Calle 3 #30, La Romana'),
    ('Piezas Automotrices Pérez', '809-456-7890', 'Avenida 4 #40, Puerto Plata'),
    ('Mecánica Sánchez', '829-567-8901', 'Calle 5 #50, San Pedro de Macorís'),
    ('Accesorios Torres', '849-678-9012', 'Avenida 6 #60, La Vega'),
    ('Repuestos López', '809-789-0123', 'Calle 7 #70, Higüey'),
    ('Automotriz Ramírez', '829-890-1234', 'Avenida 8 #80, San Francisco de Macorís'),
    ('Partes de Autos González', '849-901-2345', 'Calle 9 #90, San Cristóbal'),
    ('Taller Mecánico Ríos', '809-012-3456', 'Avenida 10 #100, Baní');


INSERT INTO tbPedidos (fecha, id_proveedor, estado, valor)
VALUES 
    ('2023-05-02', 2, 'pendiente', 33000),
    ('2023-05-15', 5, 'pendiente', 21000),
    ('2023-05-20', 8, 'pendiente', 37000),
    ('2023-05-28', 3, 'pendiente', 28000),
    ('2023-04-10', 9, 'entregado', 41000),
    ('2023-04-05', 7, 'entregado', 23000),
    ('2023-04-15', 1, 'entregado', 35000),
    ('2023-04-22', 6, 'entregado', 27000),
    ('2023-04-02', 10, 'entregado', 39000),
    ('2023-04-25', 4, 'entregado', 31000);


INSERT INTO tbStock (cant, id_producto, id_almacen)
VALUES
    (40, 5, 3),
    (50, 7, 6),
    (10, 1, 9),
    (5, 4, 2),
    (8, 9, 8),
    (3, 2, 5),
    (15, 6, 1),
    (4, 3, 7),
    (30, 10, 4),
    (20, 8, 10),
    (25, 2, 3),
    (10, 5, 4),
    (6, 4, 6),
    (10, 7, 9),
    (12, 1, 7),
    (20, 8, 2),
    (30, 9, 5),
    (15, 10, 8),
    (22, 6, 10),
    (18, 3, 1);

