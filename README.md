# README

As of 31/8/2020
The master branch serves as stripped down multi-tennant application with the following features:
* Multi-tennant application whereas tenants are separated by an accounts table. 
* Account specific information should be created under the accounts/ controller and views
* Accounts can invite users to be part of their accounts
* Users can belong to many different accounts
* Stripe subscriptions integration. Scoped to accounts, with an account owner as the main contact.

Additional branches are created with additional functionality and/or design. And are likely ahead of the master branch.

IMPORTANT
In order to get stripe working correctly:
1) Open up a stripe account, and issue development API keys
2) run the following command: ```EDITOR="code --wait" bin/rails credentials:edit --environment=development```
Place the keys in the appropriate location
```
stripe:
  public_key: 
  private_key: 
  signing_secret:

# You can place a signing_secret here for stripe webhooks, but I leave this blank. Instead I issue a signing_secret and run it in my localhost on start. See step 3 below with the command to issue the key, and step 4 below to run it on boot
```
  
3) In terminal, generate a signin_secret by using the following command: ```stripe listen --forward-to lvh.me:5000/webhooks/stripe```
> Note: we are using the localhost location at lvh.me:5000 because we are running a multi-tennant application. We need to allow
> for subdomain.url.com or in this case subdomain.lvh.me:5000 in order for this multi-tenant application to work correctly.
4) In terminal, to get the local server working, use the following command: ```STRIPE_SIGNING_SECRET=your_secret_from_part_3_here foreman start```

--- END ---