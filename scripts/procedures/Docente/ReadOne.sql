CREATE PROCEDURE SPReadOneDocente
  @Id Int
AS
BEGIN
  IF(@Id IS NOT NULL)
  BEGIN 
    SELECT * FROM Docente WHERE Id = @Id
  END
  ELSE 
    PRINT 'No existe alumno con Id ' + @Id
END
