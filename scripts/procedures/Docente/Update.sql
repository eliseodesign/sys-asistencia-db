CREATE PROCEDURE SPUpdateDocente
    @Id Int,
	  @Nombre varchar(20),
    @Apellidos varchar(20),
    @Dui varchar(9),
    @Cel varchar(9),
    @Huella varbinary(max),
    @IdGrupo tinyint,
    @IdCarrera tinyint
AS 
BEGIN
    IF ( @Nombre != '' AND @Apellidos != '' AND @Dui != '' AND @Cel != '' 
         AND @IdGrupo IS NOT NULL AND @IdCarrera IS NOT NULL AND @Id IS NOT NULL 
         AND @Huella IS NOT NULL AND DATALENGTH(@Huella) > 0
        )
        BEGIN
        IF EXISTS(SELECT * FROM Docente WHERE Id = @Id)
            BEGIN
            UPDATE Docente 
            SET Nombre = @Nombre, Apellidos = @Apellidos, 
                Cel = @Cel, Huella = @Huella, IdGrupo = @IdGrupo, IdCarrera = @IdCarrera
			      WHERE Id = @Id;
            END
        END
    ELSE
        PRINT 'Datos erroneos'

END;