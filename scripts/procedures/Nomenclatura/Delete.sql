CREATE PROCEDURE SPDeleteNomenclatura
    @Id tinyint
AS
BEGIN
    IF @Id IS NOT NULL
        BEGIN
            DELETE FROM Nomenclatura WHERE Id = @Id
            
        END
    ELSE
        BEGIN
            PRINT 'El Id es nulo, por favor especifique un valor válido'
        END
END
