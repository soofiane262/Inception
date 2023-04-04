# Inception - System Administration with Docker

## Table of Contents

-   [Introduction](#introduction)
-   [Infrastructure Setup](#infrastructure-setup)
-   [Getting Started](#getting-started)
-   [Usage](#usage)
    -   [Running the Containers](#running-the-containers)
    -   [Viewing the Containers](#viewing-the-containers)
    -   [Stopping the Containers](#stopping-the-containers)
    -   [Removing the Volumes](#removing-the-volumes)
    -   [Restarting the Containers](#restarting-the-containers)
-   [Resources](#resources)
-   [Authors](#authors)
-   [Contributing](#contributing)
-   [License](#license)

### _Introduction_

Hello everyone! I'm excited to share with you the project I completed to enhance my system administration skills using Docker. I created a small infrastructure composed of various services that follow specific rules, and worked in a virtual machine using docker-compose to complete the project.

With Docker, I could run each service in a dedicated container, making it easier to manage and isolate them. I used Dockerfiles to build the containers, with each Docker image having the same name as its corresponding service. My Makefile called these Dockerfiles in the docker-compose.yml file, making it easy to build the Docker images.

Docker provides a lightweight alternative to traditional virtual machines, making it highly portable and easy to move between environments. Docker also takes care of managing the underlying infrastructure, so I didn't have to worry about it.

To ensure security, I made sure there were no passwords in my Dockerfiles and used environment variables to configure the services. I stored these environment variables in a .env file for better organization.

Overall, this project was an excellent opportunity to learn about Docker's benefits and gain hands-on experience in creating a small infrastructure.

### _Infrastructure Setup_

In this section, I will describe the various Docker containers that I have set up for my infrastructure. These containers include NGINX with TLSv1.3, WordPress with php-fpm, MariaDB, Adminer, an FTP server connected to the WordPress volume, a static website container, and three containers for visualizing all of the containers status in Grafana. To connect these containers, I have established a docker-network.

The NGINX container is configured to support only TLSv1.3, which ensures secure communication between clients and the server.

The WordPress container includes php-fpm, which is installed and configured. It does not include NGINX, as I have set up a separate container (the previous one) for this purpose.

The MariaDB container provides a database management system for the WordPress website.

To store the WordPress database, I have set up a volume that is mounted to the MariaDB container.

I have also set up a second volume that contains the WordPress website files.

In addition to these containers, I have set up an Adminer container, which provides a web-based interface for managing the MariaDB database.

To connect the FTP server to the WordPress volume, I have bind-mounted the volume to the FTP container.

I have also set up a static website container, which serves as an example of how to run a containerized website that does not require a dynamic content management system like WordPress.

To monitor the performance of the infrastructure, I have set up three containers for visualizing the data in Grafana. These containers receive data from InfluxDB, which is responsible for storing the performance metrics of the infrastructure. To gather this data, I have set up another container called Telegraf, which gets the container usage data from the docker.sock file.

Finally, to connect all of these containers, I have established a docker-network, which allows them to communicate with each other securely and efficiently.

### _Getting Started_

To get started with this project, follow these steps:

1.  Clone the repository to your local machine:

```bash
git clone https://github.com/soofiane262/Inception.git
```

2. Navigate to the project directory:

```bash
cd Inception
```

3. Create the necessary volumes for the project, build the Docker images and start the Docker containers:

```bash
make
```

5. To stop the containers, run the following command:

```bash
make down
```

### _Usage_

#### _Running the Containers_

To run the Docker containers, use the following command:

```bash
make
```

This command will create and start all the containers defined in the srcs/docker-compose.yml file.

#### _Viewing the Containers_

To view the containers, run the following command:

```bash
make ps
```

This command will display the status of all the containers defined in the srcs/docker-compose.yml file.

#### _Stopping the Containers_

To stop the containers, run the following command:

```bash
make down
```

This command will stop all the containers defined in the srcs/docker-compose.yml file.

#### _Removing the Volumes_

```bash
make fclean
```

This command will stop and remove all the containers defined in the srcs/docker-compose.yml file, and remove the volumes created by the project.

#### _Restarting the Containers_

To restart the containers, run the following command:

```bash
make re
```

This command will remove the volumes, rebuild the containers, and start the containers again.

### _Resources_

-   [Docker documentation](https://docs.docker.com/)
-   [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
-   [Dockerfile best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
-   [Nginx documentation](https://nginx.org/en/docs/)
-   [OpenSSL documentation](https://www.openssl.org/docs/)
-   [Bash documentation](https://www.gnu.org/software/bash/manual/html_node/index.html)
-   [WordPress CLI Documentation](https://wp-cli.org/)
-   [MariaDB documentation](https://mariadb.com/kb/en/documentation/)
-   [Adminer documentation](https://www.adminer.org/en/)
-   [Telegraf documentation](https://docs.influxdata.com/telegraf/v1.18/)
-   [InfluxDB documentation](https://docs.influxdata.com/influxdb/v1.8/)
-   [Grafana documentation](https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/)

## #_Authors_

The `Inception` project was created by [Soufiane El Marsi](https://www.github.com/soofiane262) as part of the common core's curriculum for the [1337 Coding School](https://www.1337.ma/en/)'s System Administration and Networking branches, a coding school located in Morocco, Africa, that is a member of the renowned [42 Network](https://www.42network.org/) of coding schools. The school is also powered by the [Mohammed VI Polytechnic University (UM6P)](https://um6p.ma/), which provides world-class resources and expertise to its students.

As a member of the [42 Network](https://www.42network.org/), [1337 Coding School](https://www.1337.ma/en/) follows the same innovative and immersive educational model, which is based on project-based learning and peer-to-peer collaboration. This means that students are free to learn at their own pace, and are encouraged to work on real-world projects that challenge and inspire them.

The school's partnership with [UM6P](https://um6p.ma/) ensures that students have access to the latest technologies and tools, as well as world-class faculty members and experts in the field of computer science. This allows students to gain a comprehensive understanding of coding and computer science, while also developing the practical skills needed to succeed in the tech industry.

Overall, [1337 Coding School](https://www.1337.ma/en/) is a unique and innovative institution that provides an exceptional education in coding and computer science, while also preparing students for success in the rapidly-evolving tech industry.

## _Contributing_

Contributions to this project are welcome. To contribute, please follow these steps:

1. Fork the project repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your forked repository.
5. Create a pull request to the original repository.

### _License_

This project is licensed under the MIT License - see the [LICENSE](https://github.com/soofiane262/Inception/blob/master/LICENSE.md) file for details.
