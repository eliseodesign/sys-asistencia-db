# sys-asistencia-db

## Descripción
Sistemas de bases de datos sqlserver para el proyecto [sys-asistencia-desktop](https://github.com/eliseodesign/sys-asistencia-desktop)

Puedes ver el diagrama E-R haciendo [click aquí](./docs/schema-diagram.jpg)


## Como usar
Puedes clonar o descargar el repo y crear la base de datos con las tablas ejecutando **run.bat**

Puede que tu usuario *System Administrator* no tenga acceso a login asi que puedes...
```sql
ALTER LOGIN sa WITH PASSWORD = 'tu_nueva_contraseña';
GO
ALTER LOGIN sa ENABLE;
GO
```



## Estructuras de carpetas

```markdown
├── doc/
├── scripts/ 
│   ├── procedures/ 
│   ├── crud-dml.sql 
│   └── tables.sql 
└── README.md
```

- **doc/** cntiene documentación del proyecto.

- **scripts/** contiene los scripts utilizados en el proyecto.

- **scripts/crud-dml.sql** contiene scripts para realizar operaciones CRUD

- **scripts/procedures/** contiene scripts de procedimientos almacenados.

- **scripts/tables.sql** contiene el código para crear las tablas de la base de datos