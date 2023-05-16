CREATE PROCEDURE SPUpdateCarrera
    @Id TINYINT,
    @Nombre VARCHAR(50),
    @Sigla VARCHAR(7)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@Id IS NOT NULL AND @Nombre != '' AND @Sigla != '')
    BEGIN
        IF EXISTS(SELECT * FROM Carrera WHERE Id = @Id)
            BEGIN
                UPDATE Carrera
                SET Nombre = @Nombre,
                    Sigla = @Sigla
                WHERE Id = @Id;
            END
        ELSE
            BEGIN
                PRINT 'ERROR: La carrera especificada no existe.';
            END
    END
    ELSE
        BEGIN
            PRINT 'ERROR: Debe ingrer un id válido, un nombre y siglas válidas para la carrera.';
        END
END
