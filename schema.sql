CREATE TABLE Theatre (
    theatre_id INT PRIMARY KEY,
    theatre_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Screen (
    screen_id INT PRIMARY KEY,
    theatre_id INT,
    screen_name VARCHAR(50),
    total_seats INT,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id)
);

CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    language VARCHAR(50),
    duration INT
);

CREATE TABLE Show (
    show_id INT PRIMARY KEY,
    movie_id INT,
    screen_id INT,
    show_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);

CREATE TABLE Show_Timing (
    timing_id INT PRIMARY KEY,
    show_id INT,
    show_time TIME,
    FOREIGN KEY (show_id) REFERENCES Show(show_id)
);

INSERT INTO Theatre VALUES
(1,'PVR Nexus','Chennai'),
(2,'INOX Marina Mall','Chennai');

INSERT INTO Screen VALUES
(1,1,'Screen 1',200),
(2,1,'Screen 2',150),
(3,2,'Screen 1',180);

INSERT INTO Movie VALUES
(1,'Dasara','Telugu',156),
(2,'Kisi Ka Bhai Kisi Ki Jaan','Hindi',145),
(3,'Tu Jhoothi Main Makkaar','Hindi',150),
(4,'Avatar: The Way of Water','English',190);

INSERT INTO Show VALUES
(1,1,1,'2026-03-25'),
(2,2,1,'2026-03-25'),
(3,3,2,'2026-03-25'),
(4,4,3,'2026-03-25');

INSERT INTO Show_Timing VALUES
(1,1,'12:15:00'),
(2,2,'10:00:00'),
(3,2,'16:10:00'),
(4,2,'20:20:00'),
(5,3,'13:15:00'),
(6,4,'13:20:00');
