CREATE PROCEDURE SPCrearCarrera
@Nombre varchar(50),
@Siglas varchar(7)
AS
BEGIN
  INSERT INTO Carrera VALUES(@Nombre, @Siglas)
END;