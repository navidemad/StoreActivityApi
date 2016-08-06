# Welcome to Store Activity API

This repository has been created for an intership entrance test.

[![Build Status](https://travis-ci.org/navidemad/StoreActivityApi.png?branch=master)](https://travis-ci.org/navidemad/StoreActivityApi)

Context
--------------------------------

As a mobile developer, I need an API to display all sales points with related sales representatives visits reports.

Todo
--------------------------------

* Build a data model
* Generate an CRUD API
* Generate a simple documentation

Requirements
--------------------------------

* The client cannot access to any information with be logged with username/password
* The client can get all sales points and visits related
* The client can declare a new visit with a text report into an existing store in database (POST)

Technologies
--------------------------------

* Ruby on Rails 5
* Ruby 2.3.0

Gems
--------------------------------

| Gem | Usage |
| :------------- |:-------------|
| **rack-attack** | safe API against brute force attacks and bad client code |
| **active_model_serializers** | serializing API Output for better output json |
| **simple_command** | helper service like for having a shorter code in controllers |
| **jwt** | encoding and decoding of HMACSHA256 tokens available in the application |
| **rack-cors** | public API with cors in order to make cross-origin AJAX requests possible |

Installation
--------------------------------

```
git clone https://github.com/navidemad/StoreActivityApi
cd StoreActivityApi
bundle install
rails db:create db:migrate
rails s
```

You can found a seeds.rb file with Users,Store,Visits already created:
```
rails db:seed
```

UML
--------------------------------

![Alt](/erd.png "UML")

Unit Tests
--------------------------------

After the installation is done,

```
rspec .
```

Issues
--------------------------------

If you have problems, please create a [Github issue](https://github.com/navidemad/StoreActivityApi/issues).

Credits
--------------------------------

* [Token-based authentication with Ruby on Rails 5 API](http://tutorials.pluralsight.com/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api)
* [Building the Perfect Rails 5 API Only App](http://sourcey.com/building-the-prefect-rails-5-api-only-app/)
* [Serving Custom JSON From Your Rails API With ActiveModel::Serializers](https://blog.engineyard.com/2015/active-model-serializers)
Contributing
--------------------------------------------------------------------------------

Found an issue? Have a great idea? Want to help? Great! Create an issue [issue](http://github.com/jeffkreeftmeijer/fuubar/issues) for it, or even better; fork the project and fix the problem yourself. Pull requests are always welcome. :)

License
--------------------------------

It is free software, and may be redistributed under the terms specified in the LICENSE file.
