CREATE PROCEDURE SPDeleteTurno
   @Id tinyint
AS
BEGIN
    SET NOCOUNT ON;

    IF(@Id IS NOT NULL
       AND EXISTS(SELECT * FROM Turno WHERE Id = @Id))
        BEGIN
            DELETE FROM Turno WHERE Id = @Id;
            PRINT 'Registro eliminado correctamente.';
        END
    ELSE
        BEGIN
            PRINT 'No se puede eliminar el registro.';
        END
END;

