Popcorn - Plataforma de Peliculas
Popcorn es una aplicacion web para la gestion de peliculas, donde los usuarios pueden registrarse, iniciar sesion, y calificar peliculas. Ademas, cuenta con un usuario Moderador que puede agregar y eliminar peliculas.

Requisitos
Python 3.x - Asegurate de tener instalada la version mas reciente de Python.
PostgreSQL - Para gestionar la base de datos localmente. Asegurate de instalar PostgreSQL y tener configurada una base de datos local.
Flask - Un microframework de Python para construir aplicaciones web.
SQLAlchemy - ORM utilizado para interactuar con la base de datos.
Werkzeug - Para el manejo de contrasenas seguras.
PgAdmin (opcional) - Herramienta para gestionar PostgreSQL.
Paqueterias Necesarias
Antes de ejecutar el proyecto, instala los paquetes necesarios. Utiliza pip para instalarlos:

pip install -r requirements.txt

Si tienes problemas para instalar el requirements.txt, utiliza este comando:

pip install flask pip install flask_sqlalchemy pip install psycopg2 pip install werkzeug

Configuracion de la Base de Datos
PostgreSQL: Configura una base de datos local con PostgreSQL. El nombre de la base de datos, usuario y contrasena deben coincidir con la configuracion en el archivo app.py.

Crea una base de datos llamada popcorn en tu servidor local.
Exporta tu archivo .sql en caso de tener uno disponible y ejecutalo para cargar las tablas y datos.
psql -U tu_usuario -d popcorn -f tu_archivo.sql

Configuracion en app.py: Asegurate de que la configuracion de la URI de la base de datos en app.py sea correcta:

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://<usuario>:<contrasena>@localhost/popcorn'

Migracion de Tablas (Si no tienes un archivo .sql): En caso de que necesites crear las tablas en la base de datos, asegúrate de ejecutar el siguiente codigo en el entorno Python del proyecto:
from app import db db.create_all()

Ejecutar el Proyecto
Clona este repositorio:
git clone https://github.com/tu_usuario/popcornhour.git

Configura el entorno virtual (opcional, pero recomendado):
python -m venv venv source venv/bin/activate # En Linux/Mac venv\Scripts\activate # En Windows

Asegurate de que todos los paquetes esten instalados y la base de datos este configurada correctamente.

Ejecuta el servidor Flask:

flask run

Visita http://127.0.0.1:5000 para ver la aplicacion en tu navegador.
Funcionalidades Principales
Usuario Estandar
Registrarse e iniciar sesion.
Ver una lista de peliculas disponibles.
Calificar las peliculas.
Usuario Moderador
Iniciar sesion como moderador (cuenta predeterminada).
Agregar nuevas peliculas con su imagen, descripcion y fecha de publicacion.
Eliminar peliculas de la plataforma.
Informacion Adicional
Usuario Moderador: La cuenta de moderador ya esta predefinida en la base de datos.
Si encuentras algun problema, verifica las dependencias instaladas y la configuracion de la base de datos.