SELECT E.Nombre+' '+E.Apellidos as 'Nombre del Estudiante',
'G' + RIGHT(NG.Nombre, 1) + '-' + LEFT(A.Nombre,2) + C.Siglas as 'Codigo del estudiante',
C.Nombre as 'Carrera del estudiante', D.Nombre +' '+D.Apellidos as 'Nombre del Docente'
FROM Grupo as G
JOIN NumGrupo as NG
ON G.IdNumGrupo = NG.Id
JOIN Docente as D
ON G.Id=D.IdGrupo
JOIN Estudiante as E
ON E.IdGrupo=G.Id
JOIN Carrera as C
ON G.IdCarrera= C.Id
JOIN Anio as A
ON G.IdAnio = A.Id WHERE E.Nombre='Michelle'