CREATE PROCEDURE SPCreateCriterio
  @Nombre varchar(20),
  @Descripcion varchar(150)
AS  
BEGIN
  IF(@Nombre != '' AND @Descripcion != '' 
    AND NOT EXISTS(SELECT * FROM Criterio WHERE Nombre = @Nombre))
    BEGIN
      INSERT INTO Criterio (Nombre, Descripcion)
      VALUES (@Nombre, @Descripcion)
    END
END;
