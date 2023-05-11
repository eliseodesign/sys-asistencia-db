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
   BEGIN
      INSERT INTO Asistencia(Observaciones, Fecha, IdEstudiante, IdDocente, 
	  IdCriterio, IdNomenclatura) 

	  VALUES (@Observaciones, @fechaActual, @IdEstudiante, @IdDocente,
	  @IdCriterio, @IdNomenclatura)

      PRINT 'La asistencia se insertó correctamente'
      SELECT SCOPE_IDENTITY() AS 'Id';
   END
END;
