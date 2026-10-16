# Development of Custom Nmap NSE Scripts for HTTP and SSH Service Discovery

**Author:** Naveen Venkatesh

## Project Overview

This project demonstrates the use of Nmap Scripting Engine (NSE) scripts for service discovery. It includes two custom Lua scripts that display HTTP and SSH service information.

## Scripts Developed

### 1. HTTP Information Scanner — `http-info.nse`

Displays HTTP information such as:
- Target IP address
- Port number and state
- HTTP status code
- Server header
- Content type
- Content length

**Execution command:**

```bash
sudo nmap -p 80 --script http-info example.com
```

### 2. SSH Information Scanner — `ssh-info.nse`

Displays SSH service information such as:
- Target IP address and hostname
- Port number and state
- Service name
- Application layer identification
- SSH port status

**Execution command:**

```bash
sudo nmap -sV -p 22 --script ssh-info 127.0.0.1
```

## Reference Script

The project uses Nmap's existing `http-title.nse` script as the reference example. It retrieves the title of an HTTP webpage.

```bash
sudo nmap -p 80 --script http-title example.com
```

## Screenshots

- `01-nmap-http-title-reference.png` — Reference script output
- `02-custom-http-info-output.png` — Custom HTTP scanner output
- `03-custom-ssh-info-output.png` — Custom SSH scanner output

## Learning Outcomes

- Learned the basics of Nmap NSE scripts and Lua.
- Practiced HTTP and SSH service discovery.
- Created and tested custom NSE scripts.
- Learned how to document and publish a project using GitHub.

## Safety Note

Run these scripts only against systems you own or are authorized to test. These scripts are intended for service discovery and reporting, not comprehensive vulnerability assessment.
