CREATE PROCEDURE SPDeleteCriterio
  @Id tinyint
AS  
BEGIN
  IF(@Id IS NOT NULL AND EXISTS(SELECT * FROM Criterio WHERE Id = @Id))
  BEGIN
    DELETE FROM Criterio WHERE Id = @Id
  END
END;
