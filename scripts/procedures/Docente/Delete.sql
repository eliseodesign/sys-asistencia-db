CREATE PROCEDURE SPDeleteDocente
  @Id Int
AS 
BEGIN 
    IF EXISTS (SELECT * FROM Docente WHERE Id = @Id) AND @Id Is NOT NULL
      BEGIN 
        DELETE FROM Docente WHERE Id = @Id
      END
    ELSE
      PRINT 'El Id especificado no corresponde a un registro'
END