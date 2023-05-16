CREATE PROCEDURE SPCreateCarrera
    @Nombre VARCHAR(50),
    @Sigla VARCHAR(7)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@Nombre != '' AND @Sigla != '')
        BEGIN
            INSERT INTO Carrera (Nombre, Sigla)
            VALUES (@Nombre, @Sigla);

            SELECT SCOPE_IDENTITY() AS 'Id';
        END
    ELSE
        BEGIN
            PRINT 'ERROR: Debe ingresar un nombre y siglas válidas para la carrera.';
        END
END;