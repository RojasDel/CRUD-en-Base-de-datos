/*
5 Actualiza la columna **Location** de la tabla **Users** cambiando todas las ubicaciones vac�as por "Desconocido". 
Utiliza una consulta de actualizaci�n para cambiar las ubicaciones vac�as. 
Muestra un mensaje indicando que la actualizaci�n se realiz� correctamente.
*/

UPDATE dbo.Users
SET Location = 'Desconocido'
WHERE Location IS NULL;

-- Verificaci�n del cambio
SELECT COUNT(*) AS UpdatedRows
FROM dbo.Users
WHERE Location = 'Desconocido';