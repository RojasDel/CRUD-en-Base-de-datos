/*
6 Elimina todos los comentarios realizados por usuarios con menos de 100 de reputación. 
Utiliza una consulta de eliminación para eliminar todos los comentarios realizados y muestra un mensaje indicando cuántos comentarios fueron eliminados.
*/
DELETE FROM dbo.Comments
WHERE UserId IN (
    SELECT Id
    FROM dbo.Users
    WHERE Reputation < 100
);

-- Verificación del cambio
SELECT COUNT(*) AS DeletedRows
FROM dbo.Comments
WHERE UserId IN (
    SELECT Id
    FROM dbo.Users
    WHERE Reputation < 100
);
