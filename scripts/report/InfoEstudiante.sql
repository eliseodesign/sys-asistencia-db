SELECT e.Nombre AS Estudiante, 
       e.Apellidos AS Apellidos, 
       g.Nombre AS Grupo, 
       a.Nombre AS Anio, 
       c.Nombre AS Carrera
FROM Estudiante e
JOIN GrupoAnioCarrera gac ON e.IdGrupo = gac.Id
JOIN GrupoAnio ga ON gac.IdGrupoAnio = ga.Id
JOIN Anio a ON ga.IdAnio = a.Id
JOIN Carrera c ON gac.IdCarrera = c.Id
