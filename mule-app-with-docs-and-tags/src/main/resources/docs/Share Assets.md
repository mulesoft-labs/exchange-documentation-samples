## Identity

Exchange API version 2 introduces the concept of an identity, which is an entity that can have a role with certain permissions over an asset. An entity can be a user or an organization.

With Exchange API version 2, an asset can be shared with an identity such as a user, a master organization, or an external organization.

If an asset is shared with an organization, then permissions are granted to all users that belong to the organization.

The roles are:

 - `viewer`: Allows a user to see the asset but not do any type of editing on it
 - `contributor`: Allows editing the asset's metadata, editing the asset’s portal, and creating new versions of the asset
 - `admin`: Allows other types of operations, such as sharing with other users or deprecating versions

The following examples demonstrate sharing assets with users and organizations.

Before executing the examples, obtain a token with the instructions in the `Anypoint Platform Token` section. In each example, replace `ANYPOINT_TOKEN` with your token.
 
You can send HTTP commands with cURL, Postman, or another application. These examples use cURL.

In all examples, replace the URL parameters `:groupId` and `:assetId` with the asset’s information.


## Get the asset’s current identities

This example gets a list of the identities that have permissions for an asset:

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/identities' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN'
```

The response is similar to this:

```
[
   {
      "id" : "5a673b98-92f4-459d-b950-daeed7a8165d",
      "roleId" : "0c0d6604-8732-474f-9a2e-bff5ef472a86"
      "createdAt" : "2020-09-17T14:49:30.283451+00:00",
      "name" : "Mythical Ventures",
      "role" : "viewer",
      "domain" : "mythical-ventures",
      "identityType" : "organization",
   },
   {
      "id" : "99685226-c802-4fc6-8c7d-d159737784bb",
      "roleId" : "03bf5aff-a0e2-4e1a-8377-b7e4f67750df",
      "createdAt" : "2020-09-17T14:36:48.639736",
      "email" : "john-smith@gmail.com",
      "username" : "john-smith",
      "lastName" : "Smith",
      "role" : "admin",
      "firstName" : "John",
      "organization" : {
         "id" : "5a673b98-92f4-459d-b950-daeed7a8165d",
         "isMulesoftOrganization" : false,
         "name" : "Mythical Ventures"
      },
      "identityType" : "user"
   }
]
```

A user `john-smith` has the `admin` role for this asset and an organization 'mythical-ventures` has the `viewer` role for this asset.


## Search identities

Your permissions enable you to share an asset with certain entities. This request lists those entities.

Replace the `search` query parameter with the search term to search identities. Replace `:organizationId` with the organization ID of the asset that will be shared.

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/identities?offset=0&limit=100&search=Mythical' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN'
```

The response is similar to this:

```
[{
  "id":"f0c9b011-980e-4928-9430-e60e3a97c043",
  "identityType":"externalOrganization",
  "name":"Coliseum Inc","domain":"coliseum-inc"
}, {
  "id":"5a673b98-92f4-459d-b950-daeed7a8165d",
  "identityType":"organization",
  "name":"Mythical Ventures",
  "domain":"mythical-ventures"
},{
  "id":"99685226-c802-4fc6-8c7d-d159737784bb",
  "identityType":"user",
  "username":"john-smith",
  "firstName":"John",
  "lastName":"Smith",
  "email":"john.smith@gmail.com",
  "organization":{
    "id":"5a673b98-92f4-459d-b950-daeed7a8165d",
    "name":"Mythical Ventures",
    "isMulesoftOrganization":false
  }
}]
```

The response shows three identities: A user (`john-smith`), an organization (`Mythical Ventures`), and an external organization (`Coliseum Inc`).

Sharing an asset with an identity requires the identity `id`. For an organization or external organization, the `id` represents the organizationId.


## Share an asset to an identity

In a request to add or remove identities, the body content is an array with the identities to add or delete. Each identity object in the array requires this information:

 - `identityId`: The `id` of the identity

For organizations and external organizations, this is the organizationId.
`role

 - `: The role to be assigned to share the asset: `viewer`, `contributor`, or `admin`
 - `identityType`: The type of the identity: `user`, `organization` or `externalOrganization`
 - `organization

Id`: The organizationId of the organization or user

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/identities' \
  -X 'PUT' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '{"added":[{"identityId":"99685226-c802-4fc6-8c7d-d159737784bb","role":"admin","identityType":"user","organizationId":"5a673b98-92f4-459d-b950-daeed7a8165d"}],"deleted":[{"identityId":"5a673b98-92f4-459d-b950-daeed7a8165d","role":"contributor","identityType":"organization","organizationId":"5a673b98-92f4-459d-b950-daeed7a8165d"}]}'
```

The `admin` role for this asset is added to identity id `99685226-c802-4fc6-8c7d-d159737784bb` (`john-smith`), and the `contributor` role for this asset is removed from the organization `5a673b98-92f4-459d-b950-daeed7a8165d` (`Mythical Ventures`).
