const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const { sequelize } = require('./config/database');

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.use('/auth', require('./routes/authRoutes'));
app.use('/uploads', express.static('src/uploads'));
app.use('/images', require('./routes/imageRoutes'));

const PORT = process.env.PORT || 5000;
sequelize.sync().then(() => {
    console.log('Base de datos sincronizada');
    app.listen(PORT, () => console.log(`Servidor en http://localhost:${PORT}`));
}).catch(err => console.error('Error al conectar la DB:', err));

module.exports = app;