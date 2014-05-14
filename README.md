TopTal Exercise
====

This is a simple solution for TopTal exercise below:

> Write an application that tracks jogging times of users
> - User must be able to create an account and log in 
> - When logged in, user can see his times he entered 
> - Each time entry when entered has a date, distance, and time
> - When displayed, each time entry has an average speed
> - Filter by dates from-to
> - Report on average speed & distance per week
> - REST API – for all user actions. In any case you should be able to explain how a REST API works and demonstrate > that by creating functional tests that use the REST Layer directly.
> - All actions need to be done client side using AJAX, refreshing the page is not acceptable.
> - Bonus: unit tests!
> - You will not be marked on graphic design, however, do try to keep it as tidy as possible. 


You can checkout [My Solution](http://toptal-exercise.herokuapp.com) live at (http://toptal-exercise.herokuapp.com).

How to run the tests:
---
    bundle exec rake spec

Technologies used
---

 - Ruby (-v 2.0)
 - Ruby on Rails (-v 4.0.4)
 - jQuery
 - Rspec/Capybara/Selenium
 - Twitter Bootstrap


Steps to run it locally:
---
    bundle exec rake db:migrate
    bundle exec rails s


Notes:
---

- I chose Rails 4 for this exercise for simplicity, but usually in production mode I use Sinatra/Grape/Rack for simple API calls. 

- I'm using Ruby 2.0 (MRI) for simplicity, usually for production environment I use jRuby implementation with threaded server like Puma.

- I'm using SQLite for simplicity, in production I always prefer to use postgress/MySQL for RDBS (Preferably AWS RDS).

- Please note that I didn't use background workers with Resque/RabbitMQ or even use Celluloid directly for performance enhancements (I didn't consider scalability at this stage).

