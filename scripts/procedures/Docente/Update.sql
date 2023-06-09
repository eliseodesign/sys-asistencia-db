CREATE PROCEDURE SPUpdateDocente
    @Id Int,
	@Nombre varchar(20),
    @Apellido varchar(20),
    @Dui varchar(9),
    @Cel varchar(9),
    @Huella varbinary(max),
    @IdCarrera tinyint
AS 
BEGIN
    IF ( @Nombre != '' AND @Apellido != '' AND @Dui != '' AND @Cel != '' 
         AND @IdCarrera IS NOT NULL AND @Id IS NOT NULL 
         AND @Huella IS NOT NULL AND DATALENGTH(@Huella) > 0
        )
        BEGIN
        IF EXISTS(SELECT * FROM Docente WHERE Id = @Id)
            BEGIN
            UPDATE Docente 
            SET Nombre = @Nombre, Apellido = @Apellido, 
                Cel = @Cel, Huella = @Huella, IdCarrera = @IdCarrera
			      WHERE Id = @Id;
            END
        END
    ELSE
        PRINT 'Datos erroneos'

END;