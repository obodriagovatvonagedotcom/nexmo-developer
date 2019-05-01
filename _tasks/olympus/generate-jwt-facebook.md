---
title: Generate a JWT for Facebook validation
description: Generate a JWT using the Nexmo CLI and use it to validate the linking of your Fac ebook Page to your Nexmo account.
---

# Generate a JWT

You will need to generate a JWT to validate the linking of your Facebook Page to your Nexmo account. You can skip this step if you have already linked your Facebook Page to your Nexmo account.

In the following command make sure you paste in the Application ID of the Nexmo application you just created:

``` shell
JWT="$(nexmo jwt:generate ./private.key application_id=YOUR_APP_ID)"
```

> **NOTE:** The default expiry time for the JWT is 15 minutes.

Type the following command to echo your JWT:

``` shell
echo $JWT
```

Copy the JWT text to the clipboard. You will use it later to validate the linking of your Facebook Page to your Nexmo account.
