# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  User.find_or_create_by(email: 'takuya.mk96@gmail.com') do |user|
    user.password = 'password'
    user.name = 'mktakuya'
    user.token = 'GkueWCnUSiEXZD8E9KEoc4TF' # Sample
  end
end
