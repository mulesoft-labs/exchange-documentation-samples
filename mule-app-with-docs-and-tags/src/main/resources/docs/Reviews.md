Reviews for an asset can be created in order to give a review and rate the asset.
 
Following there are exposed some examples about how to create a new
 
Before executing the examples, read the `Anypoint Platform Token` section to know how to obtain the token to be used in the examples. This should be replaced for the value `ANYPOINT_TOKEN` in each curl example.
 
The examples have been made by cURL, but optionally, instead of sending HTTP commands with cURL, you can use Postman or another application.
 
 
## How to create a review for an asset
 
Here is an example of how to create a review for an asset.
These URL parameters should be replaced
  `:organizationId`: Organization ID of the asset
  `:groupId`: Group ID of the asset
  `:assetId`: Asset ID of the asset
  `:version`: Version of the asset.
 
Each review has the following content properties. They should be modified after the `-d` tag:
  `title`: Title of the review
  `text`: The text content of the review
  `rating`: Rating of the review. It is an integer between 1-5
 
_Note: only one review can be done by a minor version and user. That means, if a user did a review for the version `1.0.2`, then the review will apply for the minor of the asset `1.0` and no other review can be done for another version of the same minor (`1.0.3` for example)_
 
 
```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/reviews' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '{"rating":5,"title":"Title","text":"review content"}'
```
 
A response like this will be retrieved:
 
```
  {
    "id":"6ae60a6e-3785-4fbe-8bbe-f44dc46c9138",
    "userId":"2ade6aee-ae1c-44f5-badc-68b6cf2f9345",
    "organizationId":":organizationId",
    "groupId":":groupId",
    "assetId":":assetId",
    "versionId":":version",
    "text":"review content",
    "title":"Title",
    "rating":4
  }
```
 
Where the `id` of the response will be used as `reviewId` to edit and delete reviews.
 
 
## How to edit a created review of an asset
 
To edit a review, the fields explained in how to create a review should be specified (rating, title or text). They should be modified after the `-d` tag. 
Also, the `reviewId` of the created review should be replaced in the URI.
 
``` 
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/reviews/:reviewId' \
  -X 'PATCH' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '{"rating":2,"title":"new title","text":"new content"}'
```

## How to delete a created review of an asset
 
To delete a review, the `reviewId` of the created review should be replaced in the URI.
 
``` 
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version/reviews/:reviewId' \
  -X 'DELETE' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN'
```
