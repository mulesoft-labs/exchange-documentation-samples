Exchange enables users to request access to REST APIs and API groups, create new applications, and manage service-level agreement (SLA) tiers.

Following in this article, there are some request examples that can be executed. 

Before executing the examples, read the `Anypoint Platform Token` section to know how to obtain the token to be used in the examples. This should be replaced for the value `ANYPOINT_TOKEN` in each curl example.

The examples have been made by cURL, but optionally, instead of sending HTTP commands with cURL, you can use Postman or another application.

# How to request API access

Some URL parameters that have to be replaced in the examples are:

 - `:groupId`: Group ID of the asset
 - `:assetId`: Asset ID of the asset
 - `:version`: Version of the asset
 - `:versionGroup`: Version group of the asset


The steps to Request API Access are:

### 1. First, a managed instance from the selected asset should be selected.

_Notice that the instance should NOT be deprecated because it won’t be possible to create a new contract._

To do that, the asset should be retrieved from the Experience API to extract from there the needed instance:

#### 1.1) For a rest API asset:
 
```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/versionGroups/:versionGroup/instances' \
  -H 'Authorization: Bearer ANYPOINT_TOKEN'
```
 
The response is similar to this:
 
```
[{
  "id": "956703",
  "versionGroup": "v1",
  "name": "v1:956703",
  "environmentName": "Sandbox",
  "environmentId": "fa07c403-3655-4e6b-8ea1-4888cc2775c1",
  "type": "managed",
  "productAPIVersion": "v1"
}]
```
 
Select the ID of an instance of “managed” type. In this example: `"956703"`
 
#### 1.2) For an API group asset:
 
```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/versionGroups/:versionGroup/apiGroupInstances' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN'
```
 
The response is similar to this:
 
```
[{
  "id": 956703,
  "productVersion": "v1",
  "environmentId": "fa07c403-3655-4e6b-8ea1-4888cc2775c1",
  "environmentType": "sandbox",
  "providerId": null,
  "apiGroupId": 23948,
  "apiGroupVersionId": 22686,
  "apiGroupName": "great-group",
  "name": "v1:24608",
  "isPublic": false,
  ...
  "apiInstances": [{
    "id": 891105,
    "apiId": 342424,
    "version": "1.0.0",
    "minorVersion": "1.0",
    "name": "v1:891105",
    "productVersion": "v1",
    "environmentId": "fa07c403-3655-4e6b-8ea1-4888cc2775c1",
    "stage": "release",
    "environmentName": "Sandbox"
  }, ...],
}]
 
```
 
Select the ID. In this example: `956703`


### 2. Select an existing Application or create a new one.

#### 2.1. To create a new application:

_Note: this procedure is valid only for non federated organizations_

Use the instance ID selected in the previous steps (`956703`) as the URI parameter `apiInstanceId`.


Creating an application requires the following fields, specified after the `-d` flag.

 - `name`: Name of the application
 - `description`: Description of the application
 - `url`: URL of the application
 - `redirectUri`: An array of redirect Uris
 - `grantTypes`: An array of Grant Types (example: "password", "implicit", "client\_credentials", "authorization\_code", "refresh\_token")
 - `apiEndpoints`: To automatically register the redirect URIs (it could take the values “true” or “false”)

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/applications?apiInstanceId=956703' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '{"name":"new-application","description":"description","url":"http://app-url.com","redirectUri":["http://oauth-2.0-app-url.com"],"grantTypes":[],"apiEndpoints":false}'
```

A response like this will be retrieved.

The ID of the created application should be selected to be used in the next step. In this example it is: `"273626"`

```
{
  "id":273626,
  "redirectUri":["http://oauth-2.0-app-url.com"],
  "name":"new-application",
  "description":"description",
  "url":"http://app-url.com",
  "clientId":"2b9adc811b4842bfa614949ed2aa7b8c",
  "clientSecret":"561C251D4C724E5ABE15D7c76d6C3E63",
  "masterOrganizationId":"5a673b98-92f4-459d-b950-daeed7a8165d",
  "grantTypes":[],
  "clientProvider":{"providerId":null}
}
```

Select the ID of the created application. In this example: `273626`


#### 2.2. To select an existing application

Use this example to get a list of the applications that a user created on a specific *master* organization. Replace the `masterOrganizationId` URI parameter:

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/organizations/:masterOrganizationId/applications' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN'
```

A response like this will be retrieved.

```
[{
  "id":273626,
  "name":"new application for my rest-api",
  "description":null,
  "url":null,
  "masterOrganizationId":"5a673b98-92f4-459d-b950-daeed7a8165d",
  "clientProvider":{
    "providerId":null
  }
}, {
  ...
}]
```

Select the ID of an application. In this example: `273626`


### 3. Get an SLA Tiers of the selected managed instance.

If the API or AAPI Group instance has Tiers, the user _must_ select one SLA Tier. If the API instance has not Tiers, skip this step.

The SLA Tiers can be created in API Manager. For more information, visit [https://docs.mulesoft.com/api-manager/2.x/api-sla-tiers](https://docs.mulesoft.com/api-manager/2.x/api-sla-tiers).

Selecting an SLA tier for an API instance uses different steps than selecting an SLA tier for an API group instance.


#### 3.1) Select an SLA tier of an API instance
 
Replace `:instanceId` with the instance ID selected in the previous steps (`956703`).
 
```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/versionGroups/:versionGroup/instances/:instanceId/tiers' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN'
```
 
The response is similar to this.
 
```
[{
  "id":171457,
  "name":"new SLA",
  "description":null,
  "limits":[{"timePeriodInMilliseconds":10000,"maximumRequests":1000}],
  "status":"ACTIVE",
  "autoApprove":true,
  "applicationCount":0,
  "apiId":956703
}, {
  ....
}]
```
 
Select the ID of an SLA tier. In this example: `171457`


#### 3.2) Select an SLA tier of an API group instance
 
Replace `:apiGroupInstanceId` with the instance ID selected in the previous steps (`956703`). Replace `:environmentId` with the environment ID from the previous steps (`fa07c403-3655-4e6b-8ea1-4888cc2775c1`).
 
```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/versionGroups/:versionGroup/environments/:environmentId/apiGroupInstances/:apiGroupInstanceId/tiers' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN'
```
 
The response is similar to this.
 
```
[{
  "id":171457,
  "apiGroupInstanceId":24608,
  "name":"api-group-sla",
  "description":null,
  "status":"ACTIVE",
  "autoApprove":false,
  "applicationCount":0,
  "limitsByApi":[...]
}, {
 …
}]
```
 
Select the ID of an SLA tier. In this example: `171457`



### 4. Request access to creating a new contract.

Replace `:applicationId` with the application ID from the previous steps (`273626`), following the whole example.

The `requestedTierId` is the SLA tier ID from the previous steps (`171457`).

The fields required to request access that should be replaced in this example are (after the `-d` tag):

 - `apiId`: The managed instance ID, which is used only for assets. In this example: `956703`.
 - `apiGroupInstanceId`: The managed instance ID, which is only used for API group assets. In this example: `956703`.
 - `instanceType`: The instance type, `api` or `api-group`.
 - `environmentId`: The application ID.
 - `requestedTierId`: The SLA tier ID, if one has been generated. If no SLA tier ID has been generated, omit this field.
 - `acceptedTerms`: `true` to indicate the terms have been accepted.
 - `organizationId`: organizationId of the API asset.
 - `groupId`: groupId of the API asset.
 - `assetId`: assetId of the API asset.
 - `version`: version of the API asset.
 - `versionGroup`: versionGroup of the API asset.

_IMPORTANT: For API groups, replace the parameter `apiId` with `apiGroupInstanceId` and change the `instanceType` value from `api` to `api-group`._

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/applications/:applicationId/contracts' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '{"apiId":956703,"instanceType":"api","requestedTierId":171457,"acceptedTerms":true,"organizationId":"5a673b98-92f4-459d-b950-daeed7a8165d","groupId":"5a673b98-92f4-459d-b950-daeed7a8165d","assetId":"connected-raml","version":"1.0.0","versionGroup":"v1"}'
```

A response like this should be retrieved

```
{
  "id":379427,
  "status":"APPROVED",
  "applicationId":273463,
  "clientId":"a90a084a42fc455f8cd493fce5027dff",
  "clientSecret":"cCab4Ed6278841469982c41f07bf9467",
  "tier":{
    "id":171457,
    "name":"new SLA",
    "description":null,
    "limits":[{
      "timePeriodInMilliseconds":10000,
      "maximumRequests":1000
    }],
    "status":"ACTIVE",
    "autoApprove":true
  },
  "api":{
    "id":891105,
    "version":"1.0.0",
    "minorVersion":"1.0",
    "organizationId":"5a673b98-92f4-459d-b950-daeed7a8165d",
    "deprecated":false,
    "groupId":"5a673b98-92f4-459d-b950-daeed7a8165d",
    "assetId":"asset-id",
    "assetVersion":"1.0.0",
    "productVersion":"v1",
    "environmentId":"fa07c403-3655-4e6b-8ea1-4888cc2775c1",
    "fullname":"asset-id - Sandbox - undefined",
    "assetName":"asset-id",
    "environmentName":"Sandbox"
  }
}
```


To learn more about Client Applications and Request Access:

[https://docs.mulesoft.com/api-manager/2.x/api-contracts-landing-page](https://docs.mulesoft.com/api-manager/2.x/api-contracts-landing-page)

[https://docs.mulesoft.com/exchange/to-request-access](https://docs.mulesoft.com/exchange/to-request-access)

[https://docs.mulesoft.com/api-manager/2.x/api-groups-landing-page](https://docs.mulesoft.com/api-manager/2.x/api-groups-landing-page)
