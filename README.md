## Women Safety App

📊 Entity Relationship Diagram (ERD)
The Women Safety App uses a relational database design to manage users, emergency actions, media, and location data efficiently. Below is an overview of the core entities and their relationships.

🧱 Database Tables
🔹 Users
user_id (Primary Key)

name

phone_number

email

emergency_contact

🔹 SOS_Events
sos_id (Primary Key)

user_id (Foreign Key → Users)

timestamp

battery_status

location

🔹 Media_Files
media_id (Primary Key)

sos_id (Foreign Key → SOS_Events)

file_url

file_type (Audio/Video)

recorded_time

🔹 Location_History
location_id (Primary Key)

user_id (Foreign Key → Users)

latitude

longitude

recorded_time

🔹 Emergency_Contacts
contact_id (Primary Key)

user_id (Foreign Key → Users)

name

phone_number

type (Police / Hospital / Safe Shelter / Other)

🔗 Entity Relationships
One User ➝ Many SOS_Events

One SOS_Event ➝ Many Media_Files

One User ➝ Many Location_History

One User ➝ Many Emergency_Contacts
