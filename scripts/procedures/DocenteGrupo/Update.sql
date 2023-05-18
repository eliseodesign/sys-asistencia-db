CREATE PROCEDURE SPUpdateGrupoDocente
  @Id Int,
  @IdDocente TinyInt,
  @IdGrupo Int
AS
BEGIN
    IF(@IdDocente != null and @IdGrupo != null)
        BEGIN 
        UPDATE GrupoDocente Set IdDocente = @IdDocente, IdGrupo =  @IdGrupo WHERE Id = @Id
        END
    ELSE
      PRINT 'No se actualizo la tabla, faltan datos'

END