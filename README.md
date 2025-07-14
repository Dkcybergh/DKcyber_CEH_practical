# 🛡️ DKCyber CEHv13 Beast – Master Ethical Hacking on Kali Linux

> **By DK Cyber** – Cybersecurity Expert, Ethical Hacker, Forensics Investigator  
> 🎓 A Fully Interactive and Realistic CEH v13 Learning Platform for Kali Linux

---

## 📘 Overview

**DKCyber CEHv13 Beast** is a fully interactive Bash-based learning suite built to help aspiring ethical hackers and cybersecurity professionals **master the CEH v13 curriculum** using **real commands, tools, and scenarios** in Kali Linux.

The script guides learners through **20+ core modules**, complete with a colorful terminal UI, smart navigation, cheat sheets, certification prep tips, and more.

---

## ✨ Key Features

- ✅ Beautiful ASCII-styled terminal menu system
- ✅ Full CEHv13 module breakdown: from Footprinting to Cryptography
- ✅ Real-world tools like `nmap`, `enum4linux`, `whatweb`, `sqlmap`, etc.
- ✅ Certification preparation mode
- ✅ Quick review & cheat sheet mode
- ✅ Progress tracker (manual)
- ✅ DK Cyber branding and motivational structure

---

## 📚 Module Breakdown

| **Week** | **Focus Area**          | **Module** | **Title**                          | **Description**                                    |
| -------- | ----------------------- | ---------- | ---------------------------------- | -------------------------------------------------- |
| **1**    | **Foundations**         | 1          | Introduction to Ethical Hacking    | Learn the core concepts, roles, and hacking phases |
|          |                         | 2          | Footprinting & Reconnaissance      | Information gathering via OSINT, DNS, Whois, etc.  |
|          |                         | 3          | Scanning Networks                  | Network discovery with tools like Nmap and Hping   |
|          |                         | 4          | Enumeration                        | Extract network/service/user info from targets     |
|          |                         | 5          | Vulnerability Analysis             | Identify and assess system weaknesses              |
| **2**    | **Attacks & Threats**   | 6          | System Hacking                     | Password cracking, privilege escalation, etc.      |
|          |                         | 7          | Malware Threats                    | Understand and analyze viruses, worms, Trojans     |
|          |                         | 8          | Sniffing                           | Intercepting network traffic and packet analysis   |
|          |                         | 9          | Social Engineering                 | Human hacking, phishing, impersonation attacks     |
|          |                         | 10         | Denial-of-Service                  | Techniques for service disruption attacks          |
| **3**    | **Advanced Techniques** | 11         | Session Hijacking                  | Stealing sessions and bypassing authentication     |
|          |                         | 12         | Evading IDS, Firewalls & Honeypots | Stealth tactics to bypass detection systems        |
|          |                         | 13         | Hacking Web Servers                | Exploiting server-side weaknesses                  |
|          |                         | 14         | Hacking Web Applications           | Web app flaws like XSS, RCE, file inclusion        |
|          |                         | 15         | SQL Injection                      | Database manipulation through insecure queries     |
| **4**    | **Specialized Domains** | 16         | Hacking Wireless Networks          | Breaking into Wi-Fi, cracking WPA2, etc.           |
|          |                         | 17         | Hacking Mobile Platforms           | Attacks on Android/iOS apps and services           |
|          |                         | 18         | IoT and OT Hacking                 | Industrial and embedded system exploitation        |
|          |                         | 19         | Cloud Computing                    | Assessing and securing cloud-based assets          |
|          |                         | 20         | Cryptography                       | Hashes, encryption, and cryptographic attacks      |
| **🔧**   | **Tools & Extras**      | 21         | Show Progress & Analytics          | Track your learning journey (manual/log)           |
|          |                         | 22         | Quick Review Mode (Cheat Sheet)    | CEH shortcuts and summary of important points      |
|          |                         | 23         | Practice Commands & Lab Setup      | Lab-based learning with CLI tools                  |
|          |                         | 24         | Certification Prep & Exam Tips     | Real exam strategy and study guide                 |
|          |                         | 25         | About DK Cyber & Resources         | Who created this? Get more tools and help          |


## 🛠️ Requirements

- 🐧 Kali Linux (2021+)
- `bash`, `nmap`, `whatweb`, `enum4linux`, `sqlmap`, `nikto`, `dnsenum`, etc.
- Internet connection (for some modules)

Install dependencies:
```bash
sudo apt update && sudo apt install nmap sqlmap whatweb dnsenum enum4linux nikto


git clone https://github.com/Dkcybergh/DKcyber_CEH_practical.git
cd dkcyber_CEH_practical

chmod +x DKcyber_CEH.sh
./dkcyber_ceh.sh
