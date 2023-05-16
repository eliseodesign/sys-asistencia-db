CREATE PROCEDURE SPCreateDocenteGrupo
   @Id int,
   @IdDocente int,
   @IdGrupo Tinyint

AS
BEGIN
    INSERT INTO DocenteGrupo(IdDocente, IdGrupo) VALUES (@IdDocente, @IdGrupo)
    PRINT 'Los datos de DocenteGrupo se insertaron correctamente'
    SELECT SCOPE_IDENTITY() AS 'Id';
END;