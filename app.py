from flask import Flask, render_template, request, redirect, url_for, session
import time

app = Flask(__name__)
app.secret_key = 'mysecret'  # Para manejar sesiones

# Diccionario temporal para almacenar usuarios
usuarios_registrados = {
    'test': 'password123'
}

# Ruta para la pagina de inicio de sesion (Login)
@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'intentos' not in session:
        session['intentos'] = 0  # Contador de intentos

    if request.method == 'POST':
        usuario = request.form['usuario']
        contraseña = request.form['contraseña']

        # Si el usuario ha intentado 5 veces, mostramos el temporizador de 30 segundos
        if session['intentos'] >= 5:
            session['timeout'] = int(time.time()) + 30  # Agrega 30 segundos
            return render_template('login.html', timeout=True)

        # Validacion de credenciales
        if usuario in usuarios_registrados and usuarios_registrados[usuario] == contraseña:
            session['intentos'] = 0  # Reiniciamos los intentos en caso de exito
            return redirect(url_for('home'))  # Redirige a la página de Home si las credenciales son validas
        else:
            session['intentos'] += 1  # Incrementamos el contador de intentos
            error = "Usuario no encontrado"  # Mensaje de error
            return render_template('login.html', error=error)

    # Si el timeout ha terminado, permitimos otro intento
    if 'timeout' in session and int(time.time()) >= session['timeout']:
        session['intentos'] = 0  # Reiniciamos los intentos cuando se acaba el timeout
        session.pop('timeout', None)

    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        # Obtener los datos del formulario
        usuario = request.form['usuario']
        contraseña = request.form['contraseña']
        
        # Validar si el usuario ya existe
        if usuario in usuarios_registrados:
            error = "El usuario ya existe"
            return render_template('register.html', error=error)
        
        # Agregar el nuevo usuario
        usuarios_registrados[usuario] = contraseña
        
        # Mensaje de exito y redirigir al login
        success = True
        return render_template('register.html', success=success)
    
    return render_template('register.html')

# Ruta para la raiz del sitio (redirige al login)
@app.route('/')
def index():
    return redirect(url_for('login'))

# Ruta para la pagina de Home (despues de iniciar sesión con exito)
@app.route('/home')
def home():
    logged_in = request.args.get('logged_in', 'True') == 'True'
    return render_template('home.html', logged_in=logged_in)



# Bloque para iniciar la aplicación
if __name__ == '__main__':
    app.run(debug=True)
