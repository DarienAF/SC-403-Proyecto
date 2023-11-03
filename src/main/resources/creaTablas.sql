/* Se crea la base de datos */
DROP SCHEMA IF EXISTS store;
DROP USER IF EXISTS un_usuario;
CREATE SCHEMA store;

/* Se crea un usuario para la base de datos llamado "un_usuario" y tiene la contraseña "Clave_Usuario." */
CREATE USER 'un_usuario'@'%' IDENTIFIED BY 'Clave_Usuario';

/* Se asignan los privilegios sobre la base de datos store al usuario creado */
GRANT ALL PRIVILEGES ON store.* TO 'un_usuario'@'%';
FLUSH PRIVILEGES;

/* La tabla de tipo contiene categorías de productos */
CREATE TABLE store.tipo (
  id_tipo INT NOT NULL AUTO_INCREMENT,
  marca VARCHAR(30) NOT NULL,
  activo BOOLEAN,
  PRIMARY KEY (id_tipo)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE store.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_t INT NOT NULL,
  articulo VARCHAR(30) NOT NULL,
  descripcion VARCHAR(1600) NOT NULL,
  precio DOUBLE,
  fecha VARCHAR(10),
  ruta_imagen VARCHAR(1024),
  activo BOOLEAN,
  PRIMARY KEY (id_producto),
  FOREIGN KEY (id_t) REFERENCES store.tipo (id_tipo)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;

/* Se crea la tabla de clientes llamada cliente */
CREATE TABLE store.cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  activo BOOLEAN,
  PRIMARY KEY (`id_cliente`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE store.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  fecha DATE,
  total DOUBLE,
  estado INT,
  PRIMARY KEY (id_factura),
  FOREIGN KEY fk_factura_cliente (id_cliente) REFERENCES store.cliente (id_cliente)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE store.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio DOUBLE,
  cantidad INT,
  PRIMARY KEY (id_venta),
  FOREIGN KEY fk_venta_factura (id_factura) REFERENCES store.factura (id_factura),
  FOREIGN KEY fk_venta_producto (id_producto) REFERENCES store.producto (id_producto)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;

/* Se insertan 3 registros en la tabla cliente como ejemplo */
INSERT INTO store.cliente (id_cliente, username, password, nombre, apellidos, correo, telefono, activo) VALUES 
(1, 'juan', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Juan', 'Castro Vargas', 'jcastro@gmail.com', '4556-8978', true),
(2, 'carlos', '$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi', 'Carlos', 'Contreras Mora', 'ccontreras@gmail.com', '5456-8789', true),
(3, 'sofia', '$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO', 'Sofia', 'Mena Loria', 'smena@gmail.com', '7898-8936', true);

INSERT INTO store.tipo (id_tipo, marca, activo) VALUES 
(1,'Sony PlayStation', true),
(2,'Microsoft Xbox', true),
(3,'Nintendo', true),
(4,'Otros', false);

INSERT INTO store.producto (id_t, articulo, descripcion, precio, fecha, ruta_imagen, activo) VALUES
(3, 'Zelda Tears of the Kingdom', 'Videojuego para la nintendo switch', 40000, '12/05/2023', 'https://fs-prod-cdn.nintendo-europe.com/media/images/08_content_images/systems_5/nintendo_switch_3/nintendo_switch_oled/CI_NSwitch_package_white.png', true),
(3, 'Nintendo Switch', 'Consola de videojuegos de nintendo', 180000, '03/03/2017', 'https://innovacellcr.com/cdn/shop/files/controles-nintendo-switch-joy-con-i-d-innovacell-1.png?v=1691018095', true),
(3, 'Joy-Con', 'Controles para nintendo switch', 55000, '10/05/2018', 'https://media.game.es/COVERV2/3D_L/218/218985.png', true),
(3, 'Mario Bros Wonder', 'Videojuego para la nintendo switch', 35000, '20/10/2023', 'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_108052939/fee_786_587_png', true),
(1, 'PlayStation 5', 'Consola de videojuegos de Sony', 280000, '12/11/2020', 'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_108052939/fee_786_587_png', true),
(1, 'SpiderMan 2', 'Videojuego para la PlayStation5', 45000, '20/10/2023', 'https://static.xtralife.com/conversions/XJC6-2QN1275144-medium_w640_h480_q75-ps5consolamandodualsense-1602579903.png', true),
(1, 'ResidentEvil 4', 'Videojuego para la PlayStation5', 35000, '05/05/2023', 'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_109414770/fee_786_587_png', true),
(1, 'PULSE 3D', 'Periferico de audio para la PlayStation5', 75000, '12/11/2020', 'https://www.ideahogar.com.ar/10523-large_default/auriculares-ps5-pulse-3d-sony.jpg', true),
(4, 'Teclado LoL Logitech', 'Periferico de computador', 55000, '10/12/2022', 'https://resource.logitech.com/content/dam/gaming/en/products/lol-pro-x-keyboard/gallery/league-of-legends-pro-x-gaming-keyboard-gallery-1.png', true),
(4, 'Steamdeck', 'PC portatil pro Valve', 350000, '25/02/2022', 'https://www.amd.com/content/dam/amd/en/images/products/2002975-steam-deck-games-displayed.png', true),
(2, 'Xbox Series S', 'Consola de videojuegos de Microsoft', 180000, '10/11/2020', 'https://assets.xboxservices.com/assets/67/a8/67a83e47-6127-466a-8c31-2f4cb0ad9068.png?n=0294958693_BuyBox_Boxshot_829x799.png', true);


/* Crear la tabla de roles */
CREATE TABLE store.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20),
  id_cliente INT,
  PRIMARY KEY (id_rol),
  FOREIGN KEY fk_rol_cliente (id_cliente) REFERENCES store.cliente (id_cliente)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;

/* Insertar datos en la tabla de roles */
INSERT INTO store.rol (id_rol, nombre, id_cliente) VALUES
  (1, 'ROLE_ADMIN', 1),
  (2, 'ROLE_VENDEDOR', 1),
  (3, 'ROLE_USER', 1),
  (4, 'ROLE_VENDEDOR', 2),
  (5, 'ROLE_USER', 2),
  (6, 'ROLE_USER', 3);