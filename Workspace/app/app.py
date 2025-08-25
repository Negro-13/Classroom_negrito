from flask import Flask, render_template, request, redirect, url_for, send_from_directory
from werkzeug.utils import secure_filename
import os

app = Flask(__name__)
app.secret_key = "secret"
app.config['UPLOAD_FOLDER'] = 'uploads'

if not os.path.exists('uploads'):
    os.makedirs('uploads')

anuncios = []

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/clase")
def clase():
    return render_template("clase.html")

@app.route("/clase_docente", methods=['GET', 'POST'])
def clase_docente():
    if request.method == 'POST':
        texto = request.form.get('anuncio')
        archivo = request.files.get('archivo')
        filename = None
        if archivo and archivo.filename != '':
            filename = secure_filename(archivo.filename)
            archivo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        anuncios.append({'texto': texto, 'archivo': filename})
        return redirect(url_for('clase_docente'))
    return render_template("clase_docente.html", anuncios=anuncios)

# Nueva ruta para servir archivos subidos
@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

if __name__ == "__main__":
    app.run(debug=True, port=5000)
