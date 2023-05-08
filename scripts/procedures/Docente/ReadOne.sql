CREATE PROCEDURE SPReadOneDocente
  @Id Int
AS
BEGIN
  IF(@Id IS NOT NULL)
  BEGIN 
    SELECT * FROM Docente
  END
  ELSE 
    PRINT 'No existe alumno con Id ' + @Id
END