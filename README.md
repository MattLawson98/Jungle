# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. Jungle focuses on plant life sales but can be easily be pivoted to any other items. The project was tested using Rspec and Cypress!

The page header looks like:
![Header Image](https://github.com/MattLawson98/Jungle/blob/master/docs/TopNavBar.PNG?raw=true)

You can filter through Jungle categories to see different types of plants:
![Category Image](https://github.com/MattLawson98/Jungle/blob/master/docs/Categories.PNG?raw=true)

Jungle allows users to login to their accounts:
![Login Image](https://github.com/MattLawson98/Jungle/blob/master/docs/Login.PNG?raw=true)

You can also create an account if you don't have one:
![Sign-up Image](https://github.com/MattLawson98/Jungle/blob/master/docs/Sign-Up.PNG?raw=true)



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Cypress 9.x
- Rspec
