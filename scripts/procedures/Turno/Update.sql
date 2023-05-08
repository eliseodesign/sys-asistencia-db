CREATE PROCEDURE SPUpdateTurno
(
   @Id tinyint,
   @Nombre varchar(7)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF(@Id IS NOT NULL AND @Nombre != '')
        BEGIN
            UPDATE Turno SET Nombre = @Nombre WHERE Id = @Id;
            PRINT 'Registro actualizado correctamente.';
        END
    ELSE
        BEGIN
            PRINT 'No se puede actualizar el registro.';
        END
END
