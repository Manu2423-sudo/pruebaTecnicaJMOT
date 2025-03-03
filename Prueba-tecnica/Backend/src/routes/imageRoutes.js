const express = require('express');
const upload = require('../middlewares/uploadMiddleware');
const authMiddleware = require('../middlewares/authMiddleware');
const { uploadImage, getUserImages } = require('../controllers/imageController');

const router = express.Router();

router.post('/upload', authMiddleware, upload.single('image'), uploadImage);
router.get('/all', authMiddleware, getUserImages);

module.exports = router;
