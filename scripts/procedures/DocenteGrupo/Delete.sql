CREATE PROCEDURE SPDeleteGrupoDocente
  @Id int
AS
BEGIN
  IF EXISTS(SELECT * FROM GrupoDocente WHERE Id = @Id)
    BEGIN 
    DELETE FROM GrupoDocente WHERE Id = @Id
    END
  ELSE
    PRINT 'El registro no existe'
END