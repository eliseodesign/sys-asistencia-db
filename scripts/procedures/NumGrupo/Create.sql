CREATE PROCEDURE SPCreateNumGrupo
  @Nombre varchar(7)
AS  
BEGIN
  INSERT INTO NumGrupo (Nombre)
  VALUES (@Nombre)
  SELECT SCOPE_IDENTITY() as 'Id'
END;