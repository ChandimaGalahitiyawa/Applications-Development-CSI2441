# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Application Administrator
User.create!(
    first_name: 'John',
    last_name: 'Jones',
    email: 'admin@myquotes.com',
    password: 'admin123',
    is_admin: true
  )
  
  # Standard User
  User.create!(
    first_name: 'Vincent',
    last_name: 'Brown',
    email: 'vinceb@myemail.com',
    password: 'vince123',
    is_admin: false
  )
  