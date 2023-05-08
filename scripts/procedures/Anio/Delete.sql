CREATE PROCEDURE SPDeleteAnio
(
  @Id Tinyint
)
AS
BEGIN
  IF EXISTS(SELECT * FROM Anio WHERE Id = @Id)
    BEGIN 
    DELETE FROM Anio WHERE Id = @Id
    END
  ELSE
    PRINT 'El registro no existe'
END