$DataFile   = Import-PowerShellDataFile .\$($env:repoName).psd1 -ErrorAction SilentlyContinue
$TestModule = Test-ModuleManifest       .\$($env:repoName).psd1 -ErrorAction SilentlyContinue

Describe "$($env:APPVEYOR_BUILD_FOLDER)-Manifest" {
    Context Validation {
        It "[Manifest] - $($env:repoName).psd1 exists" { Test-Path "$($env:repoName).psd1" | Should Be True }

        It "[Test-Path] - $($env:repoName).psm1 exists" { Test-Path "$($env:repoName).psm1" | Should Be True }

        It "[Manifest Property] - $($env:repoName).psm1 exists" { $DataFile.RootModule | Should Be "$($env:repoName).psm1" }

        It "[Import-PowerShellDataFile] - $($env:repoName).psd1 is a valid PowerShell Data File" {
            $DataFile | Should Not BeNullOrEmpty
        }

        It "[Test-ModuleManifest] - $($env:repoName).psd1 should pass the basic test" {
            $TestModule | Should Not BeNullOrEmpty
        }

        Import-Module .\$($env:repoName).psd1 -ErrorAction SilentlyContinue
        $Module = Get-Module $($env:repoName) -ErrorAction SilentlyContinue

        'Test-NICAdvancedProperties' | ForEach-Object {
            It "Should have an available command: $_" {
                $module.ExportedCommands.ContainsKey($_) | Should be $true
            }
        }

        It "Should have an available alias: Test-NICProperties" {
            $module.ExportedAliases.ContainsKey('Test-NICProperties') | Should be $true
        }

        It "Should have an reference command: Test-NICAdvancedProperties" {
            $module.ExportedAliases.'Test-NICProperties'.ReferencedCommand.Name | Should be 'Test-NICAdvancedProperties'
        }
    }
}
