![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/Test-NetHLK?label=Current%20Version)
[![Build status](https://ci.appveyor.com/api/projects/status/28dr5irvwqc34ftf?svg=true)](https://ci.appveyor.com/project/MSFTCoreNet/test-nethlk)
[![downloads](https://img.shields.io/powershellgallery/dt/Test-NetHLK.svg?label=downloads)](https://www.powershellgallery.com/packages/Test-NetHLK)

# Overview

Test-NetHLK is a module used for testing the advanced properties for Network Adapters and determining if a network switch supports the Azure Stack HCI requirements.

## Installation

This module is available on the PowerShell gallery using the following command:
```Install-Module Test-NetHLK -Force```

For a disconnected system, please use:
```Save-Module Test-NetHLK -Path <SomeFolderPath>```

Then move all downloaded module to the disconnected system in the PowerShell module path. For example:
```C:\Program Files\WindowsPowerShell\Modules\Test-NetHLK\...```

## Updating the module

We recommend the following process for ensuring you're running the latest version of the module.

First uninstall the old module:
```Uninstall-Module Test-NetHLK -AllVersions```

Next, install the latest version of the module:
```Install-Module Test-NetHLK -Force```


## Test-NICAdvancedProperties

This cmdlet tests the properties returned from Get-NetAdapterAdvancedProperty. For syntatical help, please use the PowerShell help with the following command ```help Test-NICAdvancedProperties```

Example Use:
```Test-NICAdvancedProperties -InterfaceName Ethernet```

# Property Definitions

## Test-NICAdvancedProperties

Test-NICAdvancedProperties validate various aspects of the advanced registry keys. This section defines some of the lesser known properties being validated.

### DisplayParameterType

Description: The advanced registry key type

|Value|Type|Min|Max|
|----|----|----|----|
|1|int|-32768|32767|
|2|long|-2147483648|2147483647|
|3|word|0|65535|
|4|dword|0|4294967295|
|5|enum|N/A|N/A|

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
