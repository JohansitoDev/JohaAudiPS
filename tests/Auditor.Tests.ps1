Describe "EthicalWebAuditor Tests" {
    It "Debe detectar headers de seguridad" {
        Get-HttpHeaders -Url "https://github.com" | Should -Not -BeNullOrEmpty
    }
    It "Debe validar certificado TLS" {
        Test-TlsConfig -Url "https://github.com" | Should -Not -BeNullOrEmpty
    }
}
