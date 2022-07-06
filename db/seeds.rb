# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
count = User.all.count
puts "ENTRO SEEDS" 
if count == 0 
    puts "CREADO EXITOSAMENTE ADMIN" 
    user = User.new
    user.name = "admin"
    user.last_name = "administrator"
    user.type_role = User.get_rol_admin
    user.phone = "123456"
    user.state = 1
    user.email = "admin@admin.com"
    user.password = 'AsDf.123'
    # user.event_id = group.event_id
    user.app_token = ""
    # user.people_id = 0
    user.save!
end