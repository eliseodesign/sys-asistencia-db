CREATE PROCEDURE SPReadOneEstudiante
(
  @Id Int
)
AS
BEGIN
  IF(@Id IS NOT NULL)
  BEGIN 
    SELECT * FROM Estudiante
  END
  ELSE 
    PRINT 'No existe alumno con Id ' + @Id
END