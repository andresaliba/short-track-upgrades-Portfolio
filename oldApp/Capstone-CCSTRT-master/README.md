# Capstone-CCSTRT
Colchester Short Track Race Timer

# About the app
This app uses SEAN stack (Sequelize, Express, Angular, Node). To get this app up and running, you must have a MySQL DB running called `ccstrt`. The DBs are in the project for you to import, those that should have rows in them are `tbl_users` and `tbl_paypal`.

# Local

To run the app locally, you need to do a `npm run server` and a `npm run client`. As mentioned above, you will need the appropriate databases. 

# Production

## Building (MEAN Stack Bitnami AWS Lightsail Dev Site)

To get this app to work without running a command for Angular, you will need to build you project. Assuming you are in the root of the Angular project (i.e. `htdocs/short-track`), you can do the following steps below.

1. `npm build run --prod` (--prod minifies js files and such)
2. `cp dist/* ./.. -R`

The first command simply builds the app. We then copy the contents of the dist folder into htdocs, where the app is being served up.

## Building (Production)

Since the app serves up from `short-track/dist`, all you have to do is run `npm run build --prod`!!

## Server Service

Matt made the Server.js as a service, so that you won't have to run `npm run server` each time! The command to run it is `sudo systemctl start shortstacksrv`. You can subsitute that start for `restart`, `stop`, and `status` to run their respective commands :-). If you come across any errors, it is best to run the `npm run server` to debug.

## Databases

Please make sure to import the tables that should have information already, `tbl_users` and `tbl_paypal`. You will not be able to access the back-end applicaiton otherwise.

# Notes

## What could have been done better?

For the future developers of this project ;)

### Redundancy

You will notice there is lots of redundancy when it comes to requests in the `data.service.ts`. There is a method I made closer to the end of development, `getPromiseReq`, which just has you pass in the route. I had intended to change all the `GET` requests over to this for less code, but had no time. I wanted to do this as well for all of the other requests.

Is there an easier way to do this without promises? That would be great! :) 

### User Experience

I think there should be messages displayed after a user does a certain action. Bootstrap has styling for this.

Automatically sign in user after they have signed up?



- Ethan

