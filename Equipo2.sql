CREATE TABLE Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(255) NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    registrationDate DATETIME NOT NULL
);

CREATE TABLE publications (
    postID INT AUTO_INCREMENT PRIMARY KEY,
    contentPost VARCHAR(255) NOT NULL,
    dateAndTime DATETIME NOT NULL,
    creatorUser INT NOT NULL,
    numLikes INT,
    numComments INT, 
    FOREIGN KEY (creatorUser) REFERENCES Users(userID),
    FOREIGN KEY (commentsPost) REFERENCES Comments(commentID)
);

ALTER TABLE Publications ADD commentsPost VARCHAR(255);
ALTER TABLE Publications DROP COLUMN commentsPost;



CREATE TABLE comments (
    commentID INT AUTO_INCREMENT PRIMARY KEY,
    contentComment VARCHAR(255) NOT NULL,
    dateComment DATETIME NOT NULL,
    userCreatorComment INT NOT NULL,
    postCommentID INT NOT NULL,
    FOREIGN KEY (userCreatorComment) REFERENCES Users(userID),
    FOREIGN KEY (postCommentID) REFERENCES publications(postID)
);

CREATE TABLE Likes (
    likeID INT AUTO_INCREMENT PRIMARY KEY,
    userLikeID INT NOT NULL,
    postLikeID INT NOT NULL,
    FOREIGN KEY (userLikeID) REFERENCES Users(userID),
    FOREIGN KEY (postLikeID) REFERENCES Publications(postID)
);

CREATE TABLE Friends (
    friendID INT AUTO_INCREMENT PRIMARY KEY,
    requestingUserID INT NOT NULL,
    receivingUserID INT NOT NULL,
    applicationStatus VARCHAR(20) NOT NULL,
    dateFriends DATETIME NOT NULL,
    FOREIGN KEY (requestingUserID) REFERENCES Users(userID),
    FOREIGN KEY (receivingUserID) REFERENCES Users(userID)
);

CREATE TABLE Messages (
    messagesID INT AUTO_INCREMENT PRIMARY KEY,
    transmitterID INT NOT NULL,
    receiverID INT NOT NULL,
    Content TEXT NOT NULL,
    shippingDate DATETIME NOT NULL,
    readMessage BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (transmitterID) REFERENCES Users(userID),
    FOREIGN KEY (receiverID) REFERENCES Users(userID)
);


INSERT INTO Users (UserName, FullName, Email,registrationDate)
VALUES ('Mariaio123', 'Maria Lopez Contreras', 'mariaLopez@gmail.com', NOW());

INSERT INTO Users (UserName, FullName, Email,registrationDate)
VALUES ('Juan123', 'Juan Pablo Correa', 'jpCorrea@gmail.com', NOW());

INSERT INTO Users (UserName, FullName, Email,registrationDate)
VALUES ('MaryVC', 'Marilsa Velasquez Cuadrado', 'maryvc@gmail.com', NOW());

INSERT INTO Users (UserName, FullName, Email,registrationDate)
VALUES ('AlissonMG', 'Alisson Monsalve Gonzalez', 'alisson@gmail.com', NOW());

INSERT INTO Users (UserName, FullName, Email,registrationDate)
VALUES ('MairaK', 'Maira Katlin', 'mk@gmail.com', NOW());

SELECT * FROM Users;

UPDATE Users SET userName = "Maria123" WHERE userID = 1;

INSERT INTO Friends (requestingUserID, receivingUserID, applicationStatus)
VALUES (1, 2, 'pendiente');

INSERT INTO Friends (requestingUserID, receivingUserID, applicationStatus)
VALUES (3, 2, 'Aceptada');

INSERT INTO Friends (requestingUserID, receivingUserID, applicationStatus, dateFriends)
VALUES (2, 5, 'Rechazada', NOW());

INSERT INTO Friends (requestingUserID, receivingUserID, applicationStatus, dateFriends)
VALUES (4, 5, 'pendiente', NOW());

INSERT INTO Friends (requestingUserID, receivingUserID, applicationStatus, dateFriends)
VALUES (5, 1, 'Rechazada', NOW());

SELECT * FROM Friends;

UPDATE Friends SET dateFriends = NOW() WHERE friendID = 1;

UPDATE Friends SET dateFriends = NOW() WHERE friendID = 2;

UPDATE Friends SET dateFriends = NOW() WHERE friendID = 3;

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (1, 2, 'Hola, ¿cómo estás?', NOW());

SELECT * FROM Messages;

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (1, 3, '¿Que tal el fin de semana?', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (2, 1, 'Hola! muy bien y tu ?', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (2, 3, 'Hoy no puedo, tendrá que ser la próxima semana, lo siento', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (3, 1, 'muy bien y a ti como te fue ?', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (3, 2, 'esta bien, entiendo', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (4, 1, 'Maria, ya te dije que no', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (4, 5, 'sabes bien que debes hacerlo', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (5, 2, 'llega mañana temprano, por favor', NOW());

INSERT INTO Messages (transmitterID, receiverID, Content, shippingDate)
VALUES (5, 3, 'me parece genial', NOW());

INSERT INTO Publications (contentPost, dateAndTime, creatorUser, numLikes, numComments)
VALUES ( 'Mañana tendré fiesta en casa, todos estan invitados !!!', NOW(), 5, 100, 166);

SELECT * FROM Publications;

INSERT INTO Publications (contentPost, dateAndTime, creatorUser, numLikes, numComments)
VALUES ( 'La alegría es contagiosa. Pásalo…', NOW(), 4, 50, 5);

INSERT INTO Publications (contentPost, dateAndTime, creatorUser, numLikes, numComments)
VALUES ( 'Es elegante ser buena persona', NOW(), 3, 60, 10);

INSERT INTO Publications (contentPost, dateAndTime, creatorUser, numLikes, numComments)
VALUES ( 'Los informaticos cuando mueren no van al cielo, son almacenados en la nube', NOW(), 2, 500, 300);

INSERT INTO Publications (contentPost, dateAndTime, creatorUser, numLikes, numComments)
VALUES ( 'El futuro pertenece a aquellos que creen en la belleza de sus sueños', NOW(), 1, 150, 70);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'por supuesto que iré', NOW(), 1,1);

SELECT * FROM Comments;

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'que se diviertan', NOW(), 2,1);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'que linda frase', NOW(), 5,2);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'que lindo', NOW(), 1,2);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'claro que lo es', NOW(), 1,3);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'estoy de acuerdo', NOW(), 4,3);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'JAJAJAJA', NOW(), 4,4);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'JAJAJAJA de verdad que si!!!!', NOW(), 3,4);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'carita feliz', NOW(), 5,5);

INSERT INTO Comments (contentComment, dateComment, userCreatorComment, postCommentID)
VALUES ( 'que inspirador', NOW(), 2,5);

SELECT * FROM Publications WHERE creatorUser = (SELECT userID FROM Users WHERE userName = 'Maria123');

SELECT * FROM Publications WHERE creatorUser = (SELECT userID FROM Users WHERE userName = 'MaryVC');

SELECT * FROM Publications WHERE creatorUser = (SELECT userID FROM Users WHERE userName = 'AlissonMG');

SELECT * FROM Publications WHERE creatorUser = (SELECT userID FROM Users WHERE userName = 'juan123');

SELECT * FROM Publications WHERE creatorUser = (SELECT userID FROM Users WHERE userName = 'MairaK');

SELECT * FROM Publications WHERE LOWER(ContentPost) LIKE '%informaticos%';

SELECT * FROM Publications WHERE LOWER(ContentPost) LIKE '%buena%';

SELECT * FROM Comments WHERE postCommentID = 4;

SELECT * FROM Comments WHERE postCommentID = 1;

SELECT * FROM Comments WHERE postCommentID = 3;

SELECT * FROM Comments WHERE postCommentID = 5;

SELECT * FROM Comments WHERE postCommentID = 2;

SELECT Users.UserName, Friends.applicationStatus FROM Users INNER JOIN Friends ON (Users.UserID = Friends.requestingUserID OR Users.UserID = Friends.receivingUserID)
WHERE (Friends.requestingUserID = (SELECT UserID FROM Users WHERE UserName = 'Juan123') OR Friends.receivingUserID = (SELECT UserID FROM Users WHERE UserName = 'Juan123'))
AND Friends. applicationStatus = 'Aceptada';

SELECT * FROM Friends;

SELECT COUNT(*) AS CantidadDeAmigos FROM Friends WHERE (requestingUserID = (SELECT UserID FROM Users WHERE UserName = 'AlissonMG')
 OR receivingUserID = (SELECT UserID FROM Users WHERE UserName = 'AlissonMG'))
AND applicationStatus = 'aceptada';

SELECT * FROM Publications WHERE creatorUser = (SELECT UserID FROM Users WHERE UserName = 'AlissonMG');

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Comments ON Users.UserID = Comments.userCreatorComment
WHERE Comments.postCommentID = 2;

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Comments ON Users.UserID = Comments.userCreatorComment
WHERE Comments.postCommentID = 1;

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Comments ON Users.UserID = Comments.userCreatorComment
WHERE Comments.postCommentID = 3;

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Comments ON Users.UserID = Comments.userCreatorComment
WHERE Comments.postCommentID = 4;

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Comments ON Users.UserID = Comments.userCreatorComment
WHERE Comments.postCommentID = 5;

SELECT Users.UserName, Friends.applicationStatus FROM Users
INNER JOIN Friends ON (Users.UserID = Friends.requestingUserID OR Users.UserID = Friends.receivingUserID)
WHERE (Friends. requestingUserID = Users.UserID OR Friends.receivingUserID = Users.UserID)
AND (Friends.applicationStatus = 'pendiente');

SELECT * FROM Publications ORDER BY dateAndTime DESC;

SELECT 'Publicacion' AS Tipo,  dateAndTime AS datetim FROM Publications
WHERE creatorUser = (SELECT UserID FROM Users WHERE UserName = 'Juan123') UNION ALL SELECT 'Comentario' AS Tipo, dateComment AS dateTim
FROM Comments WHERE userCreatorComment = (SELECT UserID FROM Users WHERE UserName = 'Juan123') ORDER BY  datetim DESC;

SELECT Publications.* FROM Publications
INNER JOIN Friends ON (Publications.creatorUser = Friends.requestingUserID OR Publications.creatorUser = Friends. receivingUserID)
WHERE (Friends.requestingUserID = (SELECT UserID FROM Users WHERE UserName = 'Juan123') OR Friends.receivingUserID = (SELECT UserID FROM Users WHERE UserName = 'AlissonMG'))
AND Publications.dateAndTime >= '2023-11-01 00:00:00' AND Publications.dateAndTime <= '2023-11-03 23:59:59';

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Messages ON Users.UserID = Messages.transmitterID
WHERE Messages.receiverID  = (SELECT UserID FROM Users WHERE UserName = 'AlissonMG');

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Messages ON Users.UserID = Messages.transmitterID
WHERE Messages.receiverID  = (SELECT UserID FROM Users WHERE UserName = 'Maria123');

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Messages ON Users.UserID = Messages.transmitterID
WHERE Messages.receiverID  = (SELECT UserID FROM Users WHERE UserName = 'MaryVC');

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Messages ON Users.UserID = Messages.transmitterID
WHERE Messages.receiverID  = (SELECT UserID FROM Users WHERE UserName = 'Juan123');

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Messages ON Users.UserID = Messages.transmitterID
WHERE Messages.receiverID  = (SELECT UserID FROM Users WHERE UserName = 'MairaK');

SELECT transmitterID, receiverID, Content, shippingDate FROM Messages
WHERE (transmitterID = (SELECT UserID FROM Users WHERE UserName = 'Maria123') AND receiverID = (SELECT UserID FROM Users WHERE UserName = 'Juan123'))
OR (transmitterID = (SELECT UserID FROM Users WHERE UserName = 'Juan123') AND receiverID = (SELECT UserID FROM Users WHERE UserName = 'Maria123'))
ORDER BY shippingDate;

SELECT Users.UserName FROM Users LEFT JOIN Friends ON Users.UserID = Friends.requestingUserID 
OR Users.UserID = Friends.receivingUserID WHERE Friends.FriendID IS NULL;

SELECT DISTINCT Users.UserName FROM Users INNER JOIN Publications ON Users.UserID = Publications. creatorUser
INNER JOIN Comments ON Publications.PostID = Comments.postCommentID AND Users.UserID = Comments.userCreatorComment;

SELECT Publications.PostID, Publications.contentPost, COUNT(Comments.CommentID) AS NumeroComentarios FROM Publications
LEFT JOIN Comments ON Publications.PostID = Comments. postCommentID
GROUP BY Publications.PostID, Publications.contentPost
ORDER BY NumeroComentarios DESC
LIMIT 3;

