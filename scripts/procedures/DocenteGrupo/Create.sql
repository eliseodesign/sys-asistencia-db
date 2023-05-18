CREATE PROCEDURE SPCreateGrupoDocente
   @IdDocente int,
   @IdGrupo Tinyint

AS
BEGIN
    IF EXISTS (SELECT * FROM GrupoDocente WHERE IdDocente = @IdDocente AND IdGrupo = @IdGrupo)
    BEGIN
        PRINT "Ya existe esta relación"
    END
    ELSE
    BEGIN
        INSERT INTO GrupoDocente(IdDocente, IdGrupo) VALUES (@IdDocente, @IdGrupo)
        PRINT 'Los datos de GrupoDocente se insertaron correctamente'
        SELECT SCOPE_IDENTITY() AS 'Id';
    END
END;