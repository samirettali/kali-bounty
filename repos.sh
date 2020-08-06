#!/usr/bin/env bash

set -e

mkdir {wordlists,resources,tools,bounty}

cd wordlists
git clone https://github.com/1N3/IntruderPayloads
git clone https://github.com/danielmiessler/RobotsDisallowed
git clone https://github.com/danielmiessler/SecLists
git clone https://github.com/dustyfresh/dictionaries
git clone https://github.com/dwyl/english-words
git clone https://github.com/foospidy/payloads
git clone https://github.com/fuzzdb-project/fuzzdb
git clone https://github.com/jeanphorn/wordlist/
git clone https://github.com/minimaxir/big-list-of-naughty-strings
git clone https://github.com/napolux/paroleitaliane
git clone https://github.com/swisskyrepo/PayloadsAllTheThings
git clone https://github.com/xmendez/wfuzz
git clone https://github.com/first20hours/google-10000-english
git clone https://github.com/NotSoSecure/password_cracking_rules
git clone https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words
git clone https://github.com/imsky/wordlists misc-wordlists
git clone https://github.com/xaviershay/mnemonicker-wordlist
git clone https://github.com/umpirsky/country-list
git clone https://github.com/samirettali/wordlists
git clone https://github.com/samirettali/password-cracking-rules
git clone https://github.com/thelikes/fuzzmost
git clone https://github.com/assetnote/commonspeak2-wordlists
git clone https://github.com/Droidzzzio/EnumerationList
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
wget https://crackstation.net/files/crackstation-human-only.txt.gz

cd ../resources
git clone https://github.com/DominicBreuker/stego-toolkit
git clone https://github.com/EdOverflow/can-i-take-over-xyz
git clone https://github.com/JohnHammond/ctf-katana
git clone https://github.com/apsdehal/awesome-ctf
git clone https://github.com/enaqx/awesome-pentest
git clone https://github.com/jivoi/pentest
git clone https://github.com/lanjelot/ctfs
git clone https://github.com/sehno/Bug-bounty
git clone https://github.com/trimstray/the-book-of-secret-knowledge
git clone https://github.com/vitalysim/Awesome-Hacking-Resources
git clone https://github.com/zardus/ctf-tools
git clone https://github.com/terjanq/Tiny-XSS-Payloads
git clone https://github.com/jdonsec/AllThingsSSRF
git clone https://github.com/Ignitetechnologies/Privilege-Escalation
git clone "https://github.com/masatokinugawa/filterbypass/wiki/Browser's-XSS-Filter-Bypass-Cheat-Sheet"

cd ../tools
git clone https://github.com/Boran/lusas
git clone https://github.com/Ganapati/RsaCtfTool
git clone https://github.com/Sjord/jwtcrack
git clone https://github.com/bwall/HashPump
git clone https://github.com/frdmn/findmyhash
git clone https://github.com/psypanda/hashID
git clone https://github.com/rebootuser/Hashmash

# Enumeration
git clone https://github.com/0x646e78/linux-credential-harvester
git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester
git clone https://github.com/PowerShellMafia/PowerSploit
git clone https://github.com/WazeHell/PE-Linux
git clone https://github.com/carlospolop/linux-privilege-escalation-awsome-script
git clone https://github.com/jondonas/linux-exploit-suggester-2
git clone https://github.com/mzet-/linux-exploit-suggester
git clone https://github.com/pentestmonkey/unix-privesc-check
git clone https://github.com/rebootuser/LinEnum
git clone https://github.com/sleventyeleven/linuxprivchecker
git clone https://github.com/NotSoSecure/docker_fetch
git clone https://github.com/Tib3rius/AutoRecon

# Bruteforce
git clone https://github.com/ztgrace/changeme
git clone https://github.com/nlitsme/vimdecrypt

# Recognition   
git clone https://github.com/nahamsec/lazyrecon

# Exploitation
git clone https://github.com/commixproject/commix
git clone https://github.com/gaul/awesome-ld-preload

# Post exploitation
git clone https://github.com/0x00-0x00/ShellPop
git clone https://github.com/1N3/PrivEsc
git clone https://github.com/mossberg/poet

# File exfiltration
git clone https://github.com/Arno0x/DNSExfiltrator

# Git
git clone https://github.com/Ebryx/GitDump
git clone https://github.com/internetwache/GitTools
git clone https://github.com/dxa4481/truffleHog

# Process monitoring
git clone https://github.com/DominicBreuker/pspy

# RAT
git clone https://github.com/n1nj4sec/pupy

# Information gathering
git clone https://github.com/s0md3v/Striker
git clone https://github.com/GerbenJavado/LinkFinder
git clone https://github.com/Zarcolio/wwwordlist

# PHP revershe shells
git clone https://github.com/epinna/weevely3
git clone https://github.com/flozz/p0wny-shell
git clone https://github.com/pentestmonkey/php-reverse-shell

# DNS
git clone https://github.com/Crypt0s/FakeDns
git clone https://github.com/elceef/dnstwist
git clone https://github.com/darkoperator/dnsrecon

# Discovery
git clone https://github.com/maurosoria/dirsearch
git clone https://github.com/s0md3v/Arjun
git clone https://github.com/subfinder/subfinder

# Wireless
git clone https://github.com/FluxionNetwork/fluxion
git clone https://github.com/derv82/wifite2

# OSINT
git clone https://github.com/martinvigo/email2phonenumber
git clone https://github.com/thelinuxchoice/userrecon
git clone https://github.com/tr4cefl0w/userfinder
git clone https://github.com/sherlock-project/sherlock

# Web
git clone https://github.com/D35m0nd142/LFISuite
git clone https://github.com/J3wker/anti-CSRF_Token-Bruteforce
git clone https://github.com/andresriancho/w3af
git clone https://github.com/arthaud/git-dumper
git clone https://github.com/blechschmidt/massdns
git clone https://github.com/mhaskar/RCEScanner
git clone https://github.com/codingo/crithit
git clone https://github.com/ticarpi/jwt_tool
git clone https://github.com/andreafortuna/MITMInjector
git clone https://github.com/thelinuxchoice/saycheese
git clone https://github.com/thelinuxchoice/sayhello
git clone https://github.com/thelinuxchoice/shellphish
git clone https://github.com/DarkSecDevelopers/HiddenEye
git clone https://github.com/AvinashReddy3108/YetAnotherSMSBomber

# Deserialization
git clone https://github.com/joaomatosf/jexboss
git clone https://github.com/frohoff/ysoserial

# Data exfiltration 
git clone https://github.com/sensepost/DET

# Misc
git clone https://github.com/andrew-d/static-binaries
git clone https://github.com/j3ssie/Osmedeus
git clone https://github.com/lockedbyte/cryptovenom
git clone https://github.com/mpowa705/Simple-Backdoor
git clone https://github.com/samirettali/ctf-scripts
git clone https://github.com/samirettali/web-recon
git clone https://github.com/trailofbits/onesixtyone
git clone https://github.com/whid-injector/WHID
git clone https://github.com/nahamsec/JSParser
git clone https://github.com/gleitz/npiet
git clone https://github.com/BRDumps/extract-hashes
git clone https://github.com/sameera-madushan/Print-My-Shell
git clone https://github.com/calebstewart/pwncat

# Reverse shells
git clone https://github.com/ShutdownRepo/shellerator
git clone https://github.com/samirettali/reverse-shell-helper

# Code audit
git clone https://github.com/wireghoul/graudit

# Steganography
git clone https://github.com/evyatarmeged/stegextract
wget http://downloads.sourceforge.net/sourceforge/diit/diit-1.5.jar

 # Windows
git clone https://github.com/Dhayalanb/windows-php-reverse-shell
git clone https://github.com/SecureAuthCorp/impacket
git clone https://github.com/samratashok/nishang
git clone https://github.com/sense-of-security/ADRecon

# Reversing
git clone https://github.com/ThisIsLibra/AndroidProjectCreator

cd ../bounty

# Secrets finder
git clone https://github.com/Talkaboutcybersecurity/GitMonitor
git clone https://github.com/auth0/repo-supervisor
git clone https://github.com/eth0izzle/shhgit
git clone https://github.com/gwen001/github-search
git clone https://github.com/hisxo/gitGraber
git clone https://github.com/m4ll0k/SecretFinder
git clone https://github.com/michenriksen/gitrob
git clone https://github.com/pownjs/pown-leaks
git clone https://github.com/robre/scripthunter
git clone https://github.com/s0md3v/hardcodes
git clone https://github.com/sahadnk72/jecretz
git clone https://github.com/zricethezav/gitleaks

# Monitoring
git clone https://github.com/robre/jsmon.git
git clone https://github.com/ahussam/url-tracker.git

# XSS Finder
git clone https://github.com/s0md3v/XSStrike

# SSRF
git clone https://github.com/swisskyrepo/SSRFmap
git clone https://github.com/random-robbie/ssrf-finder

# Misc
git clone https://github.com/allyomalley/LiveTargetsFinder
git clone https://github.com/Static-Flow/ParameterMiner
git clone https://github.com/ShutdownRepo/telegram-bot-cli
git clone https://github.com/m4ll0k/Bug-Bounty-Toolz
git clone https://github.com/victoni/Bug-Bounty-Scripts
git clone https://github.com/1ndianl33t/Gf-Patterns

# Data
git clone https://github.com/arkadiyt/bounty-targets-data

# Recon
git clone https://github.com/yogeshojha/rengine