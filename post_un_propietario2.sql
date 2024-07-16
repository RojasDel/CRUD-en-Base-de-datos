/*
2 
Selecciona la columna **Title** de la tabla **Posts** junto con el **DisplayName** de los usuarios que lo publicaron para aquellos posts que tienen un propietario.
Para lograr esto usa las tablas **Posts** y **Users** utilizando **OwnerUserId** para obtener el nombre del usuario que publicó cada post. 
Presenta los resultados en una tabla mostrando las columnas **Title** y **DisplayName**.
*/

SELECT TOP 200 Posts.Title, Users.DisplayName 
FROM dbo.Posts AS Posts 
JOIN dbo.Users AS Users ON Posts.OwnerUserId = Users.Id 
WHERE Posts.OwnerUserId IS NOT NULL;