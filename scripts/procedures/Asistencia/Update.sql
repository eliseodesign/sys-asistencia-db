CREATE PROCEDURE SPUpdateAsistencia
   @Id Int,
   @Observaciones varchar(50),
   @fechaActual DATETIME,
   --FKS
   @IdEstudiante int,
   @IdDocente int,
   @IdCriterio tinyint,
   @IdNomenclatura tinyint
AS 
BEGIN
	IF EXISTS(SELECT * FROM Docente WHERE Id = @Id)
	BEGIN
		UPDATE Asistencia 
		SET Observaciones = @Observaciones,
			Fecha = (CASE WHEN @fechaActual is null THEN GETDATE() ELSE @fechaActual END)
		WHERE IdEstudiante = @IdEstudiante 
	END
END;
