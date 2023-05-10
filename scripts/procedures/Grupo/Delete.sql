CREATE PROCEDURE SPDeleteGrupo
(
	@Id tinyint
)
AS
BEGIN
	IF (@Id IS NOT NULL AND EXISTS(SELECT * FROM Grupo WHERE Id = @Id))
		BEGIN
			DELETE FROM Grupo WHERE Id = @Id
		END;
	ELSE
			PRINT('Id de Grupo erroneo')
	
END;
