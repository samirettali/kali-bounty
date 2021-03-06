FROM kalilinux/kali-bleeding-edge

ARG USER=user
ARG PASSWD=pwd
ENV DEBIAN_FRONTEND noninteractive

# Update repositories and upgrade software
RUN apt-get update && apt-get upgrade -y

# Base tools
RUN apt-get install --no-install-recommends -y \
    ack awscli curl dnsutils dos2unix entr fd-find file fzf git hexedit jq \
    less man moreutils openssh-client python3 python3-pip sudo tmux tree vim \
    watch wget

# Development tools
RUN apt-get install --no-install-recommends -y \
    build-essential golang-1.15 php-cli python3-dev ruby-dev nodejs npm

# Bruteforcing
RUN apt-get install --no-install-recommends -y hydra

# Networking
RUN apt-get install --no-install-recommends -y iputils-ping ncat nmap tshark

# Wordlist creation
RUN apt-get install --no-install-recommends -y cewl

# Web tools
RUN apt-get install --no-install-recommends -y nikto sqlmap whatweb

# Subdomain enumeration
RUN apt-get install --no-install-recommends -y amass dnsrecon

# Web enumeration
RUN gem install XSpear
RUN pip3 install gsan shodan
RUN apt-get install --no-install-recommends -y whois

# Create link to Go executable
RUN ln -s /usr/lib/go-1.15/bin/go /bin/go

# Go tools
RUN GO111MODULE=on go get -u github.com/ffuf/ffuf \
           github.com/hakluke/hakrawler \
           github.com/lc/gau \
           github.com/tillson/git-hound \
           github.com/asciimoo/wuzz \
           github.com/haccer/subjack \
           github.com/003random/getJS \
           github.com/milindpurswani/whoxyrm \
           github.com/jaeles-project/jaeles \
           github.com/jaeles-project/gospider@8002688 \
           github.com/samirettali/urlgrab@e0ffebc \
           dw1.io/crlfuzz/cmd/crlfuzz \
           github.com/Static-Flow/ParameterMiner/cmd/parameterMiner \
           github.com/projectdiscovery/nuclei/v2/cmd/nuclei \
           github.com/projectdiscovery/httpx/cmd/httpx \
           github.com/projectdiscovery/chaos-client/cmd/chaos \
           github.com/projectdiscovery/subfinder/cmd/subfinder \
           github.com/projectdiscovery/shuffledns/cmd/shuffledns \
           github.com/projectdiscovery/dnsx/cmd/dnsx \
           github.com/projectdiscovery/mapcidr/cmd/mapcidr \
           github.com/dwisiswant0/unew \
           github.com/tomnomnom/assetfinder \
           github.com/tomnomnom/gf \
           github.com/tomnomnom/meg \
           github.com/tomnomnom/httprobe \
           github.com/tomnomnom/unfurl \
           github.com/tomnomnom/anew \
           github.com/tomnomnom/waybackurls \
           github.com/tomnomnom/qsreplace \
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

# Install dnscewl
RUN git clone https://github.com/codingo/DNSCewl && \
        cd DNSCewl && \
        make && \
        mv DNScewl /usr/local/bin/dnscewl && \
        cd .. && \
        rm -rf DNSCewl

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

# Install surge to host static websites
RUN npm install -global surge

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
        git clone https://github.com/tomnomnom/gf && \
        mkdir -p /home/${USER}/.gf && \
        mv gf/examples/*.json /home/${USER}/.gf && \
        rm -rf gf

RUN cd /home/${USER} && \
        git clone https://github.com/1ndianl33t/Gf-Patterns && \
        mkdir -p /home/${USER}/.gf && \
        mv Gf-Patterns/*.json /home/${USER}/.gf && \
        rm -rf Gf-Patterns

# Get jaeles' signatures
RUN cd /home/${USER} && \
        git clone --depth=1 https://github.com/jaeles-project/jaeles-signatures && \
        jaeles config -a reload --signDir jaeles-signatures && \
        rm -rf jaeles-signatures

# Install dotfiles
RUN curl -Ls http://bit.do/samirminimaldotfiles | bash

WORKDIR /home/${USER}
