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
        END
        ELSE
          PRINT 'Ya existe un Estudiante con ese DUI'
    ELSE
        PRINT 'Datos erroneos'

END;


exec SPCrearEstudiante
    'Eliseo Francisco',
    'Arevalo Espinoza',
    '1234567-9',
    '2122-2121',
    0x4D5A90000300000004000000FFFF0000,
    1;
