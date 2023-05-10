CREATE PROCEDURE SPCreateNumGrupo
  @Nombre varchar(7)
AS  
BEGIN
  INSERT INTO NumGrupo (Nombre)
  VALUES (@Nombre)
  SET @idNumGrupo = SCOPE_IDENTITY()
END;