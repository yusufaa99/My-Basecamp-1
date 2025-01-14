# Welcome My Basecamp 1 
***

## Task
The goal of this project is to create a web-based platform for managing tasks, projects, and user roles. Users can register, log in, create, and manage projects, while admins have extra privileges to manage user roles and permissions.

## Description
MyBasecamp 1 is the first phase of building a web-based project management tool inspired by Basecamp. In this version, users can:

Register and create accounts
Log in and log out
Create, edit, and delete projects
Admins can manage users and assign roles (admin or regular user)
The system is powered by Ruby on Rails, with a frontend designed for ease of use and excellent user experience (UX).

## Installation
No installation is required. Simply clone the repository and run rails s to start the server.

## Usage
1. To run the server, execute the following command in your terminal:

$> rails s
Then, in your web browser, navigate to localhost:3000.

2. Steps to Create an Admin User
Start the Rails Console
Open a terminal in your Rails project directory and run:

$> rails console

3. Create a New Admin User:
Use the following commands in the Rails console. Replace the placeholders with the desired values for the admin user:

$> User.create!(email: 'admin@example.com', password: 'admin123', password_confirmation: 'admin123', first_name: 'Yahaya', last_name: 'Yusuf', role: 1)

Note: Password most be 6 digits and above.

You can also Login on the browser as Admin with:
Email: admin@gmail.com
Password: admin123

OR 

Sign Up

4. Verify the Admin User
Query the database to ensure the user is created and has the correct role:

$> User.find_by(email: 'admin@gmail.com')

5. Exit the Console
After confirming, exit the console:

$> exit


### The Core Team
Yusuf Yahaya <yusufyahaya065@gmail.com>
Matthew Prince Emmanuel <mattemmsmartprince@gmail.com> 

<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px'></span>
