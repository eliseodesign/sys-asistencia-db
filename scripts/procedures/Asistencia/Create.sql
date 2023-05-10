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
