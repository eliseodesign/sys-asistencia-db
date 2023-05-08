CREATE PROCEDURE SPUpdateNomenclatura
(
    @Id tinyint,
    @Letra char(1),
    @Descripcion varchar(20)
)
AS
BEGIN
    IF @Id IS NOT NULL AND @Letra != '' AND @Descripcion != ''
    BEGIN
        UPDATE Nomenclatura SET
            Letra = @Letra,
            Descripcion = @Descripcion
        WHERE Id = @Id
        
    END
    ELSE
    BEGIN
        PRINT 'No se pudo actualizar el registro debido a que algunos campos estaban vacíos o el Id es nulo'
    END
END
