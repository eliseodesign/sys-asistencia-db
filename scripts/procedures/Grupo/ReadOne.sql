CREATE PROCEDURE SPReadOneGrupo
    @id tinyint
AS
BEGIN
    SELECT *
    FROM Grupo
    WHERE Id = @id
END;
