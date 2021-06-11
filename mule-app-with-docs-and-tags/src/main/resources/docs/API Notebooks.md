You can use a notebook to test all the Exchange API v2 endpoints. Use a client to make requests and see example responses. Explore the API and learn how it works and how to use it.

This client is an example provided by Exchange that does not require credentials. If you choose to use your credentials, use client authentication.

## 1. Create a Client for Exchange API v2

Create a notebook client where you can execute sample code to test and explore the API:

```notebook
API.createClient('client', 'f1e97bc6-315a-4490-82a7-23abe036327a.anypoint-platform', 'exchange-experience-api', '2.0.0');
```

## 2. Optionally Authenticate the Client

Note: This step is optional. Some endpoints do not require authentication.

The Exchange API v2 uses OAuth 2.0 to enable secure access to the resource.

Obtain an access token:

```notebook
API.authenticate(client, 'oauth_2_0', { clientId: 'exchange' })
```

## 3. Invoke the API

This scenario shows the most basic flow, which obtains an asset response from the API.

Then the name of the asset is obtained from the response.

Then another code snippet obtains the labels of the asset.

Use your OAuth token to invoke the API.

```notebook
asset = client.assets.groupId('com.mulesoft.connectors').assetId('mule-salesforce-connector').asset.get()

asset.body.name
```

```notebook
asset.body.labels
```

## 4. Continue using the API

To continue using the API, create new API Notebooks like this, where new methods can be created or executed.

For example, this notebook makes a request to search assets by the search term `Exchange` and the type `rest-api` in the domain of `anypoint-platform`:

```notebook
client.portals.organizationDomain('anypoint-platform').assets.search.get({search: 'Exchange', type: 'rest-api'})
```
