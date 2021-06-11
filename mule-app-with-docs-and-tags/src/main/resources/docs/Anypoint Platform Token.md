Before executing any of the example requests, get an access token for an Anypoint Platform user.

You can send HTTP commands with cURL, Postman, or another application. This example uses cURL.

Replace `ANYPOINT_USERNAME` with your Anypoint Platform user account name. Replace `ANYPOINT_PASSWORD` with your password.

```
curl --location --request POST 'https://anypoint.mulesoft.com/accounts/login' \
     --header 'Content-Type: application/json' \
     --header 'Accept: application/json' \
     --data-raw '{
        "username":"ANYPOINT_USERNAME",
        "password":"ANYPOINT_PASSWORD"
     }' | jq -r ".access_token"
```

Use this token in your API calls. In each cURL example, replace `ANYPOINT_TOKEN` with the token.
