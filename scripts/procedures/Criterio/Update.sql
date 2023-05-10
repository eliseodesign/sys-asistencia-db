CREATE PROCEDURE SPUpdateCriterio
  @Id tinyint,
  @Nombre varchar(20),
  @Descripcion varchar(150)
AS  
BEGIN
  IF(@Id IS NOT NULL AND @Nombre != '' AND @Descripcion != ''
     AND EXISTS(SELECT * FROM Criterio WHERE Id = @Id))
     BEGIN 
        UPDATE Criterio
        SET Nombre = @Nombre, Descripcion = @Descripcion
        WHERE Id = @Id
     END
END;
