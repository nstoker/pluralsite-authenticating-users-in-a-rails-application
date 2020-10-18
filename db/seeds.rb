# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_name = ENV['ADMIN_USER']
unless admin_name.nil?
  admin = User.where(username: admin_name).first_or_create do |u|
    u.email = ENV['ADMIN_EMAIL'] if ENV['ADMIN_EMAIL']
    u.password = ENV['ADMIN_PASS'] if u.password.nil? && ENV['ADMIN_PASS']
  end

  admin.save!
end
