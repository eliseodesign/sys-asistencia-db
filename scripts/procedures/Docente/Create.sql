CREATE PROCEDURE SPCreateDocente
	  @Nombre varchar(20),
    @Apellido varchar(20),
    @Dui varchar(9),
    @Cel varchar(9),
    @Huella varbinary(max),
    @IdCarrera tinyint
AS 
BEGIN
    IF ( @Nombre != '' AND @Apellido != '' AND @Dui != '' AND @Cel != '' 
         AND @IdCarrera IS NOT NULL
         AND @Huella IS NOT NULL AND DATALENGTH(@Huella) > 0
        )
        IF NOT EXISTS(SELECT * FROM Docente WHERE Dui = @Dui)
        BEGIN
          INSERT INTO Docente (Nombre,Apellido,Dui,Cel,Huella, IdCarrera)
          VALUES(@Nombre, @Apellido, @Dui, @Cel, @Huella, @IdCarrera);
          SELECT SCOPE_IDENTITY() AS 'Id';
        END
        ELSE
          PRINT 'Ya existe un Docente con ese DUI'
    ELSE
        PRINT 'Datos erroneos'
END;


