FROM kalilinux/kali-rolling

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
RUN apt-get install --no-install-recommends -y chromium nikto sqlmap whatweb

# Subdomain enumeration
RUN apt-get install --no-install-recommends -y amass

# Web enumeration
RUN gem install XSpear
RUN pip3 install gsan shodan
RUN apt-get install --no-install-recommends -y whois

# Go tools
RUN go get github.com/ffuf/ffuf \
           github.com/hakluke/hakrawler \
           github.com/lc/gau \
           github.com/asciimoo/wuzz \
           github.com/IAmStoxe/urlgrab \
           github.com/haccer/subjack \
           github.com/michenriksen/aquatone \
           github.com/projectdiscovery/nuclei/v2/cmd/nuclei \
           github.com/projectdiscovery/dnsprobe \
           github.com/projectdiscovery/httpx/cmd/httpx \
           github.com/projectdiscovery/chaos-client/cmd/chaos \
           github.com/projectdiscovery/subfinder/cmd/subfinder \
           github.com/tomnomnom/assetfinder \
           github.com/tomnomnom/gf \
           github.com/tomnomnom/httprobe \
           github.com/tomnomnom/unfurl \
           github.com/tomnomnom/waybackurls \
           github.com/tomnomnom/hacks/kxss \
           github.com/tomnomnom/hacks/tok \
           github.com/tomnomnom/hacks/ettu \
           github.com/tomnomnom/hacks/filter-resolved \
           github.com/tomnomnom/hacks/html-tool && \
    mv /root/go/bin/* /usr/local/bin

RUN mkdir -p /usr/share/wordlists

# Install findomain
RUN wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux -O /usr/local/bin/findomain && \
        chmod +x /usr/local/bin/findomain

# Install altdns
RUN git clone https://github.com/infosec-au/altdns && \
        cd altdns && \
        python3 setup.py install && \
        cd .. && \
        rm -rf altdns

# Install dnsgen
RUN git clone https://github.com/ProjectAnte/dnsgen && \
        cd dnsgen && \
        pip3 install -r requirements.txt && \
        python3 setup.py install && \
        cd .. && \
        rm -rf dnsgen

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

# Install linkfinder dependencies
RUN git clone https://github.com/GerbenJavado/LinkFinder && \
        cd LinkFinder && \
        pip3 install -r requirements.txt && \
        cd .. && \
        rm -rf LinkFinder

# Install ParamSpider dependencies
RUN git clone https://github.com/devanshbatham/ParamSpider && \
        cd ParamSpider && \
        pip3 install -r requirements.txt && \
        cd .. && \
        rm -rf ParamSpider

# User creation
RUN useradd -m ${USER} && \
    usermod -aG sudo ${USER} && \
    sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g' && \
    echo "${USER}:${PASSWD}" | chpasswd && \
    chsh -s /bin/bash ${USER} && \
    chown -R ${USER}:${USER} /home/${USER}

USER $USER

# Get gf's patterns
RUN cd /home/${USER} && \
        git clone https://github.com/1ndianl33t/Gf-Patterns && \
        mkdir /home/${USER}/.gf && \
        mv Gf-Patterns/*.json /home/${USER}/.gf && \
        rm -rf Gf-Patterns

# Install dotfiles
RUN curl -Ls http://bit.do/samirminimaldotfiles | bash

WORKDIR /home/${USER}
