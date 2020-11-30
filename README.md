# Exchange documentation examples

The projects and files in this repository are examples that may be published to your organization's private Exchange.

The documentation about Exchange publication APIs are using these examples here:
* [Exchange Maven Facade](https://anypoint.mulesoft.com/exchange/portals/anypoint-platform/f1e97bc6-315a-4490-82a7-23abe036327a.anypoint-platform/exchange-maven-facade-api-http/)
* [Exchange API](https://anypoint.mulesoft.com/exchange/portals/anypoint-platform/f1e97bc6-315a-4490-82a7-23abe036327a.anypoint-platform/exchange-experience-api/)

## Available examples:

* [Mule Application](mule-app/README.md)
* [Mule Application Example](example/README.md)
* [Mule Application Template](template/README.md)
* [Mule Policy](policy/README.md)
* [Custom Asset](custom-asset/README.md)
* [Custom Library](custom-lib/README.md)

## Getting started

Configure the groupId of the Anypoint Organization where you will be publishing assets. Execute the following command. Replace `<add-the-group-id-of-your-org-here>` with the organization ID where the assets will be published.

### MacOS
```shell
$ grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i "" 's/YOUR_GROUP_ID/<add-the-group-id-of-your-org-here>/g'
```

For example:
```shell
$ grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i "" 's/YOUR_GROUP_ID/18f84756-2795-4d58-871a-7ece326ac1f3/g'
```

### Linux
```shell
$ grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i 's/YOUR_GROUP_ID/<add-the-group-id-of-your-org-here>/g'
``` 

For example:
```shell
$ grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i 's/YOUR_GROUP_ID/18f84756-2795-4d58-871a-7ece326ac1f3/g'
``` 

## Get an access token for an Anypoint Platform user.
Replace ANYPOINT_USERNAME with your Anypoint Platform user account name. Replace ANYPOINT_PASSWORD with your password.

Execute:
```
curl --location --request POST 'https://anypoint.mulesoft.com/accounts/login' \
     --header 'Content-Type: application/json' \
     --header 'Accept: application/json' \
     --data-raw '{
        "username":"ANYPOINT_USERNAME",
        "password":"ANYPOINT_PASSWORD"
     }' | jq -r ".access_token"
```