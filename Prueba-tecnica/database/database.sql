CREATE DATABASE prueba_tecnica;
\c 

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE images (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image_url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/*Registrar usuario*/ 
CREATE OR REPLACE FUNCTION register_user(
    p_email VARCHAR(255),
    p_password TEXT
) RETURNS UUID AS $$
DECLARE
    user_id UUID;
BEGIN
    INSERT INTO users (email, password) 
    VALUES (p_email, p_password) 
    RETURNING id INTO user_id;
    
    RETURN user_id;
END;
$$ LANGUAGE plpgsql;

/*Iniciar sesion*/

CREATE OR REPLACE FUNCTION login_user(
    p_email VARCHAR(255)
) RETURNS TABLE(id UUID, password TEXT) AS $$
BEGIN
    RETURN QUERY SELECT users.id, users.password FROM users WHERE users.email = p_email;
END;
$$ LANGUAGE plpgsql;

/*Subir imagen*/
CREATE OR REPLACE FUNCTION upload_image(
    p_user_id UUID,
    p_title VARCHAR(255),
    p_description TEXT,
    p_image_url TEXT
) RETURNS UUID AS $$
DECLARE
    image_id UUID;
BEGIN
    INSERT INTO images (user_id, title, description, image_url) 
    VALUES (p_user_id, p_title, p_description, p_image_url)
    RETURNING id INTO image_id;
    
    RETURN image_id;
END;
$$ LANGUAGE plpgsql;

/*Obtener imagenes*/
CREATE OR REPLACE FUNCTION get_user_images(p_user_id UUID) 
RETURNS TABLE(id UUID, title VARCHAR, description TEXT, image_url TEXT, created_at TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT images.id, images.title, images.description, images.image_url, images.created_at 
    FROM images 
    WHERE images.user_id = p_user_id
    ORDER BY created_at DESC;
END;
$$ LANGUAGE plpgsql;