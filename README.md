# Batman::Rails

Easily setup and use batman.js (0.16) with Rails 4

## Installation

Add this line to your application's Gemfile:

    gem 'batman-rails'

And then execute:

    $ bundle
    $ rails generate batman:app

### Layout and namespacing

Running `rails generate batman:app` will create the following directory structure under `app/assets/app_name/`:

    models/
    views/
    controllers/
    html/
    lib/

It will also create a toplevel `app_name.coffee` file to setup namespacing and setup initial requires.

## Generators
Batman-Rails provides 3 simple generators to help get you started using Batman.js with Rails.
The generators will only create client side code (CoffeeScript).

### Model Generator

    rails generate batman:model

This generator creates a batman model inside `app/assets/app_name/models` to be used to talk to the Rails backend.

### Controllers

    rails generate batman:controller

This generator creates a batman controller for the given actions provided.

### Scaffolding

    rails generate batman:scaffold

This generator creates a controller, helper and model to create a simple crud single page app

## Usage

Created a new Rails application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'batman-rails'

Install the gem and generate scaffolding.

    bundle install
    rails generate batman:app
    rails generate scaffold Post title:string content:string
    rake db:migrate
    rails generate batman:scaffold Post title:string content:string

You now have installed the `batman-rails` gem, setup a default directory structure for your frontend batman code. Then you generated the usual Rails server side scaffolding and finally generated Batman.js code to provide a simple single page app.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
