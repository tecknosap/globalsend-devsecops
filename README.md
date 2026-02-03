# 🌐 GlobalSend DevOps Pipeline  
**End-to-End Delivery System | Developer + Cloud Architect Perspective**


## 🚀 About the Project

**GlobalSend** is a modern, **automation-first DevOps pipeline** delivering a money transfer application from **local development → Azure environments**, emphasizing **security, reproducibility, and end-to-end ownership**.

**Key Outcomes:**

- Predictable, secure, and scalable multi-environment deployment  
- Zero-downtime releases via **Blue-Green deployment**  
- Developer-first automation with **PowerShell + GitHub Actions**  
- Terraform Infrastructure as Code for reproducible environments  

---

## 🏆 Tech Stack & Skills

| Domain | Tools & Practices |
|--------|------------------|
| Front-End | HTML5, CSS3, JavaScript, Responsive Design |
| Cloud | Azure App Service, Storage Accounts, Resource Groups |
| Infrastructure | Terraform, Storage Blob Deployment, Modules |
| DevOps | GitHub Actions, Branch-based Workflows, OIDC Authentication |
| Deployment Strategy | Blue-Green Deployment, Smoke Tests, Automated Promotion |
| Security | Secretless OIDC, Least-Privilege Access Policies |
| Developer Experience | PowerShell Automation, Local Validation, Predictable Pipelines |

---

## 🧩 Architectural Vision

### Architect Perspective  
 - Clear separation of concerns  
 - Environment parity (Dev → Staging → Prod)  
 - Secretless authentication via **OIDC**  
 - Reproducible infrastructure with **Terraform**  
 - Traceable, auditable delivery lifecycle  

 ### Developer Perspective  
 - Fast local feedback loops  
 - Automated pre-deployment checks  
 - Simple commands triggering complex workflows  
 - Predictable, environment-aware CI/CD  

---

## 🔗 End-to-End Flow

 **Developer → Automation → Cloud → User**  
Local Dev → PowerShell Automation → GitHub → GitHub Actions → OIDC → Terraform → Dev → Staging → Azure → Users

---

## 🏗 System Components

| Component | Role |
|-----------|------|
| **Local Automation** | Pre-deployment checks, branch promotion, validation |
| **GitHub Control Plane** | Source code, IaC, branching, workflow triggers |
| **GitHub Actions CI/CD** | Build, test, deploy; environment-aware automation |
| **Azure OIDC Authentication** | Secretless, short-lived tokens; least-privilege access |
| **Terraform IaC** | Provision Dev + Staging; reproducible environments |
| **Azure Deployment** | Dev iteration → Staging validation → Blue-Green Production → User endpoint |

---

## 📈 Architecture Diagram

```mermaid
flowchart LR
    A[Local Dev] --> B[PowerShell Automation]
    B --> C[GitHub]
    C --> D[GitHub Actions CI/CD]
    D --> E[Terraform IaC]
    E --> F[Azure Dev Environment]
    F --> G[Azure Staging Environment]
    G --> H[Azure Production - Blue/Green Deployment]
    H --> I[End Users]
💡 Key Highlights
Automation-first mindset reduces friction and human error

Reproducible environments via Terraform

Secure deployments with secretless OIDC authentication

Scalable, production-ready foundation supporting multi-environment growth

Zero-downtime production via Blue-Green deployment strategy

📁 Repository Structure
Folder	Purpose
/app	Front-end HTML/CSS/JS
/scripts	Local automation (PowerShell)
/terraform	Infrastructure as Code & modules
/.github/workflows	CI/CD pipelines
/docs	Architecture diagrams, screenshots
README.md	Project overview
🛡 Network Security Visualization

📬 Contact
Open to discussions on DevOps, cloud automation, CI/CD, and production-grade architecture.
Reach out to collaborate on pipelines, Terraform patterns, or Azure deployments.