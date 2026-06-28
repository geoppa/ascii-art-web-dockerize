# ASCII Art Web Dockerize - Zone01

An interactive web application built in Go that transforms user-inputted text into stylized graphic ASCII art using distinct typography banner layouts. This version is fully containerized using Docker for consistent development, testing, and production deployment.

## 🚀 Features
* **Live Generation:** Convert standard English characters into block-style ASCII visual text.
* **Banner Styles:** Supports three official core assets: `Standard`, `Shadow`, and `Thinkertoy`.
* **Safe Input Filtering:** Robust error handling preventing dangerous system payloads or unsupported characters.
* **Responsive Layout:** Clean UI design displaying persistent output fields and dedicated state handling.
* **Dockerized Environment:** Fully containerized setup ensuring zero dependency issues across different operating systems.

---

## ⚙️ Project Architecture & Design Pattern

The project relies on a clean, scalable architectural split to enforce standard web software paradigms:

```text
ascii-art-web/
├── banners/               # Target layout text fonts (.txt assets)
├── cmd/main.go            # Central operational system startup entry point
├── internal/              # Core proprietary runtime execution packages
│   ├── banner/            # Safe text file system input parsing
│   ├── handlers/          # HTTP request control pipelines & state evaluation
│   ├── render/            # Multi-layer string graphic rendering algorithms
│   ├── server/            # Endpoint initialization & asset distribution routing
│   └── validation/        # Payload structural health constraints
├── static/                # Public assets, browser styles (CSS), & favicons
├── templates/             # Front-end layout configurations (HTML templates)
├── go.mod                 # Go operational workspace manifest dependency configuration
├── Dockerfile             # Multi-stage Docker build configuration
└── docker-compose.yml     # Docker compose orchestration file
```

---

## 🔄 Logical Execution Flow (Order of Operations)

When a browser connects or invokes actions within the server environment, the software stack executes dependencies down a specific functional pipeline:

### 1. Application Initialization (`main.go`)
* **Role:** The main operational execution layer.
* **Process:** Prints starting diagnostics on the host terminal and signals the core server layer to initiate continuous web socket listening.

### 2. Networking and Endpoint Setup (`internal/server/`)
* **Role:** Establishes communication rules and operational endpoints.
* **Process:** Builds exact routing paths, configures security handlers for resource paths, serves external stylesheets from `/static/` directories via a static file server, and monitors TCP networks over port `:8080`.

### 3. Request Orchestration (`internal/handlers/`)
* **Role:** Evaluates user interaction contexts and routes network traffic statuses.
* **Process:**   
  * Rejects unsafe methods (e.g., throwing a `405 Method Not Allowed` header if endpoints receive unsupported request actions).
  * Safely reads form parameters and determines which client responses are required depending on success or internal runtime structural problems.

### 4. Payload Interception (`internal/validation/`)
* **Role:** The defensive security gateway.
* **Process:** Inspects text bodies character-by-character to protect execution memory pipelines from anomalies or malicious paths, ensuring strings stick strictly to printable bounds (ASCII characters 32 to 126). It also sanitizes asset calls against unexpected style properties.

### 5. Storage Access (`internal/banner/`)
* **Role:** File system read pipelines.
* **Process:** Resolves localization variables into path directions, opens the server font text database on runtime demand, and handles translation rules safely separating variations between platforms (e.g., stripping down hidden Windows Carriage Returns `\r`).

### 6. Typographic Render Engine (`internal/render/`)
* **Role:** Algorithmic calculation layer.
* **Process:** Maps system array lines directly to character index formulas (`(char - 32) * 9 + 1`). It dynamically converts layout inputs into clean 8-row structural blocks, handles inner lines, and trims trailing components cleanly to avoid failures during automated audit steps.

### 7. Interface Execution (`templates/`)
* **Role:** Client-side interface rendering.
* **Process:** Merges algorithmic string builds straight into responsive `<pre>` output environments inside the HTML layouts, preserving your data settings and highlighting error boxes instantly whenever standard criteria fail.

---

## 💻 How to Run & Manage (Docker Lifecycle)

### Prerequisites
Make sure you have **Docker** and **Docker Compose** installed on your system. 
*Note: If you encounter a `permission denied` error while running Docker commands, prepend `sudo` to them.*

### 1. Setup & Installation
```bash
git clone <your-repository-url>
cd ascii-art-web-dockerize
```

### 2. Build the Application Image
Build a lightweight production image using the multi-stage Dockerfile setup:
```bash
sudo docker image build -t ascii-art-web-dockerize .
```

### 3. Run the Container
Launch the containerized application in the background (detached mode) mapping port 8080:
```bash
sudo docker container run -p 8080:8080 -d --name ascii-art-container ascii-art-web-dockerize
```

### 4. Check Status & Logs
Verify if the container is running properly and monitor operational application output logs:
```bash
# Check running containers and ports mapping
sudo docker ps

# View container internal logs (useful for troubleshooting)
sudo docker logs ascii-art-container
```

### 5. Access the Application
Open your web browser and navigate to:
```text
http://localhost:8080
```

### 6. Stop and Start the Container
Manage the active environment without needing a complete rebuild:
```bash
# Temporarily pause execution
sudo docker container stop ascii-art-container

# Resume execution
sudo docker container start ascii-art-container
```

### 7. Delete Environment Assets (Clean Up)
Completely remove container files and system images to free storage space or prepare for clean builds (Zone01 Garbage Collection requirement):
```bash
# Remove the container instance (Must stop it first)
sudo docker container rm ascii-art-container

# Remove the application Docker image
sudo docker image rm -f ascii-art-web-dockerize

# Garbage collection: purge dangling build cache and orphan images
sudo docker image prune -f
```

---

## 📦 Orchestration via Docker Compose (Advanced Method)

Docker Compose simplifies multi-step deployment configurations into a single blueprint manifest, eliminating the need to write complex CLI flags manually.

### Understanding `docker-compose.yml`
The orchestrator file relies on standard container properties:
* **`build: .`**: Directs the engine to compile the container binary straight from the local multi-stage `Dockerfile`.
* **`container_name`**: Locks down a persistent network identifier name (`ascii-art-container`).
* **`ports`**: Proxies requests from your local system port `8080` into internal production server spaces.
* **`develop.watch`**: Tracks development workspace files to allow live hot-reloads during modifications.

### Operational CLI Lifecycle Commands
Execute complex build pipelines using simple orchestration tools:

```bash
# Build the images and launch the application architecture
sudo docker compose up --build

# Run in background (detached mode)
sudo docker compose up -d --build

# Shut down and completely purge all active compose container resources
sudo docker compose down
```

---

## 🔄 Live Development Mode (File Watching)

The application includes an advanced development pipeline using Docker Compose Watch. It allows you to modify assets and instantly observe updates without manual rebuild procedures.

### How to Trigger Watch Pipelines
Start the orchestration engine with development triggers active:
```bash
sudo docker compose up --watch
```
*Alternatively, if you started using standard `docker compose up`, look at the bottom interactive terminal hotkey prompts.*

### Terminal Hotkeys (Runtime Navigation Control)
When executing inside the foreground window space, pass immediate operational instructions straight to the orchestration process:
* **`w` (Enable Watch)**: Toggles the background directory scanner layout live. 
  * Modifying frontend elements (`/templates`, `/static`) will **instantly sync** inside the filesystem.
  * Modifying core compilation frameworks (`.go` source streams) triggers an **automated clean container rebuild** event.
* **`d` (Detach)**: Safely breaks connection visibility away from standard logging layouts, throwing the process stack directly into background processing pools while instantly freeing up your current terminal console prompt.

---

## 🛠️ Error Codes Standard Map

This project adheres tightly to standard HTTP protocol metrics during verification checks:
* **`200 OK`**: Layout strings resolved cleanly without errors.
* **`400 Bad Request`**: Submissions included non-ASCII entities, unsupported arguments, or corrupt fields.
* **`404 Not Found`**: Request directed to an unregistered path.
* **`405 Method Not Allowed`**: Request targeted endpoints with unsupported HTTP methods.
* **`500 Internal Server Error`**: Core system dependencies or font system resources are missing or broken.

---

---

## 🧪 Run Test Files

```bash
go test ./... -v
```
---

## 🧹 Post-Evaluation Clean Up (Garbage Collection)

Always clean up your environment after development or auditing cycles.

Run the following commands to free up storage space and remove all unused artifacts:
```bash
# Stop and remove all containers, networks, and volumes created by compose
sudo docker compose down --volumes --rmi all

# Remove any remaining dangling build cache or intermediate image layers
sudo docker image prune -f
sudo docker builder prune -f
```

---

## 👥 Authors

* **elgeorgiou** - *Developer / UI & Render Engineering / Frontend Engineer*
* **gpapadaki** - *Developer / Security Optimization / Backend Engineer*
