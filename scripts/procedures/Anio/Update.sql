CREATE PROCEDURE SPUpdateAnio 
  @Id Tinyint,
  @Nombre Varchar(7)
AS
BEGIN
    IF(@Nombre != '')
        BEGIN 
        UPDATE Anio Set Nombre = @Nombre WHERE Id = @Id
        END
    ELSE
      PRINT 'No se actualizo el Año, faltan datos'

END