-- Ver existencia de productos por almacén y en total --
SELECT
    p.id AS id,
    p.nombre AS Producto,
    GROUP_CONCAT(' ' || a.nombre || ': ' || s.cant) AS Almacenes,
    SUM(s.cant) as Total,
    CASE
        WHEN SUM(s.cant) < p.stock_minimo THEN 'Requerido'
        ELSE 'Completo'
    END AS Estado
FROM
    tbStock s
JOIN
    tbAlmacen a ON s.id_almacen = a.id
JOIN
    tbProducto p ON s.id_producto = p.id
GROUP BY
    p.id
ORDER BY
    p.id;


-- Ver los pedidos pendientes --
SELECT
    p.id AS id,
    prov.nombre AS Proveedor,
    p.fecha AS Fecha,
    p.valor AS Valor
FROM
    tbPedidos p
JOIN
    tbProveedor prov ON p.id_proveedor = prov.id
WHERE
    p.estado = 'pendiente'
ORDER BY
    p.fecha;
