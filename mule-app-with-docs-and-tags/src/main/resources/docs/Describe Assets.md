Exchange assets can be described with [tags][1], [categories][2], or [custom fields][3].

Asset contributors can add tags to assets.

Exchange administrators and organization owners can create categories to group assets, and categories can be used in asset searches.

Exchange administrators and organization owners can create custom fields to extend the Exchange asset metadata model and add custom data to any type of asset.

Before executing the examples, obtain a token with the instructions in the `Anypoint Platform Token` section. In each example, replace `ANYPOINT_TOKEN` with your token.

You can send HTTP commands with cURL, Postman, or another application. These examples use cURL.

The URL parameters that have to been replaced are the following:
  `:organizationId`: Organization of the asset
  `:groupId`: Group ID of the asset
  `:assetId`: Asset ID of the asset
  `:version`: Version of the asset


## Tags

This example shows how to insert tags for an asset. To do that, replace the list of tags specified after the `-d` flag. In this example, these are `rest-api` and `documentation`.

IMPORTANT: This request works as an override, that means, the tags that are sent in this request will be the only tags of the asset.

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags' \
  -X 'PUT' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '[{"value":"rest-api"}, {"value":"documentation"}]'
```


## Custom Fields

### Supported Types
Exchange supports custom fields of the types enum, number, date, text, list of numbers, and list of strings.

### Enum
This example shows how to create a custom field of the type `enum`, a list of enumerated values, with the name *SubType* and the possible values *OAS* and *RAML*. Create your own custom field by setting the organization ID and changing the data parameters after the `-d` flag.

```
curl -X POST \
  https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json' \
  -d '{
	"dataType": "enum",
	"acceptedValues": ["OAS","RAML"],
	"displayName": "SubType",
	"tagKey": "subType"
  }'
```

This example shows how to add this field to any asset in an organization. Add the field to your own asset by setting the organization ID, group ID, asset ID, and version in the URL, changing the tag key subType to your tag key, and changing the data parameters after the `-d` flag.

```
curl -X PUT \ 
https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags/fields/subType \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
	"tagValue": ["OAS"]
  }'
```

### Number
This example shows how to create a custom field of the type `number` with the name Rating. Create your own custom field by setting the organization ID and changing the data parameters after the `-d` flag.

```
curl -X POST \
  https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json' \
  -d '{
	"dataType": "number",
	"displayName": "Rating",
	"tagKey": "rating"
  }'
```

This example shows how to add this field to any asset in an organization. Add the field to your own asset by setting the organization ID, group ID, asset ID, and version in the URL, changing the tag key rating to your tag key, and changing the data parameters after the `-d` flag.

```
curl -X PUT \ 
https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags/fields/rating \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
	"tagValue": 5
  }'
```

### Date
This example shows how to create a custom field of the type `date` with the name DueDate. Create your own custom field by setting the organization ID and changing the data parameters after the `-d` flag.

```
curl -X POST \
  https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json' \
  -d '{
	"dataType": "date",
	"displayName": "DueDate",
	"tagKey": "dueDate"
  }'
```

This example shows how to add this field to any asset in an organization. Add the field to your own asset by setting the organization ID, group ID, asset ID, and version in the URL, changing the tag key dueDate to your tag key, and changing the data parameters after the `-d` flag.

```
curl -X PUT \
https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags/fields/dueDate \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
	"tagValue": "2020-01-01T20:00:00.000Z"
}'
```

### Text
This example shows how to create a custom field of the type `text` with the name email. Create your own custom field by setting the organization ID and changing the data parameters after the `-d` flag.

```
curl -X POST \
  https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json' \
  -d '{
	"dataType": "text",
	"displayName": "Email",
	"tagKey": "email"
  }'
```

This example shows how to add this field to any asset in an organization. Add the field to your own asset by setting the organization ID, group ID, asset ID, and version in the URL, changing the tag key email to your tag key, and changing the data parameters after the `-d` flag.

```
curl -X PUT \ 
https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags/fields/email \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
	"tagValue": "john@doe.com"
  }'
```

### List of Numbers
This example shows how to create a custom field of the type `number-list` with the name SupportCases. Create your own custom field by setting the organization ID and changing the data parameters after the `-d` flag.

```
curl -X POST \
  https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json' \
  -d '{
	"dataType": "number-list",
	"displayName": "SupportCases",
	"tagKey": "supportCases"
  }'
```

This example shows how to add this field to any asset in an organization. Add the field to your own asset by setting the organization ID, group ID, asset ID, and version in the URL, changing the tag key supportCases to your tag key, and changing the data parameters after the `-d` flag.

```
curl -X PUT \ 
https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags/fields/supportCases \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
	"tagValue": [1010,2020,3030]
  }'
```

### List of Strings
This example shows how to create a custom field of the type `text-list` with the name Maintainers. Create your own custom field by setting the organization ID and changing the data parameters after the `-d` flag.

```
curl -X POST \
  https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json' \
  -d '{
	"dataType": "text-list",
	"displayName": "Maintainers",
	"tagKey": "maintainers"
  }'
```

This example shows how to add this field to any asset in an organization. Add the field to your own asset by setting the organization ID, group ID, asset ID, and version in the URL, changing the tag key maintainers to your tag key, and changing the data parameters after the `-d` flag.

```
curl -X PUT \ 
https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags/fields/maintainers \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
	"tagValue": ["John", "Alice", "Fred"]
  }'
```


### Restrict Asset Types
You can restrict a custom field so that it can only be added to certain types of assets. This example shows how to create a custom field that only applies to REST APIs. Create your own custom field by setting the organization ID and changing the data parameters after the `-d` flag.

```
curl -X POST \
  https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json' \
  -d '{
	"dataType": "enum",
	"acceptedValues": ["OAS","RAML"],
	"displayName": "SubType",
	"tagKey": "subType",
	"assetTypeRestrictions": ["rest-api"]
  }'
```

## Delete a Custom Field from an Asset Version

This example shows how to delete the custom field `subType` from a specific asset version. Delete a custom field by setting the organization ID, group ID, asset ID, and version, and changing the tag key `subType` to your tag key.

```
curl -X DELETE \
https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/tags/fields/:subType \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'Content-Type: application/json'
```

## Delete a Custom Field
This example shows how to delete the custom field `subType` from all assets in an organization. Delete a custom field by setting the organization ID and changing the tag key `subType` to your tag key.

```
curl -X DELETE \ 
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/fields/:subType \
  -H 'Authorization: bearer ANYPOINT_TOKEN’ \
  -H 'Content-Type: application/json'
```

## Categories

Creating and managing categories is the same as creating and managing custom fields, except that custom fields, use endpoint URLs with `/fields`, and categories use endpoint URLs with `/managed`.

Categories support the same subTypes.

  [1]: https://docs.mulesoft.com/exchange/to-describe-an-asset#add-asset-tags
  [2]: https://docs.mulesoft.com/exchange/to-manage-categories
  [3]: https://docs.mulesoft.com/exchange/to-manage-custom-fields