# Exchange documentation examples

The projects and files in this repository are examples to be published through the Exchange publishing services.

The documentation about Exchange publication has examples that use this code:

## Publishing Maven projects:

[Exchange Maven Facade](https://anypoint.mulesoft.com/exchange/portals/anypoint-platform/f1e97bc6-315a-4490-82a7-23abe036327a.anypoint-platform/exchange-maven-facade-api-http/)

## Publishing already packed files:

[Exchange Experience API](https://anypoint.mulesoft.com/exchange/portals/anypoint-platform/f1e97bc6-315a-4490-82a7-23abe036327a.anypoint-platform/exchange-experience-api/)

## Configure the groupId of the Anypoint Organization where you will be publishing assets

Execute the following command. Replace `<add-the-group-id-of-your-org-here>` with the organization ID where the assets will be published.

### MacOS
```
grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i "" 's/YOUR_GROUP_ID/<add-the-group-id-of-your-org-here>/g'
```

For example:
```
grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i "" 's/YOUR_GROUP_ID/18f84756-2795-4d58-871a-7ece326ac1f3/g'
```

### Linux
```
grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i 's/YOUR_GROUP_ID/<add-the-group-id-of-your-org-here>/g'
``` 

For example:
```
grep --exclude="*.md" -r -l 'YOUR_GROUP_ID' * | xargs sed -i 's/YOUR_GROUP_ID/18f84756-2795-4d58-871a-7ece326ac1f3/g'
``` 
