1. initialize npm by running this code npm init -y
2. In package.json file. Add this code "start": "nodemon app.js" in scripts section.
3. Install the modules needed for the website npm install express ejs body-parser mysql cookie-parser express-session
4. Install nodemon
    npm install -g nodemon
    npm install --save-dev nodemon 

5. Add dotenv npm install dotenv --save

6. Create a table in your database called users.
        CREATE TABLE `users` (
        `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `username` varchar(100) NOT NULL,
        `password` varchar(100) NOT NULL,
        `fname` varchar(100) NOT NULL,
        `lname` varchar(100) NOT NULL,
        `contactno` int(11) NOT NULL,
        `email` varchar(50) NOT NULL,
        `role` varchar(50) NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

7. Create a table in your database called items.
        CREATE TABLE `items` (
        `id` int(11) NOT NULL,
        `item_name` varchar(20) NOT NULL,
        `item_code` varchar(20) NOT NULL,
        `item_category` varchar(20) NOT NULL,
        `item_quantity` int(11) NOT NULL,
        `item_price` int(20) NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
