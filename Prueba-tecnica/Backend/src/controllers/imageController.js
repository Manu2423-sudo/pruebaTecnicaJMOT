const pool = require('../config/database');

exports.uploadImage = async (req, res) => {
  const { title, description } = req.body;
  const imageUrl = `/uploads/${req.file.filename}`;

  try {
    const result = await pool.query('SELECT upload_image($1, $2, $3, $4)', [
      req.user.userId, title, description, imageUrl
    ]);

    res.status(201).json({ message: 'Imagen subida', imageId: result.rows[0].upload_image });
  } catch (error) {
    res.status(500).json({ error: 'Error al subir imagen' });
  }
};

exports.getUserImages = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM get_user_images($1)', [req.user.userId]);

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener imágenes' });
  }
};
