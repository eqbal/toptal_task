TopTal Exercise
====

This is a simple solution for TopTal exercise below:

> Write an application that tracks jogging times of users
> - User must be able to create an account and log in (done)
> - When logged in, user can see his times he entered (done)
> - Each time entry when entered has a date, distance, and time (done)
> - When displayed, each time entry has an average speed (done)
> - Filter by dates from-to (done)
> - Report on average speed & distance per week (done)
> - REST API – for all user actions. In any case you should be able to explain how a REST API works and demonstrate > that by creating functional tests that use the REST Layer directly. (done)
> - All actions need to be done client side using AJAX, refreshing the page is not acceptable. (done)
> - Bonus: unit tests! (done)
> - You will not be marked on graphic design, however, do try to keep it as tidy as possible. 


You can checkout [My Solution](http://toptal-task.herokuapp.com/) live at (http://toptal-task.herokuapp.com/).

How to run the tests:
---
    RAILS_ENV=test bundle exec rake db:migrate
    bundle exec rake spec

Technologies used
---

 - Ruby (-v 2.0)
 - Ruby on Rails (-v 4.0.4)
 - jQuery
 - Rspec/Capybara/Selenium
 - Twitter Bootstrap 3.0

How to test the RESTful API
---

You can can check out the controller code at app/controllers/api/v1 the same as for the views (used jBuilder) and can be found at app/views/api/v1

It's important to get the **Token** and send it with the request so you can access the API

Each user has a token and can find it at the **Footer** of the page.

As for example, to get a list of entries for the logged in user 

    http://toptal-task.herokuapp.com/api/v1/entries?token={your_token}


    Basic Authentication:
        token: {each account has one}    
    
    Content Type :
       application/json
    
    Body:
       json data in Body
           
       sample json body
    
       	{
       	  "id" : 1, 
       	  "user_id" : 1,    	  
       	  "username" : "admin", 
       	  "distance" : 50.0, 
       	  "time_period" : 60, 
       	  "date_time" : "2014-05-15 03:36:11 +0300", 
       	  "created_at" : "2014-05-15T01:54:40.000Z", 
       	  "distance_type": "Km"
       	}
    
    
    API Requests:
    
    => listing Entries
       url: api/v1/entries
       method: GET
       body : not needed
    
    => Retrieving Entry detail
      url: api/v1/entries/:id
      method: GET
      body : not needed
    
    => creating an Entry
       url: api/v1/entries
       method: Post
       Body : json
      
    => Deleting an Entry 
      url: api/v1/entries/:id 
      method: DELETE
      body : not needed
    
    => Search Entries
      url: api/v1/entries/search?from=""&to="" 
      method: GET
      body : not needed
    
    => Report (Weekly)
       url: api/v1/entries/report
       method: GET
       body : not needed



Steps to run it locally:
---
    bundle exec rake db:migrate
    bundle exec rake db:seed
    bundle exec rails s



Notes:
---

- Please login as an admin (username: **admin** / pass: **1234**) so you can check out all the admins features like tracking other accounts.

- This is a reponsive design which is compatable with all the mobile devices.

- I chose Rails 4 for this exercise for simplicity, but usually in production mode I use Sinatra/Grape/Rack for simple API calls (for the RESTful API). 

- I'm using Ruby 2.0 (MRI) for simplicity, usually for production environment I use jRuby implementation with threaded server like Puma.

- Please note that I didn't use background workers with Resque/RabbitMQ or even use Celluloid directly for performance enhancements (I didn't consider scalability at this stage).
