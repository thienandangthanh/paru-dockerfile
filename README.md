# Arch Linux with Paru Docker Image

## Overview

This Docker image is based on the official Arch Linux image.
It installs [Paru](https://github.com/Morganamilo/paru), an AUR (Arch User Repository) helper written in Rust.

This image serves two primary purposes:
1. **Testing Paru**: You can use this Docker container to test Paru's functionality.
2. **Base Image for Installing Other AUR Packages**: The presence of Paru allows you to easily extend this image by installing other AUR packages as needed.

## Prerequisites

- Docker installed on your machine.
- Basic understanding of using Docker commands and Dockerfiles.

## Building the Docker Image

To build the Docker image, clone this repository and run the following command in the directory containing the `Dockerfile`:

```bash
docker build -t archlinux-paru .
```

This command builds the Docker image with the tag `archlinux-paru`.

## Running the Docker Container

You can run the container interactively to use Paru or as a base for further customization. Here’s an example of how to start an interactive session:

```bash
docker run -it --rm archlinux-paru bash
```

### Explanation:
- `-it`: Allocates a pseudo-TTY and keeps STDIN open, allowing you to interact with the container.
- `--rm`: Automatically removes the container when it exits.

## Using Paru

Once inside the container, you can use Paru to install AUR packages. For example:

```bash
paru -S <package-name>
```

Replace `<package-name>` with the name of the package you wish to install from the AUR.

## Extending the Docker Image

You can create your own `Dockerfile` that builds on top of this image to install additional packages or perform other setup tasks. Here’s an example:

```dockerfile
FROM archlinux-paru

# Install additional AUR packages
RUN paru -S --noconfirm <package-name1> <package-name2>

# Additional setup commands...
```

Then, build and run your extended image as described above.

## License

This Dockerfile is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

