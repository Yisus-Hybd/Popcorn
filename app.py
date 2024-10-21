from flask import Flask, render_template, request, redirect, url_for, session
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import secure_filename
import os
from models import db, Peliculas, Usuarios

# Inicializa la aplicacion de Flask
app = Flask(__name__)

# Configurar la base de datos
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://popcorn_admin:zamaniegos@localhost/popcorn'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = '12345678' 
app.config['UPLOAD_FOLDER'] = 'static/uploads'  # Ruta donde se guardaran las imágenes


# Inicializa SQLAlchemy con la app
db.init_app(app)

# Crea tablas si no existen
with app.app_context():
    db.create_all()

@app.route('/moderador_dashboard', methods=['GET', 'POST'])
def moderador_dashboard():
    if session.get('tipo_usuario') != 'moderador':
        return redirect(url_for('home'))

    if request.method == 'POST':
        titulo = request.form['titulo']
        descripcion = request.form['descripcion']
        fecha_publicacion = request.form['fecha_publicacion']
        
        # Procesa la imagen
        if 'imagen_pelicula' not in request.files:
            return redirect(request.url)

        imagen = request.files['imagen_pelicula']
        if imagen.filename == '':
            return redirect(request.url)

        if imagen:
            filename = secure_filename(imagen.filename)
            imagen.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

            # Guarda los datos de la nueva película en la base de datos
            nueva_pelicula = Peliculas(
                titulo=titulo,
                descripcion=descripcion,
                fecha_publicacion=fecha_publicacion,
                moderador_id=session.get('usuario_id'),
                imagen=filename  # Guarda el nombre del archivo de imagen
            )
            db.session.add(nueva_pelicula)
            db.session.commit()

            return redirect(url_for('moderador_dashboard'))

    # Obtener todas las películas para mostrarlas en el dashboard
    peliculas = Peliculas.query.all()

    return render_template('moderador_dashboard.html', peliculas=peliculas)

# Ruta para la pagina principal
@app.route('/')
def index():
    return redirect(url_for('home'))

# Ruta para la pagina de inicio
@app.route('/home')
def home():
    return render_template('home.html')

# Ruta para el registro de nuevos usuarios
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        nombre_usuario = request.form['usuario']
        email = request.form['email']
        contraseña = request.form['contraseña']

        # Verificaa si los campos estan completos
        if not nombre_usuario or not email or not contraseña:
            return render_template('register.html', error="Faltan datos para el registro")

        # Crea el hash de la contraseña
        contraseña_hash = generate_password_hash(contraseña)

        # Crea el nuevo usuario con la contraseña hasheada
        nuevo_usuario = Usuarios(nombre_usuario=nombre_usuario, email=email, contraseña=contraseña_hash, tipo_usuario='estandar')

        # Guarda el nuevo usuario en la base de datos
        db.session.add(nuevo_usuario)
        db.session.commit()

        # Redirigir al login despues del registro exitoso
        return redirect(url_for('login'))

    return render_template('register.html')


# Ruta para iniciar sesion
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        usuario = request.form['usuario']
        contraseña = request.form['contraseña']
        
        # Buscar el usuario en la base de datos
        usuario_encontrado = Usuarios.query.filter_by(nombre_usuario=usuario).first()

        if usuario_encontrado and check_password_hash(usuario_encontrado.contraseña, contraseña):
            # Iniciar sesion y almacenar datos del usuario en la sesion
            session['usuario_id'] = usuario_encontrado.id
            session['tipo_usuario'] = usuario_encontrado.tipo_usuario

            if usuario_encontrado.tipo_usuario == 'moderador':
                return redirect(url_for('moderador_dashboard'))
            else:
                return redirect(url_for('home'))
        else:
            return render_template('login.html', error="Usuario o contraseña incorrectos.")
    return render_template('login.html')

# Ruta para cerrar sesion
@app.route('/logout')
def logout():
    session.clear()  # Limpiar la sesin del usuario
    return redirect(url_for('login'))  # Redirigir al login despues de cerrar sesion


# Ruta para eliminar pelicula/serie
@app.route('/eliminar_pelicula/<int:id>', methods=['POST'])
def eliminar_pelicula(id):
    pelicula = Peliculas.query.get_or_404(id)

    # Eliminar la película de la base de datos
    db.session.delete(pelicula)
    db.session.commit()

    return redirect(url_for('moderador_dashboard'))


if __name__ == '__main__':
    app.run(debug=True)
