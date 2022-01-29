# House App API
This is a demo of how to build an API using Ruby on Rails. You can connect to this API using React app or Postman etc. This is an API version of house-app.

## Pre-requisite
Ruby and Ruby of rails should be installed.
`gem install rails`

## Dependencies
Install the following dependencies
`bundle add jwt`
`bundle add active_model_serializers`
`bundle add faker`

Uncomment rack-cors and bcrypt from your Gemfile
`bundle install`

## Start the app
`rails server`

## Use the rails console
Use the Rails console to directly interact with your domain model. You can interact directly with ActiveRecord objects.
`rails console`

## See current routes
Rails routes are configured in config/routes.rb. To see current routes and their associated prefixes.
`rails routes`

## enable CORS
You need to enable CORS in order for other apps to connect to this API

## Generating models
The following example commands generates active record models
`rails generate model House address:string size:integer sold:boolean bed:integer bath:integer garage:integer image:string`

## Applying db migrations
After generating models you need to applying migrations to change the database schema
`rails db:migrate`

## Generate a migration file
`rails generate migration CreateHousesAgentsJoinTable`

## Applying database seeds
Seeds allow database to be initiated with some sample data. Just use active record in your db/seeds.rb file
`rails db:seed`

## Authentication
Token based authentication is implemented in this demo using JWT.
