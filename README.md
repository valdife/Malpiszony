# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 3.1.0p0

* System dependencies

PostgreSQL 14

* Configuration
Create superuser "monkey" with given password

sudo su postgres
psql
CREATE ROLE monkey WITH LOGIN SUPERUSER PASSWORD 'password';

* Database creation
bin/rails db:create

* Database initialization

* How to run the test suite

bin/rails db:seed -> Should create few test objects

bin/rails server -> Start test server

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



![image](https://user-images.githubusercontent.com/38388042/167408069-410aadcb-65cd-4a43-9f86-0cf2e9a1e0e6.png)
![image](https://user-images.githubusercontent.com/38388042/167408124-0a28f5ae-18a3-4e9c-ae0f-0b7cce2e32a5.png)
