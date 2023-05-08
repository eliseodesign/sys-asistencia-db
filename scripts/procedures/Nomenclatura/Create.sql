CREATE PROCEDURE SPCreateNomenclatura
    @Letra char(1),
    @Descripcion varchar(20)
AS
BEGIN
    IF @Letra != '' AND @Descripcion != ''
      BEGIN
         INSERT INTO Nomenclatura (Letra, Descripcion)
         VALUES (@Letra, @Descripcion)
         
          SELECT SCOPE_IDENTITY() AS 'Id';
      END
    ELSE
      BEGIN
         PRINT 'No se pudo insertar el registro debido a que algunos campos estaban vacíos'
      END
END
