# 🌐 GlobalSend DevOps & DevSecOps Pipeline

**Automated Multi-Environment Deployment | Terraform, Azure App Service, GitHub Actions**

---

## 🚀 Overview
GlobalSend is a money transfer web application deployed across multiple Azure environments using Terraform and GitHub Actions. The pipeline implements a **Blue-Green deployment strategy** for zero-downtime production releases.

**Key Outcomes:**
- Predictable, secure, and scalable multi-environment deployment  
- Developer-first automation via PowerShell + GitHub Actions  
- Terraform Infrastructure as Code for reproducible environments  
- Zero-downtime releases with Blue-Green production deployment  
- **Pipeline-enforced DevSecOps security checks**

---

## 🏗 Architecture
**End-to-End Flow:**  
Local Dev → PowerShell → GitHub → GitHub Actions → OIDC → Terraform → Dev → Staging → Azure → Users

**Architecture Diagram**  
*(Insert diagram here)*

---

## ⚡ Key Components

| Component               | Technology                        | Purpose                                     |
|-------------------------|----------------------------------|---------------------------------------------|
| Frontend Application    | HTML5, CSS3, JavaScript          | Money transfer interface with live calculator |
| Infrastructure          | Terraform                        | Azure resource provisioning                 |
| Hosting                 | Azure App Service                | Web application hosting                     |
| Storage                 | Azure Storage Account            | ZIP package deployment                      |
| CI/CD                   | GitHub Actions                   | Automated, environment-aware pipeline      |
| Deployment Strategy     | Blue-Green                        | Zero-downtime production releases           |
| Automation              | PowerShell                        | Local validation, branch promotion, deployment |

---

## 🔧 Multi-Environment Strategy

| Environment   | Branch    | Deployment Trigger        |
|---------------|-----------|---------------------------|
| Development   | dev       | Push to dev branch       |
| Staging       | staging   | Merge dev → staging      |
| Production    | main      | Blue-Green deployment    |

**Pipeline Features:**  
- Branch-based environment detection  
- OIDC authentication for dev  
- Service Principal authentication for staging/prod  
- Automated Terraform plan & apply  
- Smoke tests and Blue-Green swap for production  
- **Automated DevSecOps security gates enforcing compliance**

---

## 🗂 Project Structure

| Folder                     | Purpose                                          |
|-----------------------------|--------------------------------------------------|
| /app                        | Frontend code (HTML, CSS, JS)                   |
| /assets                     | Images and icons                                |
| /scripts                    | PowerShell automation & deployment              |
| /terraform                  | Infrastructure as Code & modules                |
| /.github/workflows          | CI/CD pipeline YAMLs with DevSecOps checks      |
| README.md                   | Project overview                                |

---

## 🛡 Security & DevSecOps Controls

GlobalSend enforces **security at every stage of the CI/CD pipeline**, making DevSecOps an integral part of deployments. Security checks are automated, and deployments are **blocked until all checks pass**.

**1. CI/CD Security Automation:**  
- **Static Application Security Testing (SAST):** CodeQL scans application code for vulnerabilities.  
- **Software Composition Analysis (SCA):** Trivy and Dependabot check for insecure dependencies.  
- **Secret Detection:** GitLeaks identifies hardcoded secrets before merges.  
- **Infrastructure-as-Code Policy Enforcement:** Checkov and Azure Policy validate Terraform templates.

**2. Deployment Gates:**  
- Production deployments are **blocked if any security checks fail**.  
- Blue-Green deployment ensures zero-downtime while enforcing compliance.

**3. Identity & Access Security:**  
- **OIDC Authentication:** Passwordless Azure login for development environments.  
- **Service Principals:** Secure credentials for staging and production.  
- **Environment Isolation:** Separate Azure subscriptions per environment.  
- **Network Protections:** Azure App Service built-in controls safeguard web traffic.

> **Takeaway:** Security is baked into every stage of the pipeline — deployments cannot proceed unless automated checks pass.

---

## 📬 Contact
For questions about this DevOps/DevSecOps pipeline or cloud architecture best practices, feel free to reach out.

---

**Last Updated:** February 2026 | GlobalSend Money Transfer Application  
**License:** MIT License
