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

Step to deploy

./run.sh bash    
/deployment/docker/compose/deployment/deploy.sh s100

* ...

### Pasos de instalacion por primera vez
docker-compose build
docker-compose up
// Abrir otra terminal y ejecutar ejecutar 
docker-compose exec web bash
rails db:create
rails db:migrate
rails db:seed


// De aqui en en adelante solo debe ejecutar
docker-compose up
// para salir es ctrl + C