CREATE PROCEDURE SPCreateAnio
   @Nombre varchar(7)
AS
BEGIN
   IF(@Nombre != '')
   BEGIN
      INSERT INTO Anio(Nombre) VALUES (@Nombre)
      PRINT 'El Anio se ha insertado correctamente'
      SELECT SCOPE_IDENTITY() AS 'Id';
   END
   ELSE
      PRINT 'No se ha insertado el Anio debido a datos faltantes'
END;
 
CREATE PROCEDURE SPDeleteAnio
  @Id Tinyint
AS
BEGIN
  IF EXISTS(SELECT * FROM Anio WHERE Id = @Id)
    BEGIN 
    DELETE FROM Anio WHERE Id = @Id
    END
  ELSE
    PRINT 'El registro no existe'
END 
CREATE PROCEDURE SPReadAnio
AS
BEGIN
  SELECT * FROM Anio
END 
CREATE PROCEDURE SPUpdateAnio 
  @Id Tinyint,
  @Nombre Varchar(7)
AS
BEGIN
    IF(@Nombre != '')
        BEGIN 
        UPDATE Anio Set Nombre = @Nombre WHERE Id = @Id
        END
    ELSE
      PRINT 'No se actualizo el Año, faltan datos'

END 
CREATE PROCEDURE SPCreateAsistencia
   @Observaciones varchar(50),
   @fechaActual DATETIME,
   --FKS
   @IdEstudiante int,
   @IdDocente int,
   @IdCriterio tinyint,
   @IdNomenclatura tinyint
AS
BEGIN
   SET @fechaActual = GETDATE()
   IF(@fechaActual != null)
   BEGIN
      INSERT INTO Asistencia(Observaciones, Fecha, IdEstudiante, IdDocente, 
	  IdCriterio, IdNomenclatura) 

	  VALUES (@Observaciones, @fechaActual, @IdEstudiante, @IdDocente,
	  @IdCriterio, @IdNomenclatura)

      PRINT 'La asistencia se insertó correctamente'
      SELECT SCOPE_IDENTITY() AS 'Id';
   END
   ELSE
      PRINT 'No se ha insertado debido a datos faltantes'
END;
 
CREATE PROCEDURE SPDeleteAsistencia
  @Id Int
AS 
BEGIN 
    IF EXISTS (SELECT * FROM Asistencia WHERE Id = @Id) AND @Id Is NOT NULL
      BEGIN 
        DELETE FROM Asistencia WHERE Id = @Id
        PRINT 'Se ha eliminado correctamente'
      END
    ELSE
      PRINT 'El Id especificado no corresponde a un registro'
END;
 
CREATE PROCEDURE SPReadAsistencia
AS
BEGIN
  SELECT * FROM Asistencia
END; 
CREATE PROCEDURE SPReadOneAsistencia
  @Id Int
AS
BEGIN
  IF(@Id IS NOT NULL)
  BEGIN 
    SELECT * FROM Asistencia WHERE Id = @Id
  END
  ELSE 
    PRINT 'No existe asistencia con Id ' + @Id
END; 
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
 
CREATE PROCEDURE SPCreateCarrera
    @Nombre VARCHAR(50),
    @Siglas VARCHAR(7)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@Nombre != '' AND @Siglas != '')
        BEGIN
            INSERT INTO Carrera (Nombre, Siglas)
            VALUES (@Nombre, @Siglas);

            SELECT SCOPE_IDENTITY() AS 'Id';
        END
    ELSE
        BEGIN
            PRINT 'ERROR: Debe ingresar un nombre y siglas válidas para la carrera.';
        END
END; 
CREATE PROCEDURE SPDeleteCarrera
   @Id tinyint
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM Carrera WHERE Id = @Id;
    PRINT 'Registro eliminado correctamente';
END 
CREATE PROCEDURE SPReadCarrera
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Carrera;
END
 
CREATE PROCEDURE SPUpdateCarrera
    @Id TINYINT,
    @Nombre VARCHAR(50),
    @Siglas VARCHAR(7)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@Id IS NOT NULL AND @Nombre != '' AND @Siglas != '')
    BEGIN
        IF EXISTS(SELECT * FROM Carrera WHERE Id = @Id)
            BEGIN
                UPDATE Carrera
                SET Nombre = @Nombre,
                    Siglas = @Siglas
                WHERE Id = @Id;
            END
        ELSE
            BEGIN
                PRINT 'ERROR: La carrera especificada no existe.';
            END
    END
    ELSE
        BEGIN
            PRINT 'ERROR: Debe ingrer un id válido, un nombre y siglas válidas para la carrera.';
        END
END
 
CREATE PROCEDURE SPCreateCriterio
  @Nombre varchar(20),
  @Descripcion varchar(150)
AS  
BEGIN
  IF(@Nombre != '' AND @Descripcion != '' 
    AND NOT EXISTS(SELECT * FROM Criterio WHERE Nombre = @Nombre))
    BEGIN
      INSERT INTO Criterio (Nombre, Descripcion)
      VALUES (@Nombre, @Descripcion)
    END
END;
 
CREATE PROCEDURE SPReadCriterios
AS  
BEGIN
  SELECT * FROM Criterio
END;
 
CREATE PROCEDURE SPDeleteCriterio
  @Id tinyint
AS  
BEGIN
  IF(@Id IS NOT NULL AND EXISTS(SELECT * FROM Criterio WHERE Id = @Id))
  BEGIN
    DELETE FROM Criterio WHERE Id = @Id
  END
END;
 
CREATE PROCEDURE SPUpdateCriterio
  @Id tinyint,
  @Nombre varchar(20),
  @Descripcion varchar(150)
AS  
BEGIN
  IF(@Id IS NOT NULL AND @Nombre != '' AND @Descripcion != ''
     AND EXISTS(SELECT * FROM Criterio WHERE Id = @Id))
     BEGIN 
        UPDATE Criterio
        SET Nombre = @Nombre, Descripcion = @Descripcion
        WHERE Id = @Id
     END
END;
 
CREATE PROCEDURE SPCrearDocente
	  @Nombre varchar(20),
    @Apellidos varchar(20),
    @Dui varchar(9),
    @Cel varchar(9),
    @Huella varbinary(max),
    @IdGrupo tinyint,
    @IdCarrera tinyint
AS 
BEGIN
    IF ( @Nombre != '' AND @Apellidos != '' AND @Dui != '' AND @Cel != '' 
         AND @IdGrupo IS NOT NULL AND @IdCarrera IS NOT NULL
         AND @Huella IS NOT NULL AND DATALENGTH(@Huella) > 0
        )
        IF NOT EXISTS(SELECT * FROM Docente WHERE Dui = @Dui)
        BEGIN
          INSERT INTO Docente (Nombre,Apellidos,Dui,Cel,Huella,IdGrupo, IdCarrera)
          VALUES(@Nombre, @Apellidos, @Dui, @Cel, @Huella, @IdGrupo, @IdCarrera);
          SELECT SCOPE_IDENTITY() AS 'Id';
        END
        ELSE
          PRINT 'Ya existe un Docente con ese DUI'
    ELSE
        PRINT 'Datos erroneos'

END;


 
CREATE PROCEDURE SPDeleteDocente
  @Id Int
AS 
BEGIN 
    IF EXISTS (SELECT * FROM Docente WHERE Id = @Id) AND @Id Is NOT NULL
      BEGIN 
        DELETE FROM Docente WHERE Id = @Id
      END
    ELSE
      PRINT 'El Id especificado no corresponde a un registro'
END 
CREATE PROCEDURE SPReadDocente
AS
BEGIN
  SELECT * FROM Docente
END 
CREATE PROCEDURE SPReadOneDocente
  @Id Int
AS
BEGIN
  IF(@Id IS NOT NULL)
  BEGIN 
    SELECT * FROM Docente WHERE Id = @Id
  END
  ELSE 
    PRINT 'No existe alumno con Id ' + @Id
END
 
CREATE PROCEDURE SPUpdateDocente
    @Id Int,
	@Nombre varchar(20),
    @Apellidos varchar(20),
    @Dui varchar(9),
    @Cel varchar(9),
    @Huella varbinary(max),
    @IdGrupo tinyint,
    @IdCarrera tinyint
AS 
BEGIN
    IF ( @Nombre != '' AND @Apellidos != '' AND @Dui != '' AND @Cel != '' 
         AND @IdGrupo IS NOT NULL AND @IdCarrera IS NOT NULL AND @Id IS NOT NULL 
         AND @Huella IS NOT NULL AND DATALENGTH(@Huella) > 0
        )
        BEGIN
        IF EXISTS(SELECT * FROM Docente WHERE Id = @Id)
            BEGIN
            UPDATE Docente 
            SET Nombre = @Nombre, Apellidos = @Apellidos, 
                Cel = @Cel, Huella = @Huella, IdGrupo = @IdGrupo, IdCarrera = @IdCarrera
			      WHERE Id = @Id;
            END
        END
    ELSE
        PRINT 'Datos erroneos'

END; 
CREATE PROCEDURE SPCrearEstudiante
	  @Nombre varchar(20),
    @Apellidos varchar(20),
    @Dui varchar(9),
    @Cel varchar(9),
    @Huella varbinary(max),
    @IdGrupo tinyint
AS 
BEGIN
    IF ( @Nombre != '' AND @Apellidos != '' AND @Dui != '' AND @Cel != '' AND @IdGrupo IS NOT NULL
         AND @Huella IS NOT NULL AND DATALENGTH(@Huella) > 0
        )
        IF NOT EXISTS(SELECT * FROM Estudiante WHERE Dui = @Dui)
        BEGIN
          INSERT INTO Estudiante (Nombre,Apellidos,Dui,Cel,Huella,IdGrupo)
          VALUES(@Nombre, @Apellidos, @Dui, @Cel, @Huella, @IdGrupo);
          SELECT SCOPE_IDENTITY() AS 'Id';
        END
        ELSE
          PRINT 'Ya existe un Estudiante con ese DUI'
    ELSE
        PRINT 'Datos erroneos'

END;

 
CREATE PROCEDURE SPDeleteEstudiante
  @Id Int
AS 
BEGIN 
    IF EXISTS (SELECT * FROM Estudiante WHERE Id = @Id) AND @Id Is NOT NULL
      BEGIN 
        DELETE FROM Estudiante WHERE Id = @Id
      END
    ELSE
      PRINT 'El Id especificado no corresponde a un registro'
END; 
CREATE PROCEDURE SPReadEstudiante
AS
BEGIN
  SELECT * FROM Estudiante
END; 
CREATE PROCEDURE SPReadOneEstudiante
  @Id Int
AS
BEGIN
  IF(@Id IS NOT NULL)
  BEGIN 
    SELECT * FROM Estudiante
  END
  ELSE 
    PRINT 'No existe alumno con Id ' + @Id
END; 
CREATE PROCEDURE SPUpdateEstudiante
    @Id Int,
	@Nombre varchar(20),
    @Apellidos varchar(20),
    @Dui varchar(9),
    @Cel varchar(9),
    @Huella varbinary(max),
    @IdGrupo tinyint
AS 
BEGIN
    IF ( @Nombre != '' AND @Apellidos != '' AND @Dui != '' AND @Cel != '' 
         AND @IdGrupo IS NOT NULL AND @Id IS NOT NULL 
         AND @Huella IS NOT NULL AND DATALENGTH(@Huella) > 0
        )
        BEGIN
        IF EXISTS(SELECT * FROM Estudiante WHERE Id = @Id)
            BEGIN
            UPDATE Estudiante 
            SET Nombre = @Nombre, Apellidos = @Apellidos, 
                Cel = @Cel, Huella = @Huella, IdGrupo = @IdGrupo
			      WHERE Id = @Id;
            END
        ELSE 
            PRINT('No existe el estudiante');
    END;
    ELSE
        PRINT('Datos erroneos')

END; 
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
 
CREATE PROCEDURE SPReadGrupo
AS
BEGIN
    SELECT *
    FROM Grupo
END;

 
CREATE PROCEDURE SPReadOneGrupo
    @id tinyint
AS
BEGIN
    SELECT *
    FROM Grupo
    WHERE Id = @id
END;
 
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
CREATE PROCEDURE SPCreateNomenclatura
    @Letra char(1),
    @Descripcion varchar(20)
AS
BEGIN
    IF @Letra != '' AND @Descripcion != ''
      BEGIN
         INSERT INTO Nomenclatura (Letra, Descripcion)
         VALUES (@Letra, @Descripcion)
         
          SELECT SCOPE_IDENTITY() AS 'Id';
      END
    ELSE
      BEGIN
         PRINT 'No se pudo insertar el registro debido a que algunos campos estaban vacíos'
      END
END;
 
CREATE PROCEDURE SPDeleteNomenclatura
    @Id tinyint
AS
BEGIN
    IF @Id IS NOT NULL
        BEGIN
            DELETE FROM Nomenclatura WHERE Id = @Id
            
        END
    ELSE
        BEGIN
            PRINT 'El Id es nulo, por favor especifique un valor válido'
        END
END;
 
CREATE PROCEDURE SPReadNomenclaturas
AS
BEGIN
    SELECT * FROM Nomenclatura
END;
 
CREATE PROCEDURE SPUpdateNomenclatura
    @Id tinyint,
    @Letra char(1),
    @Descripcion varchar(20)
AS
BEGIN
    IF @Id IS NOT NULL AND @Letra != '' AND @Descripcion != ''
        BEGIN
            UPDATE Nomenclatura SET
                Letra = @Letra,
                Descripcion = @Descripcion
            WHERE Id = @Id
            
        END
    ELSE
        BEGIN
            PRINT 'No se pudo actualizar el registro debido a que algunos campos estaban vacíos o el Id es nulo'
        END
END;
 
CREATE PROCEDURE SPCreateNumGrupo
  @Nombre varchar(7)
AS  
BEGIN
  INSERT INTO NumGrupo (Nombre)
  VALUES (@Nombre)
  SET @idNumGrupo = SCOPE_IDENTITY()
END; 
CREATE PROCEDURE SPDeleteNumGrupo
  @Id Tinyint
AS  
BEGIN
  DELETE FROM NumGrupo WHERE Id = @Id
END; 
CREATE PROCEDURE SPCeateTurno
   @Nombre varchar(7)
AS
BEGIN
    SET NOCOUNT ON;

    IF(@Nombre != '')
        BEGIN
            INSERT INTO Turno(Nombre) VALUES (@Nombre);
            SELECT SCOPE_IDENTITY() AS 'Id';
        END
    ELSE
        BEGIN
            PRINT 'No se puede agregar un turno sin nombre.';
        END
END; 
CREATE PROCEDURE SPDeleteTurno
   @Id tinyint
AS
BEGIN
    SET NOCOUNT ON;

    IF(@Id IS NOT NULL
       AND EXISTS(SELECT * FROM Turno WHERE Id = @Id))
        BEGIN
            DELETE FROM Turno WHERE Id = @Id;
            PRINT 'Registro eliminado correctamente.';
        END
    ELSE
        BEGIN
            PRINT 'No se puede eliminar el registro.';
        END
END;

 
CREATE PROCEDURE SPReadTurno
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, Nombre FROM Turno;
END;
 
CREATE PROCEDURE SPUpdateTurno
   @Id tinyint,
   @Nombre varchar(7)
AS
BEGIN
    SET NOCOUNT ON;

    IF(@Id IS NOT NULL AND @Nombre != ''
       AND EXISTS(SELECT * FROM Turno WHERE Id = @Id))
        BEGIN
            UPDATE Turno SET Nombre = @Nombre WHERE Id = @Id;
            PRINT 'Registro actualizado correctamente.';
        END
    ELSE
        BEGIN
            PRINT 'No se puede actualizar el registro.';
        END
END;
 
