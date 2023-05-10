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