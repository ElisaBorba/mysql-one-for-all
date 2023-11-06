DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;
CREATE TABLE planos
(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano_name VARCHAR(512) NOT NULL,
    valor_plano DECIMAL(3, 2) NOT NULL
) engine = InnoDB;

INSERT INTO planos (plano_id, plano_name, valor_plano) VALUES
('1', 'gratuito', '0.00'),
('2', 'familiar', '7.99'),
('3', 'universitário', '5.99'),
('4', 'pessoal', '6.99');

CREATE TABLE pessoas_usuarias
(
    pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(512) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;

INSERT INTO pessoas_usuarias (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES
('1', 'Barbara Liskov', '82', '1', '2019-10-20'),
('2', 'Robert Cecil Martin', '58', '1', '2017-01-06'),
('3', 'Ada Lovelace', '37', '2', '2017-12-30'),
('4', 'Martin Fowler', '46', '2', '2017-01-17'),
('5', 'Sandi Metz', '58', '2', '2018-04-29'),
('6', 'Paulo Freire', '19', '3', '2018-02-14'),
('7', 'Bell Hooks', '26', '3', '2018-01-05'),
('8', 'Christopher Alexander', '85', '4', '2019-06-05'),
('9', 'Judith Butler', '45', '4', '2020-05-13'),
('10', 'Jorge Amado', '58', '4', '2017-02-17');

CREATE TABLE artistas 
(
    artista_id	INT PRIMARY KEY AUTO_INCREMENT,
    artista_name	VARCHAR(512) NOT NULL
);

INSERT INTO artistas (artista_id, artista_name) VALUES
	('1', 'Beyoncé'),
	('2', 'Queen'),
	('3', 'Elis Regina'),
	('4', 'Baco Exu do Blues'),
	('5', 'Blind Guardian'),
	('6', 'Nina Simone');

CREATE TABLE seguindo_artistas 
(
    artista_id	INT,
    pessoa_usuaria_id	INT,
    PRIMARY KEY (artista_id, pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias (pessoa_usuaria_id)
);

INSERT INTO seguindo_artistas (pessoa_usuaria_id, artista_id) VALUES
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('2', '1'),
    ('2', '3'),
    ('3', '2'),
    ('4', '4'),
    ('5', '5'),
    ('5', '6'),
    ('6', '6'),
    ('6', '1'),
    ('7', '6'),
    ('9', '3'),
    ('10', '2');

CREATE TABLE albuns 
(
    album_id	INT PRIMARY KEY AUTO_INCREMENT,
    album_name	VARCHAR(512) NOT NULL,
    artista_id	INT NOT NULL,
    ano_lancamento	YEAR NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

INSERT INTO albuns (album_id, album_name, artista_id, ano_lancamento) VALUES
	('1', 'Renaissance', '1', '2022'),
	('2', 'Jazz', '2', '1978'),
	('3', 'Hot Space', '2', '1982'),
	('4', 'Falso Brilhante', '3', '1998'),
	('5', 'Vento de Maio', '3', '2001'),
	('6', 'QVVJFA?', '4', '2003'),
	('7', 'Somewhere Far Beyond', '5', '2007'),
	('8', 'I Put A Spell On You', '6', '2012');

CREATE TABLE cancoes 
(
    cancao_id	INT PRIMARY KEY AUTO_INCREMENT,
    cancao_name	VARCHAR(512) NOT NULL,
    duracao_segundos	INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) engine = InnoDB;

INSERT INTO cancoes (cancao_id, cancao_name, duracao_segundos, album_id) VALUES
	('1', '"BREAK MY SOUL";', '279', '1'),
	('2', '"Don\'t Stop Me Now"', '203', '2'),
	('3', '"Under Pressure"', '152', '3'),
	('4', '"Como Nossos Pais"', '105', '4'),
	('5', '"O Medo de Amar é o Medo de Ser Livre"', '207', '5'),
	('6', '"Samba em Paris"', '267', '6'),
	('7', '"The Bard\'s Song"', '244', '7'),
	('8', '"Feeling Good"', '100', '8'),
	('9', '"VIRGO\'S GROOVE"', '369', '1'),
	('10', '"ALIEN SUPERSTAR"', '116', '1');

CREATE TABLE historico_de_reproducoes 
(
    cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    PRIMARY KEY (cancao_id, pessoa_usuaria_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias (pessoa_usuaria_id)
) engine = InnoDB;

INSERT INTO historico_de_reproducoes (cancao_id, data_reproducao, pessoa_usuaria_id) VALUES
	('6', '2022-02-28 10:45:55', '1'),
	('8', '2022-08-05 08:05:17', '2'),
	('8', '2020-11-13 16:55:13', '3'),
	('6', '2021-08-15 17:10:10', '4'),
	('6', '2022-01-09 01:44:33', '5'),
	('5', '2017-01-24 00:31:17', '6'),
	('2', '2011-12-15 22:30:49', '7'),
	('2', '2012-03-17 14:56:41', '8'),
	('7', '2022-02-24 21:14:22', '9'),
	('10', '2015-12-13 08:30:22', '10'),
	('9', '2020-05-02 05:30:35', '1'),
	('8', '2020-03-06 11:22:33', '1'),
	('5', '2020-01-02 07:40:33', '2'),
	('9', '2020-12-05 18:38:30', '3'),
	('3', '2020-08-06 15:23:43', '5'),
	('1', '2017-10-12 12:35:20', '6');