CREATE PROCEDURE SPReadOneAsistencia
  @Id Int
AS
BEGIN
  IF(@Id IS NOT NULL)
  BEGIN 
    SELECT * FROM Asistencia WHERE Id = @Id
  END
  ELSE 
    PRINT 'No existe asistencia con Id ' + @Id
END;