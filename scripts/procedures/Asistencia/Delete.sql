CREATE PROCEDURE SPDeleteAsistencia
  @Id Int
AS 
BEGIN 
    IF EXISTS (SELECT * FROM Asistencia WHERE Id = @Id) AND @Id Is NOT NULL
      BEGIN 
        DELETE FROM Asistencia WHERE Id = @Id
        PRINT 'Se ha eliminado correctamente'
      END
    ELSE
      PRINT 'El Id especificado no corresponde a un registro'
END;
