CREATE PROCEDURE SPCarrera
(
    @Id INT = NULL,
    @Nombre VARCHAR(50) = NULL,
    @Siglas VARCHAR(7) = NULL,
    @Action VARCHAR(10)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO Carrera (Nombre, Siglas)
        VALUES (@Nombre, @Siglas);

        SELECT @@IDENTITY AS 'Id';
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE Carrera
        SET Nombre = @Nombre,
            Siglas = @Siglas
        WHERE Id = @Id;
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM Carrera
        WHERE Id = @Id;
    END
    ELSE IF @Action = 'GETALL'
    BEGIN
        SELECT Id, Nombre, Siglas
        FROM Carrera;
    END
END
