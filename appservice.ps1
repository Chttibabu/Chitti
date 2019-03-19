{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "sites_babuapp_name": {
            "defaultValue": "Appservicewithappsettings",
            "type": "String"
        },
        "serverfarms_babu_ASP_name": {
            "defaultValue": "babu-ASP",
            "type": "String"
        },
        "config_web_name": {
            "defaultValue": "web",
            "type": "String"
        },
        "hostNameBindings_babuapp.azurewebsites.net_name": {
            "defaultValue": "babuapp1.azurewebsites.net",
            "type": "String"
        }
    },
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Web/serverfarms",
            "sku": {
                "name": "B1",
                "tier": "Basic",
                "size": "B1",
                "family": "B",
                "capacity": 1
            },
            "kind": "app",
            "name": "[parameters('serverfarms_babu_ASP_name')]",
            "apiVersion": "2016-09-01",
            "location": "East US",
            "scale": null,
            "properties": {
                "name": "[parameters('serverfarms_babu_ASP_name')]",
                "workerTierName": null,
                "adminSiteName": null,
                "hostingEnvironmentProfile": null,
                "perSiteScaling": false,
                "reserved": false,
                "targetWorkerCount": 0,
                "targetWorkerSizeId": 0
            },
            "dependsOn": []
        },
        {
            "type": "Microsoft.Web/sites",
            "kind": "app",
            "name": "[parameters('sites_babuapp_name')]",
            "apiVersion": "2016-08-01",
            "location": "East US",
            "scale": null,
            "properties": {
                "enabled": true,
                "hostNameSslStates": [
                    {
                        "name": "[concat(parameters('sites_babuapp_name'),'.azurewebsites.net')]",
                        "sslState": "Disabled",
                        "virtualIP": null,
                        "thumbprint": null,
                        "toUpdate": null,
                        "hostType": "Standard"
                    },
                    {
                        "name": "[concat(parameters('sites_babuapp_name'),'.scm.azurewebsites.net')]",
                        "sslState": "Disabled",
                        "virtualIP": null,
                        "thumbprint": null,
                        "toUpdate": null,
                        "hostType": "Repository"
                    }
                ],
                "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', parameters('serverfarms_babu_ASP_name'))]",
                "reserved": false,
                "siteConfig": null,
                "scmSiteAlsoStopped": false,
                "hostingEnvironmentProfile": null,
                "clientAffinityEnabled": true,
                "clientCertEnabled": false,
                "hostNamesDisabled": false,
                "containerSize": 0,
                "dailyMemoryTimeQuota": 0,
                "cloningInfo": null,
                "httpsOnly": false
            },
            "dependsOn": [
                "[resourceId('Microsoft.Web/serverfarms', parameters('serverfarms_babu_ASP_name'))]"
            ]
        },
        {
            "type": "Microsoft.Web/sites/config",
            "name": "[concat(parameters('sites_babuapp_name'), '/', parameters('config_web_name'))]",
            "apiVersion": "2016-08-01",
            "location": "East US",
            "scale": null,
            "properties": {
                "numberOfWorkers": 1,
                "defaultDocuments": [
                    "Default.htm",
                    "Default.html",
                    "Default.asp",
                    "index.htm",
                    "index.html",
                    "iisstart.htm",
                    "default.aspx",
                    "index.php",
                    "hostingstart.html"
                ],
                "netFrameworkVersion": "v4.0",
                "phpVersion": "5.6",
                "pythonVersion": "",
                "nodeVersion": "",
                "linuxFxVersion": "",
                "windowsFxVersion": null,
                "requestTracingEnabled": false,
                "remoteDebuggingEnabled": false,
                "remoteDebuggingVersion": null,
                "httpLoggingEnabled": false,
                "logsDirectorySizeLimit": 35,
                "detailedErrorLoggingEnabled": false,
                "publishingUsername": "$babuapp",
                "publishingPassword": null,
                "appSettings": { "Appsetting": "Appsetting"}
                "azureStorageAccounts": {},
                "metadata": null,
                "connectionStrings": null,
                "machineKey": null,
                "handlerMappings": null,
                "documentRoot": null,
                "scmType": "None",
                "use32BitWorkerProcess": true,
                "webSocketsEnabled": false,
                "alwaysOn": false,
                "javaVersion": null,
                "javaContainer": null,
                "javaContainerVersion": null,
                "appCommandLine": "",
                "managedPipelineMode": "Integrated",
                "virtualApplications": [
                    {
                        "virtualPath": "/",
                        "physicalPath": "site\\wwwroot",
                        "preloadEnabled": false,
                        "virtualDirectories": null
                    }
                ],
                "winAuthAdminState": 0,
                "winAuthTenantState": 0,
                "customAppPoolIdentityAdminState": false,
                "customAppPoolIdentityTenantState": false,
                "runtimeADUser": null,
                "runtimeADUserPassword": null,
                "loadBalancing": "LeastRequests",
                "routingRules": [],
                "experiments": {
                    "rampUpRules": []
                },
                "limits": null,
                "autoHealEnabled": false,
                "autoHealRules": null,
                "tracingOptions": null,
                "vnetName": "",
                "siteAuthEnabled": false,
                "siteAuthSettings": {
                    "enabled": null,
                    "unauthenticatedClientAction": null,
                    "tokenStoreEnabled": null,
                    "allowedExternalRedirectUrls": null,
                    "defaultProvider": null,
                    "clientId": null,
                    "clientSecret": null,
                    "clientSecretCertificateThumbprint": null,
                    "issuer": null,
                    "allowedAudiences": null,
                    "additionalLoginParams": null,
                    "isAadAutoProvisioned": false,
                    "googleClientId": null,
                    "googleClientSecret": null,
                    "googleOAuthScopes": null,
                    "facebookAppId": null,
                    "facebookAppSecret": null,
                    "facebookOAuthScopes": null,
                    "twitterConsumerKey": null,
                    "twitterConsumerSecret": null,
                    "microsoftAccountClientId": null,
                    "microsoftAccountClientSecret": null,
                    "microsoftAccountOAuthScopes": null
                },
                "cors": null,
                "push": null,
                "apiDefinition": null,
                "autoSwapSlotName": null,
                "localMySqlEnabled": false,
                "managedServiceIdentityId": null,
                "xManagedServiceIdentityId": null,
                "ipSecurityRestrictions": null,
                "scmIpSecurityRestrictions": null,
                "scmIpSecurityRestrictionsUseMain": null,
                "http20Enabled": false,
                "minTlsVersion": "1.2",
                "ftpsState": "AllAllowed",
                "reservedInstanceCount": 0
            },
            "dependsOn": [
                "[resourceId('Microsoft.Web/sites', parameters('sites_babuapp_name'))]"
            ]
        },
        {
            "type": "Microsoft.Web/sites/hostNameBindings",
            "name": "[concat(parameters('sites_babuapp_name'), '/', parameters('hostNameBindings_babuapp.azurewebsites.net_name'))]",
            "apiVersion": "2016-08-01",
            "location": "East US",
            "scale": null,
            "properties": {
                "siteName": "babuapp",
                "domainId": null,
                "hostNameType": "Verified"
            },
            "dependsOn": [
                "[resourceId('Microsoft.Web/sites', parameters('sites_babuapp_name'))]"
            ]
        }
    ]
}