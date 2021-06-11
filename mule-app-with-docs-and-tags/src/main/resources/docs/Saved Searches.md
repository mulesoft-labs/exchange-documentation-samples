A saved search is an asset search that can be saved to help users find some assets easier.
 
The saved searches can be personal or by business group. Personal saved searches can only be used by the user that created them, while business group saved searches can be accessed by all users that have access to the business group.
 
Saved searches consist of the following properties:

 - `name`: The name of the query to identify it
 - `categories`: A list of categories used to filter the assets that have some of these categories. They have the shape as `categoryKey:categoryValue`, where the `categoryKey` is the key to the category, and `categoryValue` is the value of the category. Example: `"categories": ["someKey:someValue"]`
 - `organizationIds`: A list of organizations used to filter the assets by belonging to these organizations
 - `search`: The search term
 - `tags`: A list of labels used to filter the assets that have some of these labels. They have the shape as `”tag1”,”tag2”`. Example: `"tags": ["tag1”,”tag2"]`
 - `types`: A list of labels used to filter the assets that have some of these types. They have the

 shape of `"rest-api", “http-api”`. Example: `"types": ["rest-api", “http-api”]`
 
The only parameters that are required are the `name`. The rest can be omitted.
 
_Note: take into account that the properties `categories`, `tags` and `organizationIds` are used only in the search that uses ANG system._
 
_Note: Only Exchange administrators can save searches for a business group._
 
 
Following there are exposed some examples about how to create saved searches
 
Before executing the examples, read the `Anypoint Platform Token` section to know how to obtain the token to be used in the examples. This should be replaced for the value `ANYPOINT_TOKEN` in each curl example.
 
The examples have been made by cURL, but optionally, instead of sending HTTP commands with cURL, you can use Postman or another application.
 
 
## How to create a personal saved search
 
Here is an example of how to create a personal saved search. All the fields should be replaced by the ones defined before (after the -d parameter). Remember to replace the `:organizationId` URL parameter too.
 
 
```
curl -X POST https://anypoint.mulesoft.com/exchange/api/v2/users/me/queries \
     -H 'Authorization: bearer ANYPOINT_TOKEN' \
     -H 'Content-Type: application/json' \
     -d '{ "categories": ["categoryKey:value"], "name": "searchName", "organizationIds": ["67ac7cde-c02c-457f-b826-da2474e63d5a"], "search": "search term", "tags": ["some tag"], "types": ["rest-api"] }'
```
 
## How to create an organization saved search
 
Here is an example of how to create an organization saved search. All the fields should be replaced by the ones defined before (after the -d parameter). Remember to replace the `:organizationId` URL parameter too.
 
```
curl -X POST https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/queries \
     -H 'Authorization: bearer ANYPOINT_TOKEN' \
     -H 'Content-Type: application/json' \
     -d '{ "categories": ["categoryKey:value"], "name": "searchName", "organizationIds": ["67ac7cde-c02c-457f-b826-da2474e63d5a"], "search": "search term", "tags": ["tag1","tag2"], "types": ["rest-api"] }'
```
