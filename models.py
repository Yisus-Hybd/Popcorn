from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

# Modelo de Usuarios
class Usuarios(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    nombre_usuario = db.Column(db.String(255), unique=True, nullable=False)
    email = db.Column(db.String(255), unique=True, nullable=False)
    contraseña = db.Column(db.String(255), nullable=False)
    tipo_usuario = db.Column(db.String(50), nullable=False, default='estandar')

# Modelo de Peliculas
class Peliculas(db.Model):
    __tablename__ = 'peliculas'
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(255), nullable=False)
    descripcion = db.Column(db.Text, nullable=False)
    fecha_publicacion = db.Column(db.Date, nullable=False)
    moderador_id = db.Column(db.Integer, nullable=False)
    imagen = db.Column(db.String(255), nullable=False)  # Campo para almacenar el nombre del archivo de imagen

