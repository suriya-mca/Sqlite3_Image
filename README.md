# SQLite3 Docker Image

This Docker image provides a minimal setup for running an SQLite3 database server. It includes the SQLite source code and allows you to interact with the SQLite instance using various tools and applications.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [How to Use](#how-to-use)
  - [Build the Docker Image](#build-the-docker-image)
  - [Run the Docker Container](#run-the-docker-container)
  - [Interact with SQLite](#interact-with-sqlite)
    - [Python](#python)
    - [Go](#go)
    - [Java](#java)
    - [TypeScript](#typescript)
- [Additional Notes](#additional-notes)
- [Contributing](#contributing)
- [License](#license)

## Features

- Lightweight Docker image based on Alpine Linux.
- Easily customizable for specific use cases.
- Enables interaction with SQLite databases.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed on your machine.

## How to Use

### Build the Docker Image

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/your-repo.git
    cd your-repo
    ```

2. Build the Docker image:

    ```bash
    docker build -t my_sqlite_image .
    ```

   Replace `my_sqlite_image` with the desired name for your Docker image.

### Run the Docker Container

3. Run the Docker container:

    ```bash
    docker run -it -p 8191:8191 -v /path/on/host:/app my_sqlite_container
    ```

   Replace `/path/on/host` with the path on your host machine where the SQLite database file is located.

### Interact with SQLite

#### Python

4. Connect to the SQLite database from your local environment using Python:

    ```python
    import sqlite3

    # Connect to the SQLite database file on your local machine
    conn = sqlite3.connect('/path/on/host/your_database.db')

    # Create a cursor object to execute SQL queries
    cursor = conn.cursor()

    # Execute a sample query
    cursor.execute('SELECT * FROM your_table;')
    results = cursor.fetchall()

    # Print the results
    for row in results:
        print(row)

    # Close the connection
    conn.close()
    ```

   Replace `/path/on/host/your_database.db` with the actual path to your SQLite database file on your local machine and update the query as needed.

#### Go

4. Connect to the SQLite database from your local environment using Go:

    ```go
    package main

    import (
        "database/sql"
        "fmt"
        _ "github.com/mattn/go-sqlite3"
    )

    func main() {
        // Connect to the SQLite database file on your local machine
        db, err := sql.Open("sqlite3", "/path/on/host/your_database.db")
        if err != nil {
            fmt.Println("Error connecting to the database:", err)
            return
        }
        defer db.Close()

        // Execute a sample query
        rows, err := db.Query("SELECT * FROM your_table")
        if err != nil {
            fmt.Println("Error executing query:", err)
            return
        }
        defer rows.Close()

        // Print the results
        for rows.Next() {
            var col1, col2 string
            if err := rows.Scan(&col1, &col2); err != nil {
                fmt.Println("Error scanning row:", err)
                return
            }
            fmt.Println(col1, col2)
        }
    }
    ```

   Replace `/path/on/host/your_database.db` and `your_table` with the actual path to your SQLite database file and the table name, respectively.

#### Java

4. Connect to the SQLite database from your local environment using Java:

    ```java
    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;

    public class SQLiteJavaExample {
        public static void main(String[] args) {
            String url = "jdbc:sqlite:/path/on/host/your_database.db";

            try (Connection connection = DriverManager.getConnection(url);
                 PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM your_table");
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                // Print the results
                while (resultSet.next()) {
                    String col1 = resultSet.getString("col1");
                    String col2 = resultSet.getString("col2");
                    System.out.println(col1 + " " + col2);
                }

            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
            }
        }
    }
    ```

   Replace `/path/on/host/your_database.db` and `your_table` with the actual path to your SQLite database file and the table name, respectively.

#### TypeScript

4. Connect to the SQLite database from your local environment using TypeScript:

    First, install the `sqlite3` package:

    ```bash
    npm install sqlite3
    ```

    Then, create a TypeScript file (e.g., `sqlite.ts`):

    ```typescript
    import sqlite3 from 'sqlite3';

    // Connect to the SQLite database file on your local machine
    const db = new sqlite3.Database('/path/on/host/your_database.db');

    // Execute a sample query
    db.each('SELECT * FROM your_table', (err, row) => {
      if (err) {
        console.error('Error executing query:', err);
        return;
      }
      console.log(row.col1, row.col2);
    });

    // Close the database connection
    db.close();
    ```

   Replace `/path/on/host/your_database.db` and `your_table` with the actual path to your SQLite database file and the table name, respectively.

## Additional Notes

- Customize the Dockerfile based on your specific requirements and application needs.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
