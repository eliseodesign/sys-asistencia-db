CREATE PROCEDURE SPCreateEstudiante
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

