# SQLite3 Docker Image

This Docker image provides a minimal setup for running an SQLite3 database server. It includes the SQLite source code and allows you to interact with the SQLite instance using various tools and applications.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [How to Use](#how-to-use)
  - [Build the Docker Image](#build-the-docker-image)
  - [Run the Docker Container](#run-the-docker-container)
  - [Interact with SQLite](#interact-with-sqlite)
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

## Additional Notes

- Customize the Dockerfile based on your specific requirements and application needs.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
