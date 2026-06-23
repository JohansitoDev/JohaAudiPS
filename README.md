# JohaAudiPS 🛡️

EthicalWebAuditor es una herramienta en **PowerShell** para realizar auditorías básicas de seguridad web de manera ética y educativa.  
Su propósito es ayudar a desarrolladores y estudiantes a entender cómo verificar configuraciones de seguridad en sus propios proyectos.

---

## ✨ Funcionalidades

- **Get-HttpHeaders** → Revisa si los principales headers de seguridad están presentes (CSP, HSTS, X-Frame-Options, etc.).
- **Test-TlsConfig** → Valida el certificado TLS/SSL y muestra fechas de vigencia.
- **Find-SensitiveInfo** → Busca patrones comunes de información sensible en el HTML (ej. `token`, `secret`, `api_key`).
- **Crawl-Website** → Recorre el sitio y lista endpoints encontrados.

