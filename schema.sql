CREATE DATABASE photoshare;
USE photoshare;

CREATE TABLE Users (
    user_id int  AUTO_INCREMENT,
    email varchar(255) UNIQUE,
    password varchar(255),
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE Pictures
(
  picture_id int  AUTO_INCREMENT,
  user_id int,
  imgdata longblob ,
  caption VARCHAR(255),
  INDEX upid_idx (user_id),
  CONSTRAINT pictures_pk PRIMARY KEY (picture_id)
);

CREATE TABLE Owns_Albums
(
  user_id INT,
  album_id INT,
  FOREIGN KEY(user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY(album_id) REFERENCES Albums(albumid) ON DELETE CASCADE);

)
INSERT INTO Users (email, password) VALUES ('test@bu.edu', 'test');
INSERT INTO Users (email, password) VALUES ('test1@bu.edu', 'test');
