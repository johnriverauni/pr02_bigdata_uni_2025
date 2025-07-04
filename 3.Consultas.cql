-- 1. Seleccionar la base de datos 'order_management_data'
USE order_management_data;

-- 2. Consultar todos los registros de la tabla 'orders_by_user'
-- Se seleccionan todos los campos de la tabla 'orders_by_user'. Esto mostrar� todas las �rdenes de usuario.
SELECT * FROM orders_by_user;

-- 3. Habilitar la expansi�n de registros, lo que permite ver los datos en m�s detalle
-- 'EXPAND ON' se utiliza en Cassandra para mostrar todos los registros, incluyendo los valores que no caben en una sola fila en el resultado.
EXPAND ON;

-- 4. Consultar detalles espec�ficos de los pedidos en la tabla 'orders_by_id'
-- Aqu� se seleccionan varios campos para obtener detalles completos de un pedido, incluyendo informaci�n sobre los �tems, el estado del pedido, el subtotal, impuestos, y detalles de pago y env�o.
SELECT 
  order_id,                        -- ID del pedido
  item_name,                        -- Nombre del �tem
  item_id,                          -- ID del �tem
  item_description,                 -- Descripci�n del �tem
  item_price,                       -- Precio del �tem
  item_quantity,                    -- Cantidad del �tem
  order_status,                     -- Estado del pedido
  order_timestamp,                  -- Timestamp del pedido
  order_subtotal,                   -- Subtotal del pedido
  order_shipping,                   -- Costo de env�o
  order_tax,                        -- Impuestos del pedido
  order_total,                      -- Total del pedido
  payment_summary,                  -- Resumen del pago
  payment_details,                  -- Detalles del pago (en formato mapa)
  billing_summary,                  -- Resumen de la facturaci�n
  billing_details,                  -- Detalles de facturaci�n (en formato mapa)
  shipping_summary,                 -- Resumen de env�o
  shipping_details,                 -- Detalles de env�o (en formato mapa)
  delivery_id,                      -- ID de la entrega
  delivery_details                  -- Detalles de la entrega (en formato mapa)
FROM orders_by_id;

-- 5. Desactivar la expansi�n de registros
-- 'EXPAND OFF' se utiliza para detener la expansi�n de registros y volver a la visualizaci�n de filas compactas.
EXPAND OFF;

-- 6. Consultar todos los registros de la tabla 'orders_by_user_item'
-- Esta consulta selecciona todos los registros de la tabla 'orders_by_user_item', que relaciona a los usuarios con los �tems de sus pedidos.
SELECT * FROM orders_by_user_item;

-- 7. Consultar todos los registros de la tabla 'order_status_history_by_id'
-- Se obtienen todos los registros de la tabla 'order_status_history_by_id', que almacena el historial de estados de cada pedido.
SELECT * FROM order_status_history_by_id; 

-- 8. Consultar los pedidos de 'joe' entre el 1 de enero de 2020 y el 31 de diciembre de 2020
-- Esta consulta filtra los pedidos del usuario 'joe' bas�ndose en un rango de tiempo, solo mostrando las �rdenes realizadas en 2020.
SELECT * 
FROM orders_by_user 
WHERE user_id = 'joe'                               -- Filtra por 'user_id' igual a 'joe'
  AND order_timestamp >= '2020-01-01'               -- Solo pedidos realizados despu�s del 1 de enero de 2020
  AND order_timestamp <  '2021-01-01';               -- Solo pedidos realizados antes del 1 de enero de 2021

-- 9. Habilitar la expansi�n de registros para ver m�s detalles de la consulta anterior
EXPAND ON;

-- 10. Consultar detalles de un pedido espec�fico de 'orders_by_id' con el 'order_id' proporcionado
-- Esta consulta obtiene todos los detalles de un pedido espec�fico (con 'order_id' = '113-3827060-8722206') 
-- como los �tems, el estado, los pagos, y los detalles de la entrega.
SELECT * 
FROM orders_by_id
WHERE order_id = '113-3827060-8722206';

-- 11. Desactivar la expansi�n de registros
EXPAND OFF;

-- 12. Consultar los �tems espec�ficos del usuario 'joe' para un 'item_id' particular
-- Esta consulta obtiene todos los registros de la tabla 'orders_by_user_item' donde el 'item_id' es 'n-0023' 
-- y el 'user_id' es 'joe', lo que filtra los �tems comprados por el usuario 'joe' con ese 'item_id'.
SELECT * 
FROM orders_by_user_item
WHERE item_id = 'n-0023'         -- Filtra por 'item_id' igual a 'n-0023'
  AND user_id = 'joe';           -- Filtra por 'user_id' igual a 'joe'  

-- 13. Consultar el historial de estado de un pedido espec�fico con el 'order_id' proporcionado
-- Esta consulta obtiene el historial de estados de un pedido espec�fico (con 'order_id' = '111-0461064-1669732') 
-- de la tabla 'order_status_history_by_id', que muestra los cambios de estado del pedido.
SELECT * 
FROM order_status_history_by_id
WHERE order_id = '111-0461064-1669732';  -- Filtra por 'order_id' igual a '111-0461064-1669732'
