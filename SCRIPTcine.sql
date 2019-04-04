ALTER SESSION SET nls_date_format='yyyy/mm/dd';


CREATE TABLE horarios(
  horario VARCHAR2(10) PRIMARY KEY,
  precio NUMBER(8,2) ,
  estado NUMBER(11) DEFAULT '1'
);

INSERT INTO horarios (horario, precio, estado) VALUES('14:00:00', 20.00, 1);
INSERT INTO horarios (horario, precio, estado) VALUES('16:00:00', 45.00, 1);
INSERT INTO horarios (horario, precio, estado) VALUES('18:00:00', 33.00, 1);
INSERT INTO horarios (horario, precio, estado) VALUES('20:00:00', 40.00, 1);
INSERT INTO horarios (horario, precio, estado) VALUES('21:00:00', 60.00, 1);
INSERT INTO horarios (horario, precio, estado) VALUES('22:00:00', 45.00, 1);

CREATE TABLE peliculas (
  idpelicula NUMBER(11) PRIMARY KEY ,
  titulo VARCHAR2(50) ,
  descripcion VARCHAR2(1000) ,
  genero VARCHAR2(50) ,
  imagen VARCHAR2(500) ,
  idvideo NUMBER(11) ,
  estado NUMBER(11) DEFAULT '1'
);
INSERT INTO peliculas (idpelicula, titulo, descripcion, genero, imagen, idvideo, estado) VALUES(1, 'A Yash Chopra Romance', ' An ex-army man, leading a double life in London, must choose between his wife and muse. ', 'Drama', 'http://cf2.imgobject.com/t/p/w92//aCp1aziuLcNUqsLBCEhWvhuvO2g.jpg', 132316, 1);
INSERT INTO peliculas (idpelicula, titulo, descripcion, genero, imagen, idvideo, estado) VALUES(2, 'Blackbird', ' An alienated teenager s posturing online threat ignites a firestorm of fear in a small community, in this disturbing and perceptive look at how our media-fuelled, post-Columbine culture of fear can transform typical teen angst into intimations of murder. (TIFF) ', 'Drama', 'http://cf2.imgobject.com/t/p/w92//yCMxlZp8gq77rvXTWC6Qm2XTXKb.jpg', 127862, 1);
INSERT INTO peliculas (idpelicula, titulo, descripcion, genero, imagen, idvideo, estado) VALUES(3, 'King Kelly', 'Kelly strips �?? her best friend Jordan captures the event on her mobile phone. Kelly�??s name is well known among the visitors of (in)appropriate online portals. The two teenagers digitally record anything and everything that crosses their paths and upload the results to the internet. But, today is not their day: Kelly�??s ex-boyfriend has taken her car containing a package she was not to lose under any circumstances. While searching for it, the two set off on a peculiar journey through a night peppered with drugs, sex, corrupt police officers and other catastrophes �?? and always with their trusty mobiles in hand.  Made entirely using mobile phone cameras, KING KELLY is a satirical journey through the boundless narcissism of the YouTube generation.', 'Comedy', 'http://cf2.imgobject.com/t/p/w92//tZ4rkXHdJqp8pVcZ1y6apkoPR9m.jpg', 130677, 1);
INSERT INTO peliculas (idpelicula, titulo, descripcion, genero, imagen, idvideo, estado) VALUES(4, 'Citadel', 'Citadel tells the story of widower and single father Tommy Cowley, a man inflicted with chronic agoraphobia since the day his wife was attacked. He was unable to protect her. He lives in Edenstown, the council estate from hell. Here he finds himself terrorized by a gang of syringe wielding feral children, who are intent on taking his baby daughter. With the help of a kind Nurse and a renegade Priest, Tommy learns the nightmarish truth surrounding these hooded children. He also learns that to be free of his fears, he must finally face the demons of his past and enter the one place he fears the most - The abandoned Tower block known as the Citadel', 'Horror', 'http://cf2.imgobject.com/t/p/w92//dkobtXalalzcK6AA1n1pFwbLPBl.jpg', 52001, 1);

CREATE TABLE salas (
  idsala NUMBER(11) PRIMARY KEY,
  nombre VARCHAR2(50)  ,
  filas NUMBER(11) ,
  butacasporfila NUMBER(11) ,
  estado NUMBER(11) DEFAULT '1' 
);

INSERT INTO salas (idsala, nombre, filas, butacasporfila, estado) VALUES(1, '3', 2, 2, 0);
INSERT INTO salas (idsala, nombre, filas, butacasporfila, estado) VALUES(2, 'd', 33, 3, 0);
INSERT INTO salas (idsala, nombre, filas, butacasporfila, estado) VALUES(3, 'Sala 1', 2, 2, 1);
INSERT INTO salas (idsala, nombre, filas, butacasporfila, estado) VALUES(4, 'Sala 2', 4, 4, 1);
INSERT INTO salas (idsala, nombre, filas, butacasporfila, estado) VALUES(5, 'Sala 3', 5, 5, 1);
INSERT INTO salas (idsala, nombre, filas, butacasporfila, estado) VALUES(6, 'Sala 4', 6, 6, 1);

CREATE TABLE funciones (
  idfuncion NUMBER(11)PRIMARY KEY,
  idsala NUMBER(11) NOT NULL,
  idpelicula NUMBER(11) NOT NULL,
  horario VARCHAR2(10) NOT NULL,
  fecha DATE NOT NULL,
  estado NUMBER(11) DEFAULT '1',
  CONSTRAINT fun_sal_fk FOREIGN KEY (idsala) REFERENCES SALAS,
  CONSTRAINT fun_pel_fk FOREIGN KEY (idpelicula) REFERENCES PELICULAS,
  CONSTRAINT fun_hor_fk FOREIGN KEY (horario) REFERENCES HORARIOS
) ;
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(1, 5, 4, '16:00:00', '2012-11-14', 0);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(2, 6, 3, '16:00:00', '2012-11-15', 0);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(3, 3, 4, '16:00:00', '2012-11-09', 1);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(4, 4, 4, '16:00:00', '2012-11-08', 1);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(5, 5, 3, '16:00:00', '2012-11-20', 1);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(6, 5, 2, '16:00:00', '2012-11-13', 1);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(7, 5, 3, '21:00:00', '2012-11-10', 1);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(8, 6, 2, '21:00:00', '2012-11-13', 1);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(9, 5, 1, '14:00:00', '2012-11-12', 1);
INSERT INTO funciones (idfuncion, idsala, idpelicula, horario, fecha, estado) VALUES(10, 6, 1, '14:00:00', '2012-11-12', 1);

CREATE TABLE butacas (
  idbutaca NUMBER(11) NOT NULL,
  idfuncion NUMBER(11) NOT NULL,
  fila NUMBER(11) ,
  columna NUMBER(11) ,
  estado NUMBER(11) DEFAULT '1',
  PRIMARY KEY (idbutaca,idfuncion),
  CONSTRAINT but_fun_fk FOREIGN KEY (idfuncion) REFERENCES FUNCIONES
) ;

INSERT INTO butacas  VALUES(1, 8, 1, 4, 0);
INSERT INTO butacas  VALUES(2, 7, 1, 3, 0);

CREATE TABLE usuarios (
  idusuario NUMBER(11) PRIMARY KEY ,
  usuario VARCHAR2(50) ,
  PASSWORD VARCHAR2(50) ,
  nombre VARCHAR2(50)  ,
  apellido VARCHAR2(50) ,
  dni NUMBER(11) ,
  fechaalta DATE ,
  tipousuario VARCHAR2(20) ,
  estado NUMBER(11) DEFAULT '1'
  ) ;

INSERT INTO usuarios (idusuario, usuario, PASSWORD, nombre, apellido, dni, fechaalta, tipousuario, estado) VALUES(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrador', 'Administrador', 11111111, '2027-10-12', 'Administrador', 1);
INSERT INTO usuarios (idusuario, usuario, PASSWORD, nombre, apellido, dni, fechaalta, tipousuario, estado) VALUES(2, 'd', '8277e0910d750195b448797616e091ad', 'd', 'd', 23, NULL, 'Espectador', 0);
INSERT INTO usuarios (idusuario, usuario, PASSWORD, nombre, apellido, dni, fechaalta, tipousuario, estado) VALUES(3, 'walter', '202cb962ac59075b964b07152d234b70', 'walter', 'zalazar', 30451236, NULL, 'Espectador', 1);
INSERT INTO usuarios (idusuario, usuario, PASSWORD, nombre, apellido, dni, fechaalta, tipousuario, estado) VALUES(4, '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3', '3', 3, NULL, 'Espectador', 0);

CREATE TABLE reservas (
  idreserva NUMBER(11) PRIMARY KEY,
  horario VARCHAR2(10) NOT NULL,
  idfuncion NUMBER(11) NOT NULL,
  idsala NUMBER(11) NOT NULL,
  idpelicula NUMBER(11) NOT NULL,
  idusuario NUMBER(11) NOT NULL,
  nombre VARCHAR2(50) ,
  fechareserva DATE NOT NULL ,
  fecha DATE NOT NULL,
  precio NUMBER(11) ,
  estado NUMBER(11) DEFAULT '1',
  CONSTRAINT res_usu_fk FOREIGN KEY (idusuario) REFERENCES USUARIOS,
  CONSTRAINT res_sal_fk FOREIGN KEY (idsala) REFERENCES SALAS,
  CONSTRAINT res_fun_fk FOREIGN KEY (idfuncion) REFERENCES FUNCIONES,
  CONSTRAINT res_pel_fk FOREIGN KEY (idpelicula) REFERENCES PELICULAS,
  CONSTRAINT res_hor_fk FOREIGN KEY (horario) REFERENCES HORARIOS
);


INSERT INTO reservas (idreserva, horario, idfuncion, idsala, idpelicula, idusuario, nombre, fechareserva, fecha, precio, estado) VALUES(18, '21:00:00', 8, 6, 2, 3, 's', '2012-11-06', '2012-11-13', 60, 1);
INSERT INTO reservas (idreserva, horario, idfuncion, idsala, idpelicula, idusuario, nombre, fechareserva, fecha, precio, estado) VALUES(19, '21:00:00', 7, 5, 3, 3, 'reserva 1', '2012-11-06', '2012-11-10', 60, 1);



COMMIT;