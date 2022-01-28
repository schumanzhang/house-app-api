# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```
$ bundle add jwt
$ bundle add active_model_serializers
$ bundle add faker
```

# Uncomment rack-cors and bcrypt from your Gemfile

# enable CORS

```
$ rails g model Admin username:string password_digest:string firstname:string lastname:string
$ rails g controller api/v1/admins
$ rails g serializer admin
$ rails db:migrate
$ rails db:seed
```

# models

```
$ rails g model House address:string size:integer sold:boolean bed:integer bath:integer garage:integer image:string
$ rails g model Agent name:string area:string rating:float sold:integer
$ rails g migration CreateHousesAgentsJoinTable
```
