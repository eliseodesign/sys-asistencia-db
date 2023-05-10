CREATE PROCEDURE SPCeateTurno
   @Nombre varchar(7)
AS
BEGIN
    SET NOCOUNT ON;

    IF(@Nombre != '')
        BEGIN
            INSERT INTO Turno(Nombre) VALUES (@Nombre);
            SELECT SCOPE_IDENTITY() AS 'Id';
        END
    ELSE
        BEGIN
            PRINT 'No se puede agregar un turno sin nombre.';
        END
END;