CREATE DATABASE photoshare;
USE photoshare;

CREATE TABLE Users (
    user_id int  AUTO_INCREMENT,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    username VARCHAR(20),
    email varchar(255) UNIQUE,
    password varchar(255),
    DOB DATE,
    contributions INT DEFAULT 0,
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE Albums
(
  albumID INT AUTO_INCREMENT, albumOwner INT, name VARCHAR(30), datecreated DATE,
  PRIMARY KEY(albumID,albumOwner),
  FOREIGN KEY(albumOwner) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Photos
(
  photoid INT AUTO_INCREMENT,
  user_id INT,
  album_id INT,
  imgdata LONGBLOB ,
  caption VARCHAR(255),
  photopath VARCHAR(200),
  INDEX upid_idx (user_id),
  CONSTRAINT pictures_pk PRIMARY KEY (photoid),
  FOREIGN KEY(user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY(album_id) REFERENCES Albums(albumID) ON DELETE CASCADE
);

CREATE TABLE Owns_Albums
(
  user_id INT,
  album_id INT,
  FOREIGN KEY(user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY(album_id) REFERENCES Albums(albumID) ON DELETE CASCADE
);


CREATE TABLE Belongs_To
(
  photoID INT, albumID INT NOT NULL,
  PRIMARY KEY(photoID),
  FOREIGN KEY(photoID) REFERENCES Photos(photoid) ON DELETE CASCADE,
  FOREIGN KEY(albumID) REFERENCES Albums(albumID) ON DELETE CASCADE
);


CREATE TABLE Comments
(
  commentID INT AUTO_INCREMENT,
  text TEXT NOT NULL,
  userID INT,
  date DATE,
  PRIMARY KEY(commentID),
  FOREIGN KEY (userID) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Has_Comment
(
  commentID INT, photoid INT, commenterID INT, date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(commentID, photoid, commenterID,date),
  FOREIGN KEY(commentID) REFERENCES Comments(commentID) ON DELETE CASCADE,
  FOREIGN KEY(commenterID) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY(photoid) REFERENCES Photos(photoid) ON DELETE CASCADE
);

CREATE TABLE Tags
(
  tag TINYTEXT NOT NULL,
  tagID INT AUTO_INCREMENT,
  PRIMARY KEY (tagID)
);

CREATE TABLE Has_Tag
(
  tagID INT, photoid INT,
  PRIMARY KEY(tagID, photoid),
  FOREIGN KEY(photoid) REFERENCES Photos(photoid) ON DELETE CASCADE,
  FOREIGN KEY(tagID) REFERENCES Tags(tagID) ON DELETE CASCADE
);

CREATE TABLE Friends
(
  userID1 INT NOT NULL AUTO_INCREMENT,
  userID2 INT NOT NULL,
  CONSTRAINT friends_pk PRIMARY KEY (userID1, userID2),
  FOREIGN KEY (userID1) REFERENCES USERS(user_id) ON DELETE CASCADE,
  FOREIGN KEY (userID2) REFERENCES USERS (user_id)ON DELETE CASCADE
);


CREATE TABLE Likes
(
  userID INT, photoID INT,
  PRIMARY KEY(userID, photoID),
  FOREIGN KEY(userID) REFERENCES Users(user_ID) ON DELETE CASCADE,
  FOREIGN KEY(photoID) REFERENCES Photos(photoID) ON DELETE CASCADE
);

INSERT INTO Users(user_id, firstname, email, username) VALUES(1,'anonymous','anonymous', 'anonymous');

