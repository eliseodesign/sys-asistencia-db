CREATE PROCEDURE SPCreateGrupo
(
	@EstudiantesMax Tinyint,
	@DiasPresencial bit,
	-- FK's
	-- @IdNumGrupo Tinyint,
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
      )
      BEGIN

      IF(
        EXISTS (SELECT * FROM Carrera WHERE Id = @IdCarrera) 
        AND EXISTS (SELECT * FROM Anio WHERE Id = @IdAnio) 
        AND EXISTS (SELECT * FROM Turno WHERE Id = @IdTurno) 
        )
        BEGIN
        -- obtener el número de grupo para la carrera y año dada
              DECLARE @numGrupo tinyint
              SET @numGrupo = (
                  SELECT COUNT(*) + 1
                  FROM Grupo
                  WHERE IdCarrera = @idCarrera AND IdAnio = @idAnio
              )

        -- buscar si ya existe un registro en la tabla NumGrupo para el número de grupo obtenido
              DECLARE @idNumGrupo tinyint
              SET @idNumGrupo = (
                  SELECT Id
                  FROM NumGrupo
                  WHERE Nombre = 'Grupo ' + CAST(@numGrupo AS varchar(2))
              )

        -- si no existe el registro, crearlo y obtener su Id
              IF @idNumGrupo IS NULL
              BEGIN
                  INSERT INTO NumGrupo (Nombre)
                  VALUES ('Grupo ' + CAST(@numGrupo AS varchar(2)))
                  SET @idNumGrupo = SCOPE_IDENTITY()
              END

        -- insertar el nuevo grupo con el IdNumGrupo obtenido
              INSERT INTO Grupo (EstudiantesMax, DiasPresencial, IdNumGrupo, IdAnio, IdCarrera, IdTurno)
              VALUES (@EstudiantesMax, @DiasPresencial, @IdNumGrupo, @IdAnio, @IdCarrera, @IdTurno)

        END;
      ELSE
            BEGIN
            PRINT('No existen datos en otras tablas')
            END;
      END;
  ELSE
      BEGIN
            PRINT('Los datos son invalidos')
      END;
      
END;