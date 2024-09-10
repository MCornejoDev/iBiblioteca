# MyApp - Ionic, PHP Slim & Docker

## Table of Contents
- [MyApp - Ionic, PHP Slim \& Docker](#myapp---ionic-php-slim--docker)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Technologies](#technologies)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
    - [1. Clone the repository](#1-clone-the-repository)
    - [2. Frontend (Ionic)](#2-frontend-ionic)
    - [3.Backend (PHP Slim)](#3backend-php-slim)
    - [4. Configure environment files](#4-configure-environment-files)
    - [5. Build Docker Containers](#5-build-docker-containers)
    - [6. Running the Application](#6-running-the-application)

## Introduction

**MyApp** is a cross-platform application built using the **Ionic Framework (Angular)** for the frontend and **PHP Slim** for the backend. This app is containerized with **Docker** and uses **Nginx** as a reverse proxy to serve backend services.

## Technologies

- **Ionic Framework** (Angular-based frontend)
- **PHP Slim** (Backend REST API)
- **Nginx** (Web server and reverse proxy)
- **Docker** (Containerization)
- **Docker Compose** (Multi-container management)
- **MySQL/PostgreSQL** (Optional: for database management)

## Prerequisites

Before setting up the application, ensure you have the following installed:

- **Docker** (https://www.docker.com/get-started)
- **Docker Compose** (https://docs.docker.com/compose/install/)
- **Node.js** (https://nodejs.org/) and **npm** (for Ionic)
- **Ionic CLI** (https://ionicframework.com/getting-started)

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/MyApp.git
cd MyApp
```

### 2. Frontend (Ionic)

Navigate to the frontend folder and install the dependencies:

```bash
cd frontend
npm install
```

### 3.Backend (PHP Slim)

Navigate to the backend folder and install the dependencies:

```bash
cd backend
composer install
```

### 4. Configure environment files

Make sure to configure the environment variables as needed:

```bash
Frontend: Edit frontend/src/environments/environment.ts
Backend: Edit backend/.env
```

### 5. Build Docker Containers

We will use Docker Compose to build and run both the frontend and backend containers, along with Nginx as the reverse proxy.

```bash
docker-compose up --build
```

Backend: Accessible at http://localhost:8080

### 6. Running the Application 

After the containers are up, you may run the application with the following command:

```bash
cd frontend
ionic serve
```

This will start the Ionic app in development mode and should be accessible at http://localhost:8100.