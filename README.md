# ruby-on-rails-blog-app

**My Implementation of Blog Application with Ruby on Rails + Deployment to Heroku**

## Overview

You are viewing the source codes of my blog application which was done with Ruby on Rails!

For making this app, I followed all the steps instructed in _Getting Started with Rails,_ found at Rails' website [here](https://guides.rubyonrails.org/getting_started.html). This app features the CRUD operations (i.e. Create, Read, Update, and Delete) on articles, plus addition and deletion of comments. Besides, an authentication mechanism such that some pages require username and password in order to gain access.

After the completion of the app in my local computer, I successfully deployed the app to [Heroku](https://www.heroku.com) platform! Although I faced some challenges and errors on the way, consequently I overcame with them and made sure it works without any problem.

You can visit the site [here](https://yigit-ruby-on-rails-blog-app.herokuapp.com/) to see the blog app in action! 

My credit goes to this video which helped me deploy the app to Heroku: https://www.youtube.com/watch?v=5kVtmnZNC8w&t=63s

All of these operations have been done in Windows operating system.

## Steps In A Nutshell

Before I start, the main programming language **Ruby** and the corresponding software **Ruby on Rails** had to be installed, as well as several other dependent components:

* Ruby (2.7.2 - DevKit)
* Rails (6.1)
* SQLite (3.34)
* Node.js (14.15.3)
* Yarn (1.22.5)

The command `rails new blog` was entered to create the necessary files and folders.

Next, I ran the following command `ruby bin/rails server` to check if the server (Puma) is working. Then, from the browser, I went to this site: http://localhost:3000. After seeing **Yay! You're on Rails!** image on the screen, I was confident that the app was ready to be developed.

These steps have been implemented to get the blog app working as intended:

* Setting the App Home Page
* MVC Modeling (model-view-controller)
* Database Migration (article & comment)
* CRUD Operations (Create, Read, Update, Delete) on articles
* Addition and deletion of comments related to articles
* Partials for sharing view code
* Basic authentication for security

These files have been involved for making this app:

* `blog/config/routes.rb`
* `blog/app/controllers/articles_controller.rb`
* `blog/app/controllers/comments_controller.rb`
* `blog/app/views/articles/index.html.erb`
* `blog/app/views/articles/show.html.erb`
* `blog/app/views/articles/new.html.erb`
* `blog/app/views/articles/edit.html.erb`
* `blog/app/views/articles/_form.html.erb`
* `blog/app/views/comments/_comment.html.erb`
* `blog/app/views/comments/_form.html.erb`
* `blog/app/models/article.rb`
* `blog/app/models/comment.rb`
* `blog/app/models/concerns/visible.rb`
* `blog/db/migrate/20210105131244_create_articles.rb`
* `blog/db/migrate/20210106123442_create_comments.rb`

In addition, however, the concern module `Visible` was disabled as this caused problems to the integrity of the app.

Meanwhile, you may find lots of comments inside the files above as I was figuring out how the codes were working properly.

## Deployment to Heroku

With the completion of the blog app locally, I was ready to deploy it into Heroku, a cloud-based platform. But, I had to install **git bash** and **Heroku CLI** in advance, because the deployment operation is carried out inside the command-line interface.

These commands have been run along with some actions in the order to make a successful deployment to the web:

* `git init`
* `heroku git:remote -a yigit-ruby-on-rails-blog-app`
* `git add .`
* `git commit -am "rails blog app is being deployed"`
* `git push heroku master`  # error occurred because of sqlite3
* Altered Gemfile to enable PostgreSQL on the web
* `bundle --without production`
* `git add .`
* `git commit -am "Changed Gemfile to enable PostgreSQL in production"`
* `git push heroku master`  # deployed successfully
* Visited the site, but Internal Server Error occurred
* `heroku logs`  # found that database tables did not exist
* `heroku run rake db:migrate`
* Visited again, and everyting is now fine!
