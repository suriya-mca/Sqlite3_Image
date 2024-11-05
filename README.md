# SQLite3 Docker Image
![GitHub License](https://img.shields.io/github/license/suriya-mca/Sqlite3_Image?style=flat&color=green)  ![GitHub Release](https://img.shields.io/github/v/release/suriya-mca/Sqlite3_Image?include_prereleases&style=flat)  ![GitHub commit activity](https://img.shields.io/github/commit-activity/t/suriya-mca/Sqlite3_Image?style=flat&color=orange)  ![GitHub Repo stars](https://img.shields.io/github/stars/suriya-mca/Sqlite3_Image?style=flat&color=yellow)  ![GitHub forks](https://img.shields.io/github/forks/suriya-mca/Sqlite3_Image?style=flat&color=pink) ![Docker Pulls](https://img.shields.io/docker/pulls/suriya08/sqlite3?color=yellowred)

This Docker image provides a minimal setup for running an SQLite3 database server. It includes the SQLite source code and allows you to interact with the SQLite instance using various tools and applications.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [How to Use](#how-to-use)
  - [Download from GitHub Container Registry](#download-from-github-container-registry)
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

### Download from Docker Hub Container Registry

1. Pull the Docker image from the GitHub Container Registry:

    ```bash
    docker pull suriya08/sqlite3:1.0.3
    ```

2. Run the Docker container:

    ```bash
    docker run -it -p 8191:8191 -v /path/on/host:/app suriya08/sqlite3:1.0.3
    ```

   Replace `/path/on/host` with the path on your host machine where the SQLite database file is located.

### Download from GitHub Container Registry

1. Pull the Docker image from the GitHub Container Registry:

    ```bash
    docker pull ghcr.io/suriya-mca/sqlite3:1.0.3
    ```

2. Run the Docker container:

    ```bash
    docker run -it -p 8191:8191 -v /path/on/host:/app ghcr.io/suriya-mca/sqlite3:1.0.3
    ```

   Replace `/path/on/host` with the path on your host machine where the SQLite database file is located.

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

3. Run the Docker container:

    ```bash
    docker run -it -p 8191:8191 -v /path/on/host:/app my_sqlite_container
    ```

   Replace `/path/on/host` with the path on your host machine where the SQLite database file is located.

### Build from the docker-compose.yml file with "Adminer"

1. Create a docker-compose.yml:

    ```
    version: '3'
        services:
            app:
                image: suriya08/sqlite3:1.0.3
                container_name: my_app
                volumes:
                - ./data:/app/data  # Mount a directory for SQLite databases
                ports:
                - "8191:8191"

        adminer:
            image: adminer
            container_name: adminer
            ports:
            - "8080:8080"
            volumes:
            - ./data:/db  # Mount the same directory as above to access SQLite files

        volumes:
            data:
    ```

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
