CREATE DATABASE KabaddiDB;
USE KabaddiDB;

-- 1. Teams
CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    coach VARCHAR(50)
);

-- 2. Players
CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    position VARCHAR(20),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- 3. Matches
CREATE TABLE Matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    team1_id INT,
    team2_id INT,
    match_date DATE,
    team1_score INT DEFAULT 0,
    team2_score INT DEFAULT 0,
    winner_id INT,
    FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
    FOREIGN KEY (winner_id) REFERENCES Teams(team_id)
);

-- 4. Player Performance
CREATE TABLE Performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    player_id INT,
    match_id INT,
    raid_points INT DEFAULT 0,
    tackle_points INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);

-- Insert Teams
INSERT INTO Teams (team_name, city, coach) VALUES
('Telugu Titans', 'Hyderabad', 'Srinivas'),
('Bengaluru Bulls', 'Bengaluru', 'Ravi'),
('Tamil Thalaivas', 'Chennai', 'Rajesh');

-- Insert Players
INSERT INTO Players (player_name, position, team_id) VALUES
('Arjun', 'Raider', 1),
('Kiran', 'Defender', 1),
('Rahul', 'Raider', 2),
('Vikas', 'Defender', 2),
('Surya', 'Raider', 3),
('Ajay', 'Defender', 3);

-- Insert Matches
INSERT INTO Matches
(team1_id, team2_id, match_date, team1_score, team2_score, winner_id)
VALUES
(1, 2, '2026-09-10', 38, 32, 1),
(2, 3, '2026-09-12', 35, 30, 2),
(1, 3, '2026-09-15', 40, 36, 1);

-- Insert Performance
INSERT INTO Performance
(player_id, match_id, raid_points, tackle_points)
VALUES
(1, 1, 15, 0),
(2, 1, 0, 5),
(3, 1, 12, 0),
(4, 1, 0, 4);

-- Display Teams
SELECT * FROM Teams;

-- Display Players with Teams
SELECT p.player_name, p.position, t.team_name
FROM Players p
JOIN Teams t ON p.team_id = t.team_id;

-- Display Match Results
SELECT
    t1.team_name AS Team1,
    t2.team_name AS Team2,
    m.team1_score,
    m.team2_score
FROM Matches m
JOIN Teams t1 ON m.team1_id = t1.team_id
JOIN Teams t2 ON m.team2_id = t2.team_id;

-- Display Player Performance
SELECT
    p.player_name,
    pr.raid_points,
    pr.tackle_points
FROM Performance pr
JOIN Players p ON pr.player_id = p.player_id;