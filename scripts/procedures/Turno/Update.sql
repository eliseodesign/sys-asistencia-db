CREATE PROCEDURE SPUpdateTurno
    @Id INT,
    @Nombre VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Turno
    SET Nombre = @Nombre
    WHERE Id = @Id;
END
