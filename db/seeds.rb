# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Admin.create(name: "Admin", email: 'admin@admin.com', password: '123456')
if Admin.last.email == 'admin@admin.com'
  puts "admin created" 
elsif
  puts "admin create error"
end
