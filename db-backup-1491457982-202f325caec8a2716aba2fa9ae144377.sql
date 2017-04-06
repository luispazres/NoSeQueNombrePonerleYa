DROP TABLE tblalertas;

CREATE TABLE `tblalertas` (
  `AlertaCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `AlertaFecha` datetime NOT NULL,
  PRIMARY KEY (`AlertaCodigo`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

INSERT INTO tblalertas VALUES("25","2017-04-05 00:00:00");
INSERT INTO tblalertas VALUES("24","2017-04-03 00:00:00");
INSERT INTO tblalertas VALUES("23","2017-04-02 00:00:00");
INSERT INTO tblalertas VALUES("22","2017-03-26 00:00:00");
INSERT INTO tblalertas VALUES("21","2017-03-24 00:00:00");
INSERT INTO tblalertas VALUES("26","2017-04-06 00:00:00");



DROP TABLE tblcontratos;

CREATE TABLE `tblcontratos` (
  `ContratoCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `ContratoFechaInicio` date DEFAULT NULL,
  `ContratoFechaFinal` date DEFAULT NULL,
  `VigenciaCodigo` int(11) DEFAULT NULL,
  `EmpresaCodigo` int(11) DEFAULT NULL,
  `ServicioCodigo` int(11) DEFAULT NULL,
  `ContratoValor` double DEFAULT NULL,
  `MonedaCodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContratoCodigo`),
  KEY `EmpresaCodigo` (`EmpresaCodigo`),
  KEY `tblcontratos_ibfk_2` (`ServicioCodigo`),
  KEY `VigenciaCodigo_idx` (`VigenciaCodigo`),
  KEY `MonedaCodigo_idx` (`MonedaCodigo`),
  CONSTRAINT `MonedaCodigo` FOREIGN KEY (`MonedaCodigo`) REFERENCES `tblmoneda` (`MonedaCodigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VigenciaCodigo` FOREIGN KEY (`VigenciaCodigo`) REFERENCES `tblvigencia` (`VigenciaCodigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblcontratos_ibfk_1` FOREIGN KEY (`EmpresaCodigo`) REFERENCES `tblempresa` (`EmpresaCodigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblcontratos_ibfk_2` FOREIGN KEY (`ServicioCodigo`) REFERENCES `tblservicios` (`ServicioCodigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

INSERT INTO tblcontratos VALUES("83","2017-04-25","2017-07-25","1","4","1","222","1");
INSERT INTO tblcontratos VALUES("84","2017-04-30","2017-07-30","1","5","2","88888","1");



DROP TABLE tbldocumento;

CREATE TABLE `tbldocumento` (
  `DocumentoCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `ContratoCodigo` int(11) DEFAULT NULL,
  `DocumentoTamanio` int(20) unsigned DEFAULT NULL,
  `DocumentoNombreArchivo` varchar(255) DEFAULT NULL,
  `DocumentoTipo` varchar(150) DEFAULT NULL,
  `DocumentoDireccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DocumentoCodigo`),
  KEY `ContratoCodigo` (`ContratoCodigo`),
  CONSTRAINT `tbldocumento_ibfk_1` FOREIGN KEY (`ContratoCodigo`) REFERENCES `tblcontratos` (`ContratoCodigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

INSERT INTO tbldocumento VALUES("49","83","405635","residencia-en-la-tierra--0 (1).pdf","application/pdf","files/residencia-en-la-tierra--0 (1).pdf");
INSERT INTO tbldocumento VALUES("50","84","405635","residencia-en-la-tierra--0 (1).pdf","application/pdf","files/residencia-en-la-tierra--0 (1).pdf");



DROP TABLE tblempresa;

CREATE TABLE `tblempresa` (
  `EmpresaCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `EmpresaNombre` varchar(200) DEFAULT NULL,
  `EmpresaRepresentante` varchar(200) DEFAULT NULL,
  `EmpresaComercial` varchar(200) DEFAULT NULL,
  `EmpresaNmContratos` int(11) DEFAULT NULL,
  `EmpresaRTN` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`EmpresaCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tblempresa VALUES("1","Luis es el puto amo","Luis Paz","Puto Amo S.A","","1995");
INSERT INTO tblempresa VALUES("4","ghjhjhjh","Cristian","Responsabilidad","","9652365");
INSERT INTO tblempresa VALUES("5","Lovable","Martha","Limitada","","985632");
INSERT INTO tblempresa VALUES("6","Sisocs","Daniel","Limitada","","56471");



DROP TABLE tblmoneda;

CREATE TABLE `tblmoneda` (
  `MonedaCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `MonedaNombre` varchar(300) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`MonedaCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tblmoneda VALUES("1","Lempira");
INSERT INTO tblmoneda VALUES("2","Dolar");



DROP TABLE tblroles;

CREATE TABLE `tblroles` (
  `rolCodigo` int(11) NOT NULL,
  `rolNombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rolCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tblroles VALUES("1","Administrador");
INSERT INTO tblroles VALUES("2","Recepcion");



DROP TABLE tblservicios;

CREATE TABLE `tblservicios` (
  `ServicioCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `ServicioNombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ServicioCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tblservicios VALUES("1","Hospedaje");
INSERT INTO tblservicios VALUES("2","Dominio");
INSERT INTO tblservicios VALUES("3","Redes Sociales");
INSERT INTO tblservicios VALUES("4","Sitio web");



DROP TABLE tblusuarios;

CREATE TABLE `tblusuarios` (
  `usuarioCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioNombre` varchar(100) DEFAULT NULL,
  `usuarioApellido` varchar(100) DEFAULT NULL,
  `usuarioCorreo` varchar(100) DEFAULT NULL,
  `usuarioContrasenia` varchar(100) DEFAULT NULL,
  `rolCodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuarioCodigo`),
  UNIQUE KEY `usuarioCorreo` (`usuarioCorreo`),
  KEY `rolCodigo` (`rolCodigo`),
  CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`rolCodigo`) REFERENCES `tblroles` (`rolCodigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tblusuarios VALUES("1","Michelle","Galeano","michi.navarro@gmail.com","Dios1994","1");
INSERT INTO tblusuarios VALUES("3","Cristian","Arriaga","cristian@hotmail.com","827ccb0eea8a706c4c34a16891f84e7b","1");
INSERT INTO tblusuarios VALUES("4","Luis","Putisimo amo","reyes@yahoo.com","e10adc3949ba59abbe56e057f20f883e","1");
INSERT INTO tblusuarios VALUES("5","Eduardo","Reyes","luis@hotmail.com","83de3208109f3a6e98bb4828695a3aa5","2");



DROP TABLE tblvigencia;

CREATE TABLE `tblvigencia` (
  `VigenciaCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `VigenciaMeses` int(11) NOT NULL,
  PRIMARY KEY (`VigenciaCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tblvigencia VALUES("1","3");
INSERT INTO tblvigencia VALUES("2","6");
INSERT INTO tblvigencia VALUES("3","9");
INSERT INTO tblvigencia VALUES("4","12");
INSERT INTO tblvigencia VALUES("5","18");
INSERT INTO tblvigencia VALUES("6","24");



