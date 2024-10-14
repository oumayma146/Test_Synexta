
# Contact and Client Management System

This project is a Symfony-based Contact and Client Management System developed to efficiently handle relationships and interactions between contacts and clients. The application supports a variety of features aimed at simplifying data management and enhancing productivity for businesses that manage multiple clients and contacts.

## Features

### 1. **Contact and Client Management**
   - Create, view, update, and delete contacts and clients with essential details such as name, email, phone number, and more.
   - Each contact can be associated with multiple clients, and each client can have multiple contacts, enabling versatile relationship management.

### 2. **Email Association and Synchronization**
   - Manage emails for each contact and synchronize them with associated clients.
   - Automatically update client emails based on changes made to associated contacts, ensuring data consistency.
   - Support for multiple email addresses, which are managed as comma-separated lists for easy organization.

### 3. **User-Friendly Interface**
   - Built with Twig templates and Bootstrap to provide a responsive, intuitive, and visually appealing user interface.
   - Features like dropdown selections, form validation, and error messages enhance the user experience.

### 4. **Validation and Error Handling**
   - Unique validation for email addresses, ensuring that each contact has a distinct email.
   - Error messages are displayed for invalid inputs and duplicate entries, helping users correct issues promptly.

### 5. **Data Integrity with Doctrine ORM**
   - Utilizes Doctrine ORM to manage database relationships and ensure data integrity.
   - Automatically handles many-to-many relationships between contacts and clients, maintaining consistent associations and preventing data loss.

## Technology Stack

- **Backend**: Symfony Framework, PHP 8
- **Database**: MySQL with Doctrine ORM for database management
- **Frontend**: Twig templates, Bootstrap for styling
- **Version Control**: Git & GitHub

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/project-name.git
   ```

2. Navigate into the project directory:
   ```bash
   cd project-name
   ```

3. Install dependencies using Composer:
   ```bash
   composer install
   ```

4. Configure your database settings in `.env` file.

5. Run migrations to set up the database:
   ```bash
   php bin/console doctrine:migrations:migrate
   ```

6. Start the Symfony server:
   ```bash
   symfony server:start
   ```

7. Access the application at `http://localhost:8000`.

## Usage

- Navigate to the **Contacts** and **Clients** sections to add or manage records.
- Use the **Edit** and **Delete** functionalities to keep data updated.
- Keep track of associated emails and ensure they remain synchronized across contacts and clients.

---
