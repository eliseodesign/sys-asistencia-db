SELECT D.Nombre +' '+D.Apellidos as 'Nombre del Docente',
C.Siglas as '	Siglas del nombre',
G.EstudiantesMax as 'Cantidad maxima de estuidantes'
FROM Docente as D
JOIN Carrera as C
ON D.IdCarrera=C.Id
JOIN Grupo as G
ON G.IdCarrera=C.Id
WHERE  C.Siglas='TIDS'