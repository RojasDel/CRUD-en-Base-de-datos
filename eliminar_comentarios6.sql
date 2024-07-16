/*
6 Elimina todos los comentarios realizados por usuarios con menos de 100 de reputaci�n. 
Utiliza una consulta de eliminaci�n para eliminar todos los comentarios realizados y muestra un mensaje indicando cu�ntos comentarios fueron eliminados.
*/
DELETE FROM dbo.Comments
WHERE UserId IN (
    SELECT Id
    FROM dbo.Users
    WHERE Reputation < 100
);

-- Verificaci�n del cambio
SELECT COUNT(*) AS DeletedRows
FROM dbo.Comments
WHERE UserId IN (
    SELECT Id
    FROM dbo.Users
    WHERE Reputation < 100
);
