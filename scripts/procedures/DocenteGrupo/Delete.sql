CREATE PROCEDURE SPDeleteDocenteGrupo
  @Id int
AS
BEGIN
  IF EXISTS(SELECT * FROM DocenteGrupo WHERE Id = @Id)
    BEGIN 
    DELETE FROM DocenteGrupo WHERE Id = @Id
    END
  ELSE
    PRINT 'El registro no existe'
END