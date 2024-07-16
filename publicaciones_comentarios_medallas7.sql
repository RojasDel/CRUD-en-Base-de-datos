/*
7 Para cada usuario, muestra el número total de publicaciones (**Posts**), comentarios (**Comments**) y medallas (**Badges**) que han realizado. 
Utiliza uniones (**JOIN**) para combinar la información de las tablas **Posts, Comments y Badges** por usuario. 
Presenta los resultados en una tabla mostrando el **DisplayName** del usuario junto con el total de publicaciones, comentarios y medallas.
*/


-- Subconsulta para posts
WITH UserPosts AS (
    SELECT OwnerUserId, COUNT(DISTINCT Id) AS TotalPosts
    FROM dbo.Posts
    GROUP BY OwnerUserId
),
-- Subconsulta para comentarios
UserComments AS (
    SELECT UserId, COUNT(DISTINCT Id) AS TotalComments
    FROM dbo.Comments
    GROUP BY UserId
),
-- Subconsulta para medallas
UserBadges AS (
    SELECT UserId, COUNT(DISTINCT Id) AS TotalBadges
    FROM dbo.Badges
    GROUP BY UserId
)
-- Consulta principal
SELECT TOP 200 u.DisplayName, 
       ISNULL(p.TotalPosts, 0) AS TotalPosts, 
       ISNULL(c.TotalComments, 0) AS TotalComments, 
       ISNULL(b.TotalBadges, 0) AS TotalBadges
FROM dbo.Users u
LEFT JOIN UserPosts p ON u.Id = p.OwnerUserId
LEFT JOIN UserComments c ON u.Id = c.UserId
LEFT JOIN UserBadges b ON u.Id = b.UserId
ORDER BY TotalPosts DESC, TotalComments DESC, TotalBadges DESC;
