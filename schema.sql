CREATE TABLE songs (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  duration TIME NOT NULL,
  explicit BOOLEAN NOT NULL,
  link VARCHAR(255) NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT fk_artist_id
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE genres (
  genre_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE artists (
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE user_favorites (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  CONSTRAINT pk_user_favorites
    PRIMARY KEY (user_id, song_id),
  CONSTRAINT fk_user_id
    FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT fk_song_id
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE playlists (
  playlist_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  CONSTRAINT fk_user_id_playlists
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE playlist_songs (
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  rank INT NOT NULL,
  CONSTRAINT pk_playlist_songs
    PRIMARY KEY (playlist_id, song_id),
  CONSTRAINT fk_playlist_id
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
  CONSTRAINT fk_song_id2
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

