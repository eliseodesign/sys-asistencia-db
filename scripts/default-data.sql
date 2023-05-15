EXEC SPCreateAnio '1° Año'
EXEC SPCreateAnio '2° Año'
EXEC SPCreateAnio '4° Año articulado'

EXEC SPCeateTurno 'Matutino'
EXEC SPCeateTurno 'Vespertino'
EXEC SPCeateTurno 'Nocturno'

EXEC SPCreateCarrera 'Tec. en ing. de desarrollo de software', 'TIDS'
EXEC SPCreateCarrera 'Tec. en ing. electrica', 'TIE'
EXEC SPCreateCarrera 'Tec. en gestion y desarrollo de turismo', 'TGDT'

EXEC SPCreateCriterio 'SESIÓN PRESENCIAL','Cuando el estudiante asiste a la clase presencial'
EXEC SPCreateCriterio	'SESIÓN SINCRÓNICA',	'Cuando el estudiante participa en sesión sincrónica programada'
EXEC SPCreateCriterio 'SESIÓN ASINCRÓNICA', 'Cuando el estudiante realiza actividades de aprendizaje programadas para ser realizadas de forma virtual con asesoría del docente'
EXEC SPCreateCriterio 'N/A',	'Por asueto o suspensión debido emergencias emitidas departe de las autoridades.'							
EXEC SPCreateCriterio'NO ASISTIÓ','Cuando el estudiante no asiste de forma presencial o no participa en sesión sincrónica o asincrónica programada	'						

EXEC SPCreateNomenclatura 'S', 'Seguimiento'
EXEC SPCreateNomenclatura'T', 'Asistió tarde'
EXEC SPCreateNomenclatura 'P',	'Solicitó permiso'
EXEC SPCreateNomenclatura 'R',	'Se retiró antes'

---- example data


-- Grupo 
exec SPCreateGrupo 25,'[false,true,true,true,false]',1,1,1 
exec SPCreateGrupo 25,'[true,false,true,true,false]',1,2,2
exec SPCreateGrupo 25,'[true,true,false,true,false]',2,1,1 
exec SPCreateGrupo 25,'[false,true,true,true,false]',3,1,2 
exec SPCreateGrupo 25,'[false,true,true,true,false]',3,1,1 

-- Estudiante 
exec SPCreateEstudiante'Juan', 'Bartolo','123456789','0909-1010',0x32322,2
exec SPCreateEstudiante 'Juan', 'Marroquin','513456789','3209-1010',0x32322,1
exec SPCreateEstudiante 'Fran', 'Betancur','0987212','7832-1010',0x32322,5
exec SPCreateEstudiante 'Kevin', 'Lopez','123456789','1010-1010',0x32322,1
exec SPCreateEstudiante 'Armando', 'Vides','77437438','8323-1010',0x32322,3

-- Docente
exec SPCreateDocente'Helen', 'Bolaños','123456789','0909-1010',0x32322,1,1
exec SPCreateDocente'Karina', 'Caceres','982122332','9021-1010',0x2322,2,1
exec SPCreateDocente'Javier', 'Lopezaños','0987212','1010-1010',0x2322,3,3
exec SPCreateDocente'Angel', 'Duran','123456789','0909-1010',0x2322,4,3
exec SPCreateDocente'Miguel', 'Vides','0987212','0987212',0x2322,5,3

-- Asitencia
EXEC SPCreateAsistencia 'Asistencia completa', '2023-05-10 11:00:00', 2, 2, 1, 1;
EXEC SPCreateAsistencia 'LLego mal vestido', '2023-05-10 11:00:00', 2, 2, 1, 1;
EXEC SPCreateAsistencia 'Demasiado Tarde', '2023-05-10 11:00:00', 2, 2, 1, 2;
EXEC SPCreateAsistencia '4 días seguido faltando', '2023-05-10 11:00:00', 2, 2, 5, 2;
EXEC SPCreateAsistencia '2 días seguido faltando', '2023-05-10 11:00:00', 2, 2, 5, 2;
