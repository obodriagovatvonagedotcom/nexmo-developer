---
title: Contact Center Use Case
products: 
    - client-sdk
    - converesation
    - voice/voice-api
description: How to build your own contact center application.
navigation_weight: 4
---

# Build Your Own Contact Center

## Overview

In these guides, you’ll learn how to build an application with contact center features.

Your contact center application has 2 agents: `Jane` and `Joe`, that use your app. The caller will use a phone, to call into the call center.

- A client app, for your contact center agents. They can make and receive calls, and much more. You’ll use [Nexmo Client SDK](_ducomentation/client-sdk/in-app-voice/overview) to create that app.

- A server-side application. To use the SDK you must have a backend application. Some methods, like managing users can only be done through the backend. Other things (like creating conversations for example) can be done by both client and server side. You’ll do that with [Conversation API.](_ducomentation/conversation/overview)

- For more advanced voice functionality, you’ll utilize Nexmo [Voice API](_ducomentation/voice/voice-api/overview) on your backend side application.

> **NOTE:** Under the hood, Nexmo Voice API uses Conversation API as well and allows you to use conversations for Voice capabilities in a smoother fashion. That means that all communication is done over a [Conversation](_documentation/conversation/conversation), that allows you to maintain the communication context over time, for any communication channel you will choose.

## Before You Begin

Make sure you have a Nexmo account. If you don't yet [sign up](https://dashboard.nexmo.com/) for free to get started!

Take a note of your *api key and secret*.

## Set Up Your Backend 

### 1. Choose Your Backend

Choose between 2 options:

- *Option 1:* Deploy one of our sample backend application, in your prefered language. They are all on available on GitHub so you can explore the code and deploy it yourself.

//TODO: add buttons

- *Option 2:* Integrate to your own backend application. Follow along and use the API directly to gain the same functionality.

### 2. Create Nexmo Application

Once you have created a Nexmo Account you will be able to create multiple [Nexmo Applications](conversation/concepts/application). A Nexmo Application can contain a unique set of [Users](_ducomentation/conversation/concepts/user) and [Conversations](conversation/concepts/conversation).

- If you deployed one of our demo backend applications on the previous step, you can create a new application yb entering a name and clicking *Create*.

- Otherwise, you can also use the [API directly](_ducomentation/concepts/guides/applications/curl#getting-started-with-applications)

### 3. Connect a Nexmo Number

In order to make and receive calls, you should have a [Nexmo Number](_documentation/numbers/overview) conected to your Nexmo application.

To set that up //TODO.....

### 4. Create Users

A [user](_documentation/conversation/concepts/user) can log in to the application, in order to use the Conversation API and Nexmo Client functionality, such as create a conversation, join a conversation, and so on.

To create users:

- If you are using the demo application, on the top menu select *Users* and then *New User*.

- Otherwise you can use the [Conversation API directly](https://developer.nexmo.com/api/conversation#createUser).

For the purpose of this guide, you should create two users, that will represent two agent on your contact center application. Create a user with the name `Jane` and another user with the name `Joe`.

### 5. Authenticate Users

The Nexmo Client SDKs use [JWTs](https://jwt.io/) for authentication when a user logs in. These JWTs are generated using the application ID and private key that is provided when a new application is created.

For security reasons, your client should not hold your private key. Therefore, the JWT must be provided by your backend.

Your backend should expose an endpoint that would allow the client to ask for a valid JWT per user. In a real life scenario, you would probably add some further authentication method such as a password. For this use case, sending your username will do.

- If you are using the demo backend application, it exposes a simple endpoint for that case. Click "SDK Integration" on the top menu. Under "User Authorization" you will find the endpoint, the request and response bodies.

- Otherwise, you can use [Nexmo Server Libraries](_documentation/conversation/concepts/jwt-acl#nexmo-client-libraries) or other method of your choice.

You may update your JWT and adjust the user's permissions, the expiration date and more. Read more about JWT and ACL [in this topic](_documentation/conversation/concepts/jwt-acl).


## Set Up Your Client

Nexmo Client SDK is currently supported in Javascript, iOS and Android.

To get started you can choose between 2 options:

- *Option 1:* Clone one of the sample apps:
    - Javascript
    - iOS: Swift or Objective-C
    - Android: Kotlin or Java
//TODO: add links

- *Option 2:* Integrate the SDK to your own client side application:
    1. [Add the SDK to your existing app](_documentation/client-sdk/setup/add-sdk-to-your-app)
    2. [Add in-app voice functionality](_documentation/client-sdk/in-app-voice/guides/start-and-receive-calls)


At this point you have a client side application and a backend application to support it.

You can run the client app on two different devices, and log in as the user `Jane` on one device and the user `Joe` on the other.


You are now ready to make and receive calls, and add other advanced voice functionality with Nexmo Voice API.

## Add Voice Functionality

For each Nexmo Application you can define an `answer_url`. That is a [webhook](_documentation/concepts/guides/webhooks) which Nexmo make a request to as soon as your Nexmo number is being called to.
The `answer_url` contains the actions that will execute throughout the call. It does that by defining those actions in a JSON it returns, which follows the [Nexmo Call Control Object (NCCO)](_documentation/voice/voice-api/ncco-reference).

Updating the NCCO that returns from your `answer_url` changes the call functionality and allows you to add rich capabilities to your contact center application.

### Recieve calls

For the basic use case, when a caller calls the contact center application, create a conversation and direct it to the agent Jane. 

use this ncco...

try it out.

### Make calls

this is how to allow the Jane to call from the app to a phone number.


try it out.

### Create an IVR

when the caller calls the contact center, they hear "thank you for calling my contact center. to talk to Jane press 1, to talk to ?Joe press 2."


try it out.

### Call Queue
User call an agent → stream music → connect to agent (according to backend trigger)

try it out.

### Call Whisper
Jane whispers to Joe

try it out.

### Hot Transfer
agent presses a button to transfer the call.

try it out.


## Wrap Up

Congratulations! you have created your contact center application!

You have:

- a client side application, that uses NexmoClient SDK
- a backend application to enable user management, authorization, defining an NCCO and more.
- an NCCO that defines the rich voice experience

### What's Next?
- [Add push notification to your mobile app](_documentation/client-sdk/setup/set-up-push-notifications)
- Explore [Client SDK](_documentation/client-sdk/overview)
- Explore [Voice API](_documentation/conversation/overview)
- Explore [Conversation API](_documentation/conversation/overview)