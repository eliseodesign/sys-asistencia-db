CREATE PROCEDURE SPCreateGrupoDocente
   @IdDocente int,
   @IdGrupo Tinyint

AS
BEGIN
    INSERT INTO GrupoDocente(IdDocente, IdGrupo) VALUES (@IdDocente, @IdGrupo)
    PRINT 'Los datos de GrupoDocente se insertaron correctamente'
    SELECT SCOPE_IDENTITY() AS 'Id';
END;