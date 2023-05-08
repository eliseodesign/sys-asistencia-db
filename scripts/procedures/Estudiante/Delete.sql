CREATE PROCEDURE SPDeleteEstudiante
  @Id Int
AS 
BEGIN 
    IF EXISTS (SELECT * FROM Estudiante WHERE Id = @Id) AND @Id Is NOT NULL
      BEGIN 
        DELETE FROM Estudiante WHERE Id = @Id
      END
    ELSE
      PRINT 'El Id especificado no corresponde a un registro'
END