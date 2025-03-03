# Aplicación de Autenticación y Gestor de Imágenes con Flutter & Node.js

## Introducción
Este proyecto es una aplicación desarrollada en **Flutter** (Frontend) y **Node.js con Express y PostgreSQL** (Backend), que permite a los usuarios autenticarse, capturar imágenes, almacenarlas en el servidor y visualizarlas con su respectiva información.

---

## Tecnologías Utilizadas

### **Frontend (Flutter)**
- Flutter (Dart)
- **Gestor de estado:** Bloc
- **Manejo de rutas:** GoRouter
- **HTTP Requests:** Dio
- **Captura de Imágenes:** image_picker

### **Backend (Node.js + Express + PostgreSQL)**
- Node.js con Express
- PostgreSQL
- Autenticación con JWT
- Almacenamiento de imágenes en el servidor

---

## Funcionalidad

- ✅ **Autenticación de usuario** (email & password, con JWT).
- ✅ **Protección de rutas** (Solo usuarios autenticados pueden subir/ver imágenes).
- ✅ **Captura de imágenes** (Usando la cámara del dispositivo o la galería).
- ✅ **Formulario con validaciones** (Campos de título y descripción).
- ✅ **Subida de imágenes al backend** y almacenamiento de metadatos.
- ✅ **Visualización de imágenes subidas** con scroll infinito.

---

## Instalación y Configuración

### **1️⃣ Configurar el Backend**

#### **1.1 Prerrequisitos**
- Instalar **Node.js** y **PostgreSQL** en tu sistema.

#### **1.2 Crear la Base de Datos**
Ejecuta los siguientes comandos en PostgreSQL:
```sql
CREATE DATABASE gestor_imagenes;
```
Ejecuta el script de creación de tablas y procedimientos almacenados desde `database.sql`.

#### **1.3 Configurar Variables de Entorno**
Crea un archivo `.env` en `backend/` con:
```env
PORT=5000
DB_HOST=localhost
DB_USER=tu_usuario
DB_PASSWORD=tu_contraseña
DB_NAME=gestor_imagenes
JWT_SECRET=tu_clave_secreta
```

#### **1.4 Instalar dependencias y ejecutar el backend**
```bash
cd backend
npm install
npm start
```
El backend estará corriendo en `http://localhost:5000`.

---

### **2️⃣ Configurar el Frontend**

#### **2.1 Prerrequisitos**
- Instalar **Flutter** en tu sistema.

#### **2.2 Configurar el archivo de entorno**
En `lib/config.dart`, agrega la URL del backend:
```dart
const String baseUrl = "http://localhost:5000";
```

#### **2.3 Instalar dependencias y ejecutar la app**
```bash
cd frontend
flutter pub get
flutter run
```
Esto iniciará la aplicación en un emulador o dispositivo físico.

---

## Estructura del Proyecto
```
root/
│── backend/        # Backend con Node.js y Express
│── frontend/       # Aplicación Flutter
│── database.sql    # Script para crear la base de datos
README.md       # Documentación del proyecto
```

---

## Uso de la Aplicación
1️⃣ **Abrir la aplicación y autenticarse.**
2️⃣ **Capturar una imagen con la cámara o seleccionar una de la galería.**
3️⃣ **Ingresar un título y una descripción.**
4️⃣ **Subir la imagen al servidor.**
5️⃣ **Visualizar las imágenes subidas en la galeria.**

---

## 👨‍💻 Autor
- **Desarrollado por:** Juan Manuel Ortiz Tovar

