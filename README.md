# ScopeAbout Web App

This is the repository of the app that serve [scopeabout.com](https://prod.scopeabout.com/). 
The App runs as a Rails 5 app with a PostgreSQL 9.6 database. 

## Local Development

For local development, we use Vagrant for the project. Therefore to get started you should have following installed in
your machine. 

- VirtualBox 5.2
- Vagrant 2.0.x

Then you would need to add following environment variables with appropriate values. 

```
SOCIALPROJ_AWS_ACCESS_KEY_ID
SOCIALPROJ_AWS_SECRET_ACCESS_KEY
S3_BUCKET
```

Then simply run vagrant up to create the environment and provision the environment.

```
vagrant up --provision
```

Then you can ssh into the vagrant instance and navigate to the `/vagrant` folder where our app code resides. 

Here you can can run any pending migrations and start up the application by running `rails s`. 
