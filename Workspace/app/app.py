from flask import Flask, render_template, request, redirect, url_for, send_from_directory
from werkzeug.utils import secure_filename
import mysql.connector

def connect_to_db():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            port='3306',
            user='root',
            password='',
            database='Classroom',
            ssl_disabled=True
        )
        if connection.is_connected():
            print('Conexión exitosa')
            return connection
    except Exception as ex:
        print('Conexión errónea')
        print(ex)
        return None

connection = connect_to_db()

if connection is None:
    print("ERROR: No se pudo conectar a la base de datos. Verifica la configuración y que el servidor MySQL esté corriendo.")
    import sys
    sys.exit(1)

app = Flask(__name__)



@app.route("/")
def index():
    return render_template("index.html")

@app.route("/clase")
def clase():
    return render_template("clase.html")

@app.route("/admin", methods=["GET", "POST"])
def admin():
    if request.method == "POST":
        dni = request.form.get("dni")
        nombre = request.form.get("nombre")
        apellido = request.form.get("apellido")
        mail = request.form.get("mail")
        telefono = request.form.get("telefono")
        contrasena = request.form.get("contrasena")
        try:
            cursor = connection.cursor()
            sql = "INSERT INTO Profesores (DNI, Nombre, Apellido, Mail, Telefono, Contraseña) VALUES (%s, %s, %s, %s, %s, %s)"
            cursor.execute(sql, (dni, nombre, apellido, mail, telefono, contrasena))
            connection.commit()
            cursor.close()
            msg = "Docente agregado correctamente."
        except Exception as ex:
            msg = f"Error al agregar docente: {ex}"
        return render_template("page_admin.html", mensaje=msg)
    return render_template("page_admin.html")

if __name__ == "__main__":
    app.run(debug=True, port=5000)

# fUNCIONES