FROM kalilinux/kali-bleeding-edge

ARG USER=user
ARG PASSWD=pwd
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

# Base tools
RUN apt-get install --no-install-recommends -y \
    ack curl dnsutils dos2unix entr fd-find file fzf git hexedit jq less man \
    moreutils openssh-client python3 python3-pip sudo tmux tree vim watch wget

# Development tools
RUN apt-get install --no-install-recommends -y \
    build-essential golang php-cli python3-dev ruby-dev

# Bruteforcing
RUN apt-get install --no-install-recommends -y hydra

# Networking
RUN apt-get install --no-install-recommends -y iputils-ping ncat nmap tshark

# Wordlist creation
RUN apt-get install --no-install-recommends -y cewl

# Web tools
RUN apt-get install --no-install-recommends -y nikto sqlmap whatweb

# Subdomain enumeration
RUN apt-get install --no-install-recommends -y amass

# Web enumeration
RUN pip3 install gsan dnsgen
RUN apt-get install --no-install-recommends -y whois
RUN go get github.com/ffuf/ffuf \
           github.com/hakluke/hakrawler \
           github.com/lc/gau \
           github.com/asciimoo/wuzz \
           github.com/IAmStoxe/urlgrab \
           github.com/projectdiscovery/dnsprobe \
           github.com/projectdiscovery/httpx/cmd/httpx \
           github.com/projectdiscovery/chaos-client/cmd/chaos \
           github.com/projectdiscovery/subfinder/cmd/subfinder \
           github.com/tomnomnom/assetfinder \
           github.com/tomnomnom/gf \
           github.com/tomnomnom/unfurl \
           github.com/tomnomnom/waybackurls \
           github.com/tomnomnom/hacks/html-tool && \
    mv /root/go/bin/* /usr/local/bin

RUN mkdir -p /usr/share/wordlists

# Install altdns
RUN https://github.com/infosec-au/altdns && \
        cd altdns && \
        python3 setup.py install && \
        cd .. && \
        rm -rf altdns

# Install massdns
RUN git clone https://github.com/blechschmidt/massdns && \
        cd massdns && \
        make && \
        make install && \
        cp -r lists /usr/share/wordlists/massdns && \
        cd .. && \
        rm -rf massdns

# Install masscan
RUN apt-get install -y --no-install-recommends gcc make libpcap-dev && \
        git clone https://github.com/robertdavidgraham/masscan && \
        cd masscan && \
        make && \
        mv bin/masscan /usr/local/bin && \
        cd .. && \
        rm -rf masscan

# Install ngrok
RUN curl -s https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip | \
        zcat > /usr/local/bin/ngrok && \
        chmod +x /usr/local/bin/ngrok

# User creation
RUN useradd -m ${USER} && \
    usermod -aG sudo ${USER} && \
    echo "${USER}:${PASSWD}" | chpasswd && \
    chsh -s /bin/bash ${USER} && \
    chown -R ${USER}:${USER} /home/${USER}

USER $USER

# Install dotfiles
RUN curl -Ls http://bit.do/samirminimaldotfiles | bash

WORKDIR /home/${USER}
