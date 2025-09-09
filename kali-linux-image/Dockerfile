FROM kalilinux/kali-last-release AS base

# Set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Set a specific Kali mirror and add retries
RUN echo "deb http://mirrors.dotsrc.org/kali kali-last-snapshot main non-free contrib" > /etc/apt/sources.list && \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done

# Feature flags for tool installation
ARG INSTALL_NET_RECON=true
ARG INSTALL_WEB_TESTING=true
ARG INSTALL_BRUTE_FORCE=true
ARG INSTALL_EXPLOITATION=true
ARG INSTALL_POST_EXPLOITATION=true
ARG INSTALL_CRYPTO=true
ARG INSTALL_TRAFFIC_ANALYSIS=true
ARG INSTALL_TUNNELING=true
ARG INSTALL_LDAP_AD=true
ARG INSTALL_DATABASES=true
ARG INSTALL_REVERSING=true
ARG INSTALL_MISC_TOOLS=true
ARG INSTALL_PYTHON=true
ARG INSTALL_BUILD_TOOLS=true
ARG INSTALL_NET_UTILS=true
ARG INSTALL_ARCHIVES=true
ARG INSTALL_DOCKER_CLI=true
ARG INSTALL_GO=true
ARG INSTALL_GO_TOOLS=true

# Create a non-root user
RUN useradd -m -s /bin/bash kali

# Base System Utilities (always installed)
RUN for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    curl wget git vim nano net-tools iproute2 dnsutils bind9-host \
    jq tmux screen netcat-traditional socat nmap nmap-common masscan && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Network Reconnaissance & Scanning Tools
RUN if [ "${INSTALL_NET_RECON}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    amass gobuster ffuf dirb nikto whatweb theharvester dnsx \
    arp-scan arping fping hping3 netdiscover nbtscan onesixtyone \
    sublist3r dnsrecon fierce ncrack && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Web Testing Tools
RUN if [ "${INSTALL_WEB_TESTING}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    sqlmap wfuzz nuclei feroxbuster dirsearch zaproxy && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Brute Force & Password Tools
RUN if [ "${INSTALL_BRUTE_FORCE}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    hydra john john-data crunch medusa patator wordlists \
    hashid hash-identifier hashcat hashcat-data hashcat-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Exploitation Frameworks
RUN if [ "${INSTALL_EXPLOITATION}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    metasploit-framework impacket-scripts evil-winrm \
    bloodhound.py crackmapexec netexec responder && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Post-Exploitation & Persistence Tools
RUN if [ "${INSTALL_POST_EXPLOITATION}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    powershell-empire starkiller unicorn-magic \
    weevely webshells mimikatz windows-binaries && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Cryptography & Steganography Tools
RUN if [ "${INSTALL_CRYPTO}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    steghide stegosuite binwalk foremost bulk-extractor && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Traffic Analysis & Proxies
RUN if [ "${INSTALL_TRAFFIC_ANALYSIS}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    wireshark-common tshark tcpdump tcpreplay mitmproxy \
    proxychains4 proxytunnel stunnel4 sslh sslscan sslsplit && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Tunneling Tools
RUN if [ "${INSTALL_TUNNELING}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    dns2tcp iodine ptunnel pwnat dnscat2 chisel && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# LDAP & Active Directory Tools
RUN if [ "${INSTALL_LDAP_AD}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    ldap-utils smbclient smbmap enum4linux certipy-ad python3-ldapdomaindump && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Database Tools
RUN if [ "${INSTALL_DATABASES}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    sqsh default-mysql-client postgresql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Reverse Engineering Tools
RUN if [ "${INSTALL_REVERSING}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    radare2 gdb-multiarch file binutils ropper && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Miscellaneous Tools
RUN if [ "${INSTALL_MISC_TOOLS}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    exploitdb commix davtest skipfish wpscan assetfinder && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Python Environment
RUN if [ "${INSTALL_PYTHON}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    python3-pip python3-venv python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Build Tools
RUN if [ "${INSTALL_BUILD_TOOLS}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    build-essential gcc g++ make cmake libpcap-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Additional Network Utilities
RUN if [ "${INSTALL_NET_UTILS}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    ncat socat netcat-openbsd rlwrap telnet-ssl openssh-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Archive Utilities
RUN if [ "${INSTALL_ARCHIVES}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y \
    unzip zip p7zip-full unrar-free && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Docker CLI
RUN if [ "${INSTALL_DOCKER_CLI}" = "true" ]; then \
    for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get install -y --no-install-recommends \
    apt-transport-https ca-certificates gnupg lsb-release && \
    update-ca-certificates --fresh && \
    ARCH=$(dpkg --print-architecture) && \
    echo "deb [arch=${ARCH} signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bookworm stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | \
    gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    apt-get update && apt-get install -y docker-ce-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

# Install Go
RUN if [ "${INSTALL_GO}" = "true" ]; then \
    ARCH=$(dpkg --print-architecture) && \
    wget -O go.tar.gz "https://go.dev/dl/go1.24.4.linux-${ARCH}.tar.gz" && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm go.tar.gz && \
    mkdir -p /home/kali/go/bin /home/kali/go/src /home/kali/go/pkg && \
    chown -R kali:kali /home/kali/go; \
    fi

# Create Python virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN if [ "${INSTALL_PYTHON}" = "true" ]; then python3 -m venv $VIRTUAL_ENV --copies --clear; fi
RUN if [ "${INSTALL_PYTHON}" = "true" ]; then chown -R kali:kali $VIRTUAL_ENV; fi

# Add venv to PATH
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Switch to non-root user
USER kali

# Upgrade pip
RUN if [ "${INSTALL_PYTHON}" = "true" ]; then python -m ensurepip --upgrade && python -m pip install --upgrade pip setuptools wheel; fi

# Install Python packages
RUN if [ "${INSTALL_PYTHON}" = "true" ]; then pip install --no-cache-dir \
    paramiko \
    pexpect \
    beautifulsoup4 \
    shodan \
    censys \
    ldap3 \
    pywinrm \
    pwntools \
    impacket \
    scapy; fi

# Configure Go environment
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/home/kali/go"
ENV PATH="${GOPATH}/bin:${PATH}"
ENV CGO_ENABLED=1

# Configure shell environment
RUN echo "export PATH=$VIRTUAL_ENV/bin:\$PATH" >> /home/kali/.bashrc && \
    echo "export VIRTUAL_ENV=$VIRTUAL_ENV" >> /home/kali/.bashrc && \
    echo "export PATH=/usr/local/go/bin:\$PATH" >> /home/kali/.bashrc && \
    echo "export GOPATH=/home/kali/go" >> /home/kali/.bashrc && \
    echo "export PATH=\$GOPATH/bin:\$PATH" >> /home/kali/.bashrc && \
    mkdir -p /home/kali/.config/pip && \
    echo "[global]" > /home/kali/.config/pip/pip.conf && \
    echo "break-system-packages = true" >> /home/kali/.config/pip/pip.conf

# Install Go tools
RUN if [ "${INSTALL_GO_TOOLS}" = "true" ]; then \
    set -e && \
    /usr/local/go/bin/go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && \
    /usr/local/go/bin/go install github.com/projectdiscovery/httpx/cmd/httpx@latest && \
    /usr/local/go/bin/go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest && \
    /usr/local/go/bin/go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest && \
    /usr/local/go/bin/go install github.com/projectdiscovery/katana/cmd/katana@latest && \
    /usr/local/go/bin/go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest && \
    /usr/local/go/bin/go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest && \
    /usr/local/go/bin/go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest && \
    /usr/local/go/bin/go install github.com/ffuf/ffuf/v2@latest && \
    /usr/local/go/bin/go install github.com/tomnomnom/waybackurls@latest && \
    /usr/local/go/bin/go install github.com/lc/gau/v2/cmd/gau@latest && \
    /usr/local/go/bin/go install github.com/hakluke/hakrawler@latest && \
    chmod -R u+w /home/kali/go/pkg/ && rm -rf /home/kali/go/pkg/*; \
    fi

# Set working directory
WORKDIR /work

# Default command
CMD ["/bin/bash"]

# Systemd-enabled Kali Linux container using docker-systemctl-replacement
FROM base AS systemd

# Switch back to root user for systemd setup
USER root

# Install systemd packages
RUN for i in $(seq 1 5); do apt-get update && break; sleep 5; done && \
    apt-get upgrade -y && \
    apt-get install -y \
        systemd systemd-sysv dbus python3 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install docker-systemctl-replacement
RUN wget -O /usr/local/bin/systemctl \
    https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py && \
    chmod +x /usr/local/bin/systemctl

# Configure systemd for container use
ENV container=docker

# Configure systemd services for container environment
RUN systemctl mask dev-hugepages.mount sys-fs-fuse-connections.mount && \
    systemctl mask systemd-remount-fs.service dev-mqueue.mount && \
    systemctl mask systemd-logind.service && \
    systemctl mask getty.target && \
    systemctl mask console-getty.service

# Copy and install container entrypoint script
COPY container-entrypoint.sh /usr/local/bin/container-entrypoint
RUN chmod +x /usr/local/bin/container-entrypoint

# Use custom entrypoint
ENTRYPOINT ["/usr/local/bin/container-entrypoint"]