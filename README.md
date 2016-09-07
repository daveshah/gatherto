# Gatherto [![Build Status](https://travis-ci.org/daveshah/gatherto.svg?branch=master)](https://travis-ci.org/daveshah/gatherto)

Inspired by the fact that [97% of the time, I run alone](http://goo.gl/KP8uIO)

My hope is that this will scratch 2 of my current itches:  
- A desire to dig deeper into Phoenix & Elixir by building something a bit larger scale  
- I want a tool that allows me to find other folks to run and bike with.  


I have some basic ideas for features I'd like to see in this. If you have any, I'd love to hear them - just create a new issue :).  

## Developer Setup
### Google Authentication
The [Ueberauth documentation](https://hexdocs.pm/ueberauth_google/extra-readme.html) is very helpful,
but the Google side of things is a bit difficult to follow. When you follow their link to the Google Developer Console, you need to create an account that is linked to a credit card. Next, you need to enable the Google+ API. From there, you need to configure the credentials. Set up the OAuth consent screen and generate OAuth credentials for your development environment. Add `http://localhost:4000/auth/google/callback` as the authorized callback URL. Lastly, you should export the credentials as `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` environment variables. Start up your server and test the google login functionality.

### Google Maps
Again, the Google side of things is a bit annoying. If you've setup the above (Google Authentication) you should be able to navigate to the [credentials](https://console.developers.google.com/apis/credentials) page for your account. Select 'Create credentials', 'API key', and choose 'Browser key'. You can name this as you see fit. This will generate a key which you should export as `GOOGLE_MAPS_API_KEY`. In your dashboard, you'll also want to enable the following APIs: Google Places API Web Service, Google Maps javascript API, Google Maps Directions API, Google Maps Elevation API, and Google Maps Geocoding API.

