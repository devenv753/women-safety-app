-- women_safety_app.sql
-- SQL Script to create and populate a MySQL database for a Women Safety App

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS women_safety_app;
USE women_safety_app;

-- Step 2: Drop Tables If They Exist
DROP TABLE IF EXISTS Media_Files;
DROP TABLE IF EXISTS SOS_Events;
DROP TABLE IF EXISTS Location_History;
DROP TABLE IF EXISTS Emergency_Contacts;
DROP TABLE IF EXISTS Users;

-- Step 3: Create Tables

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- SOS_Events Table
CREATE TABLE SOS_Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    timestamp DATETIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL
    -- Foreign keys omitted for simplicity
);

-- Media_Files Table
CREATE TABLE Media_Files (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    media_type VARCHAR(50) NOT NULL,
    file_path VARCHAR(255) NOT NULL
);

-- Location_History Table
CREATE TABLE Location_History (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    latitude DECIMAL(10,7) NOT NULL,
    longitude DECIMAL(10,7) NOT NULL,
    timestamp DATETIME NOT NULL
);

-- Emergency_Contacts Table
CREATE TABLE Emergency_Contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- Step 4: Insert Sample Data

-- Users
INSERT INTO Users (name, email, phone, password) VALUES 
('Fatima Rahman', 'fatima.rahman@example.com', '01710000001', 'passFatima2025'),
('Sadia Islam', 'sadia.islam@example.com', '01710000002', 'sadiaSafe!'),
('Nusrat Jahan', 'nusrat.jahan@example.com', '01710000003', 'nusrat123'),
('Rina Akter', 'rina.akter@example.com', '01710000004', 'rinaSecure');

-- SOS_Events
INSERT INTO SOS_Events (user_id, timestamp, location, status) VALUES
(1, NOW(), 'Mirpur, Dhaka', 'Active'),
(2, NOW() - INTERVAL 1 HOUR, 'Uttara, Dhaka', 'Resolved'),
(1, NOW() - INTERVAL 2 DAY, 'Banani, Dhaka', 'Resolved'),
(3, NOW() - INTERVAL 30 MINUTE, 'Gulshan, Dhaka', 'Active');

-- Media_Files
INSERT INTO Media_Files (event_id, media_type, file_path) VALUES
(1, 'image', '/media/fatima_sos1_img1.jpg'),
(1, 'video', '/media/fatima_sos1_vid1.mp4'),
(2, 'image', '/media/sadia_sos2_img1.jpg'),
(4, 'audio', '/media/nusrat_sos4_audio1.mp3');

-- Location_History
INSERT INTO Location_History (user_id, latitude, longitude, timestamp) VALUES
(1, 23.8103, 90.4125, NOW() - INTERVAL 10 MINUTE),
(1, 23.8110, 90.4150, NOW() - INTERVAL 5 MINUTE),
(2, 23.8672, 90.4000, NOW() - INTERVAL 20 MINUTE),
(3, 23.7806, 90.4194, NOW() - INTERVAL 15 MINUTE),
(4, 23.7465, 90.3760, NOW() - INTERVAL 2 HOUR);

-- Emergency_Contacts
INSERT INTO Emergency_Contacts (user_id, name, phone) VALUES
(1, 'Ayesha Rahman', '01911112222'),
(1, 'Sajid Rahman', '01933334444'),
(2, 'Mahfuz Islam', '01888887777'),
(3, 'Sultana Begum', '01777776666'),
(4, 'Kamrul Hasan', '01655553333');
