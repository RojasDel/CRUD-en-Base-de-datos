/*
4 Encuentra el **DisplayName** de los usuarios que han realizado más de 100 comentarios en total. 
Para esto utiliza una subconsulta para calcular el total de comentarios por usuario y luego filtra aquellos usuarios que hayan realizado más de 100 comentarios en total. 
Presenta los resultados en una tabla mostrando el **DisplayName** de los usuarios.
*/

SELECT Users.DisplayName
FROM dbo.Users AS Users
JOIN (
    SELECT UserId, COUNT(*) AS CommentCount
    FROM dbo.Comments
    GROUP BY UserId
    HAVING COUNT(*) > 100
) AS UserComments ON Users.Id = UserComments.UserId;