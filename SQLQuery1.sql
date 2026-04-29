DROP TABLE IF EXISTS visitsLog;
DROP TABLE IF EXISTS passes;
DROP TABLE IF EXISTS classSchedule;
DROP TABLE IF EXISTS sports;
DROP TABLE IF EXISTS trainers;
DROP TABLE IF EXISTS users;
GO

CREATE TABLE users (
    userId INT PRIMARY KEY IDENTITY,
    fullName VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100)
);
GO

CREATE TABLE trainers (
    trainerId INT PRIMARY KEY IDENTITY,
    fullName VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);
GO

CREATE TABLE sports (
    sportId INT PRIMARY KEY IDENTITY,
    sportName VARCHAR(50) NOT NULL,
    price INT NOT NULL
);
GO

CREATE TABLE classSchedule (
    slotId INT PRIMARY KEY IDENTITY,
    sportId INT NOT NULL,
    trainerId INT NOT NULL,
    dayName VARCHAR(20) NOT NULL,
    startTime VARCHAR(10) NOT NULL,
    FOREIGN KEY (sportId) REFERENCES sports(sportId),
    FOREIGN KEY (trainerId) REFERENCES trainers(trainerId)
);
GO

CREATE TABLE passes (
    passId INT PRIMARY KEY IDENTITY,
    userId INT NOT NULL,
    passType VARCHAR(20) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId)
);
GO

CREATE TABLE visitsLog (
    visitId INT PRIMARY KEY IDENTITY,
    userId INT NOT NULL,
    sportId INT NOT NULL,
    visitDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (sportId) REFERENCES sports(sportId)
);
GO

INSERT INTO users (fullName, phone, email) VALUES
('Ivan Ivanov', '+79161234567', 'ivanov@mail.ru'),
('Maria Petrova', '+79162345678', 'petrova@mail.ru'),
('Sidor Sidorov', '+79163456789', 'sidorov@mail.ru'),
('Anna Kuznetsova', '+79164567890', 'kuznetsova@mail.ru'),
('Alexey Smirnov', '+79165678901', 'smirnov@mail.ru'),
('Olga Volkova', '+79166789012', 'volkova@mail.ru');
GO

INSERT INTO trainers (fullName, phone) VALUES
('Alexey Smirnov', '+79167890123'),
('Dmitry Kozlov', '+79168901234'),
('Sergey Volkov', '+79169012345'),
('Michael Sokolov', '+79160123456'),
('Ivan Petrov', '+79161234567');
GO

INSERT INTO sports (sportName, price) VALUES
('Swimming', 500),
('Yoga', 600),
('Boxing', 800),
('Dancing', 700),
('Pilates', 400),
('Gymnastics', 550),
('CrossFit', 750);
GO

INSERT INTO classSchedule (sportId, trainerId, dayName, startTime) VALUES
(1, 1, 'Monday', '09:00'),
(1, 1, 'Wednesday', '09:00'),
(1, 1, 'Friday', '09:00'),
(2, 2, 'Tuesday', '18:00'),
(2, 2, 'Thursday', '18:00'),
(3, 3, 'Monday', '19:00'),
(3, 3, 'Wednesday', '19:00'),
(4, 1, 'Tuesday', '17:00'),
(4, 1, 'Thursday', '17:00'),
(5, 4, 'Tuesday', '18:00'),
(6, 2, 'Tuesday', '10:00'),
(7, 5, 'Tuesday', '11:00');
GO

INSERT INTO passes (userId, passType, startDate, endDate) VALUES
(1, 'unlimited', '2024-03-01', '2024-03-31'),
(2, '8_visits', '2024-03-05', '2024-04-05'),
(3, 'single', '2024-03-10', '2024-03-11'),
(4, 'unlimited', '2024-03-15', '2024-04-14'),
(5, '8_visits', '2024-03-20', '2024-04-20'),
(6, 'single', '2024-03-25', '2024-03-26'),
(1, '8_visits', '2024-04-01', '2024-05-01'),
(2, 'unlimited', '2024-04-01', '2024-04-30');
GO

INSERT INTO visitsLog (userId, sportId, visitDate) VALUES
(1, 1, '2024-03-05'),
(1, 1, '2024-03-07'),
(1, 4, '2024-03-12'),
(2, 2, '2024-03-06'),
(2, 2, '2024-03-13'),
(2, 5, '2024-03-15'),
(3, 3, '2024-03-10'),
(4, 1, '2024-03-18'),
(4, 6, '2024-03-20'),
(5, 5, '2024-03-22'),
(5, 1, '2024-03-25'),
(6, 7, '2024-03-26'),
(1, 1, '2024-04-02'),
(2, 2, '2024-04-03'),
(4, 4, '2024-04-05'),
(5, 3, '2024-04-08');
GO