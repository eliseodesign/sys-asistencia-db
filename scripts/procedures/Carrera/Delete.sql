CREATE PROCEDURE SPDeleteCarrera
   @Id tinyint
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM Carrera WHERE Id = @Id;
    PRINT 'Registro eliminado correctamente';
END