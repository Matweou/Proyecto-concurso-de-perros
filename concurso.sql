CREATE DATABASE ConcursoPerros;
USE ConcursoPerros;

-- Crear la tabla Integrantes
CREATE TABLE IF NOT EXISTS Perro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    edad INT,
    Foto VARCHAR(255) NOT NULL
    
);

CREATE TABLE IF NOT EXISTS Concurso (
    id_concurso INT AUTO_INCREMENT PRIMARY KEY,
    id_Perro INT,
	puntos INT,
    FOREIGN KEY (id_Perro) REFERENCES Perro (id)
);

-- DATOS EJEMPLO
-- Insertar Perros
INSERT INTO Perro (nombre, raza, edad, Foto)
VALUES
    ('Beto', 'Golden Retriver', 3, '/ruta/foto1.jpg'),
    ('Canela', 'Chihuahua', 5, '/ruta/foto2.jpg'),
    ('Firulais', 'Sabueso', 4,  '/ruta/foto3.jpg'),
    ('Lia', 'Terrier', 1, '/ruta/foto4.jpg'),
    ('Raquel', 'Beagle', 2, '/ruta/foto5.jpg'),
    ('Cherry', 'Border Collie', 5, '/ruta/foto6.jpg'),
    ('Coco', 'Pastor ovejero ', 5, '/ruta/foto7.jpg'),
    ('Leonel', 'Pastor Alemán', 7, '/ruta/foto8.jpg'),
    ('Giro', 'Pitbull', 1, '/ruta/foto9.jpg'),
    ('Brandon', 'Bóxer', 3, '/ruta/foto10.jpg'),
    ('Lola', 'Cho chow', 4, '/ruta/foto11.jpg'),
    ('Merlin', 'Doberman', 5, '/ruta/foto12.jpg');

-- Insertar Concurso
INSERT INTO Concurso (id_Perro, puntos)
VALUES
    (1, 2856),
    (2, 3654),
    (3, 6854),
    (4, 3655),
    (5, 5455),
    (6, 2544),
    (7, 5753),
    (8, 2542),
    (9, 2555),
    (10, 3664),
    (11, 5425),
    (12, 7585);

SELECT * FROM concurso

DELIMITER //

-- Eliminar el procedimiento almacenado existente
-- DROP PROCEDURE IF EXISTS BandAppMenu;

-- Crear el nuevo procedimiento almacenado
CREATE PROCEDURE ConcursoMenu()
BEGIN
    DECLARE choice INT;
	SET choice =1;
    ConcursoMenuLoop: LOOP
        -- Mostrar opciones del menú
        SELECT '1. Mostrar la lista de los perro registrados' AS MenuOption;
        SELECT '2. Mostrar la información de un perro' AS MenuOption;
        SELECT '3. Registrar un perro' AS MenuOption;
        SELECT '4. Localizar un perro por su nombre' AS MenuOption;
        SELECT '5. Buscar el perro ganador de la exposición' AS MenuOption;
        SELECT '6. Buscar el perro con el menor puntaje' AS MenuOption;
        SELECT '7. Buscar al perro más viejo' AS MenuOption;
        SELECT '0. Salir' AS MenuOption;

        -- Pedir al usuario que elija una opción
        -- SELECT 'Ingrese el número de la opción deseada:' INTO choice;
        -- SET choice = IFNULL(choice, -1);
		
        -- Ejecutar la opción seleccionada
        CASE choice
            WHEN 1 THEN
                SELECT * FROM Perro; 
            WHEN 2 THEN
                SELECT * FROM Perro where id = 1; 
            WHEN 3 THEN
               INSERT INTO Perro (nombre, raza, edad, Foto) VALUES
               ('zeus', 'Labrador', 4, '/ruta/foto0.jpg');
            WHEN 4 THEN
               SELECT * FROM Perro WHERE Nombre = 'Firulais';
            WHEN 5 THEN
                SELECT * FROM Perro p JOIN Concurso c ON p.id = c.id_Perro ORDER BY c.puntos DESC LIMIT 1;
            WHEN 6 THEN
               SELECT * FROM Perro p JOIN Concurso c ON p.id = c.id_Perro ORDER BY c.puntos ASC LIMIT 1;
			WHEN 7 THEN
				SELECT * FROM Perro ORDER BY edad DESC LIMIT 1;
            WHEN 0 THEN
				LEAVE ConcursoMenuLoop;
            ELSE
				SELECT 'Opción no válida. Inténtelo de nuevo.';
        END CASE;
    END LOOP ConcursoMenuLoop;
END //

DELIMITER ;

-- Llamar al procedimiento para iniciar el menú
use concursoperros;
CALL ConcursoMenu;

--Suave el que lo lea
