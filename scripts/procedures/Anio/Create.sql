CREATE PROCEDURE SPCreateAnio
   @Nombre varchar(7)
AS
BEGIN
   IF(@Nombre != '')
   BEGIN
      INSERT INTO Anio(Nombre) VALUES (@Nombre)
      PRINT 'El Anio se ha insertado correctamente'
      SELECT SCOPE_IDENTITY() AS 'Id';
   END
   ELSE
      PRINT 'No se ha insertado el Anio debido a datos faltantes'
END;
