CREATE PROCEDURE SPUpdateGrupo
(
	@Id tinyint,
	@EstudiantesMax Tinyint,
	@DiasPresencial bit,
	-- FK's
	@IdAnio Tinyint,
	@IdCarrera Tinyint ,
	@IdTurno Tinyint
)
AS
BEGIN
	IF (@EstudiantesMax > 0 AND
      @DiasPresencial IS NOT NULL OR @DiasPresencial IN (0, 1)
      AND @IdAnio IS NOT NULL AND @IdCarrera IS NOT NULL 
      AND @IdTurno IS NOT NULL
      AND @Id IS NOT NULL
      )
		BEGIN
			IF (
					EXISTS (SELECT * FROM Carrera WHERE Id = @IdCarrera) 
					AND EXISTS (SELECT * FROM Anio WHERE Id = @IdAnio) 
					AND EXISTS (SELECT * FROM Turno WHERE Id = @IdTurno)
					AND EXISTS (SELECT * FROM Grupo WHERE Id = @Id)
					)
					BEGIN
						UPDATE Grupo 
						SET EstudiantesMax = @estudiantesMax, 
							DiasPresencial = @diasPresencial, 
							IdAnio = @idAnio, 
							IdCarrera = @idCarrera, 
							IdTurno = @idTurno 
						WHERE Id = @Id

					END
			ELSE	
				BEGIN 
					PRINT('No existen registros para esos datos')
				END
		END
	ELSE
		BEGIN
			PRINT('Los datos insertados son invalidos')
		END
END;