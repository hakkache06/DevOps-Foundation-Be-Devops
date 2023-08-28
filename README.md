# DevOps-Foundation-Be-Devops
DevOps Foundation : Be Devops 

"DevOps Foundation: Project" is a learning initiative where you'll explore key DevOps concepts and tools. You'll start by testing applications using Docker locally. Then, you'll dive into testing with Rspec, Capybara, and Selenium. You'll also learn about Infrastructure as Code using Terraform and CI/CD automation with Jenkins. This project equips you with essential skills for modern software development and operations.

## Part 1: Local Testing with Docker

### Installing Docker
Docker is a versatile platform that facilitates running applications and their dependencies within isolated environments known as containers, compatible with almost any operating system. With Docker, the worry of compatibility with different machine setups vanishes. Everything an application requires is encapsulated within the container. This means the application behaves consistently across various systems supporting the Docker framework. Unlike traditional virtual machines, containers are lightweight, start swiftly, and offer convenience in distribution and modification, as they virtualize the operating system kernel rather than the physical hardware.

To install Docker using Homebrew, execute the following command:
```bash
brew cask install docker
```

### Crafting a Dockerfile
The journey of a Docker container image commences with the Dockerfile. Dockerfiles serve as blueprints that define the image a container will utilize upon execution. When initiating the container to run a website, Docker undertakes several tasks: reading, parsing the file, fetching the parent image designated for this specific image. Build the Docker image using the following command:
```bash
docker build --tag website .
```

### Running Docker Compose
Docker Compose offers a lightweight and straightforward platform for orchestrating multiple containerized applications within a unified stack. The tool responsible for interpreting Docker Compose manifests is none other than Docker Compose itself. Launch your applications with Docker Compose using:
```bash
docker-compose up
```

## Conclusion
- The 'FROM scratch' directive instructs Docker to start from a blank image; usually, existing images are used.
- To list all locally available Docker images, employ the command: `docker images`.
- Use the `RUN` command to execute one-off operations during the image construction process.
- When utilizing `docker-compose up`, your ports on Mac get bound, enabling interaction outside the Compose network.
- Leverage the `build:` parameter to compile Dockerfiles stored locally.
- Compose manifests are written in YAML.
- Docker Compose facilitates managing multiple containerized applications within a unified network, streamlining common Docker commands.
- The installation of Docker through `brew cask install docker` includes both the Docker client and the container-managing daemon.
- Docker containers virtualize operating system kernels, ensuring uniform runtime across host systems.
- Docker provides a virtualized operating system kernel for creating reusable application environments. Unlike containers, virtual machines emulate hardware components.

