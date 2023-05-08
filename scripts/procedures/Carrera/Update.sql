CREATE PROCEDURE SPUpdateCarrera
(
    @Id TINYINT,
    @Nombre VARCHAR(50),
    @Siglas VARCHAR(7)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@Id IS NOT NULL AND @Nombre != '' AND @Siglas != '')
    BEGIN
        IF EXISTS(SELECT * FROM Carrera WHERE Id = @Id)
            BEGIN
                UPDATE Carrera
                SET Nombre = @Nombre,
                    Siglas = @Siglas
                WHERE Id = @Id;
            END
        ELSE
            BEGIN
                PRINT 'ERROR: La carrera especificada no existe.';
            END
    END
    ELSE
        BEGIN
            PRINT 'ERROR: Debe ingresar un id válido, un nombre y siglas válidas para la carrera.';
        END
END
