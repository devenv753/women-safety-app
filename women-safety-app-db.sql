-- Drop existing tables if any
DROP TABLE IF EXISTS Media_Files, SOS_Events, Location_History, Emergency_Contacts, Users;

-- ------------------------
-- Table: Users
-- ------------------------
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    password VARCHAR(100)
);

-- ------------------------
-- Table: SOS_Events
-- ------------------------
CREATE TABLE SOS_Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    timestamp DATETIME,
    location VARCHAR(255),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ------------------------
-- Table: Media_Files
-- ------------------------
CREATE TABLE Media_Files (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    media_type VARCHAR(50),
    file_path VARCHAR(255),
    FOREIGN KEY (event_id) REFERENCES SOS_Events(event_id)
);

-- ------------------------
-- Table: Location_History
-- ------------------------
CREATE TABLE Location_History (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7),
    timestamp DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ------------------------
-- Table: Emergency_Contacts
-- ------------------------
CREATE TABLE Emergency_Contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    phone VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ========================
-- Insert Sample Data
-- ========================

-- Users
INSERT INTO Users (name, email, phone, password) VALUES 
('John Doe', 'john@example.com', '1234567890', 'password123'),
('Jane Smith', 'jane@example.com', '9876543210', 'securepass');

-- SOS_Events
INSERT INTO SOS_Events (user_id, timestamp, location, status) VALUES
(1, NOW(), '123 Main St, City A', 'Active'),
(2, NOW(), '456 Park Ave, City B', 'Resolved');

-- Media_Files
INSERT INTO Media_Files (event_id, media_type, file_path) VALUES
(1, 'image', '/media/sos1_img1.jpg'),
(1, 'video', '/media/sos1_vid1.mp4'),
(2, 'image', '/media/sos2_img1.jpg');

-- Location_History
INSERT INTO Location_History (user_id, latitude, longitude, timestamp) VALUES
(1, 37.7749, -122.4194, NOW()),
(1, 37.7750, -122.4195, NOW()),
(2, 40.7128, -74.0060, NOW());

-- Emergency_Contacts
INSERT INTO Emergency_Contacts (user_id, name, phone) VALUES
(1, 'Alice Doe', '1112223333'),
(1, 'Bob Doe', '4445556666'),
(2, 'Charlie Smith', '7778889999');
