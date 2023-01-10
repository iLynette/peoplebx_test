# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(name: "Admin", surname: "mimi", email: "mimi@gmail.com", password: "123456")
Appointment.create!(user: user,start_time: "2021-05-01 10:00:00", end_time: "2021-05-01 11:00:00", duration: 90, location: "Paris", title: "random")
Appointment.create!(user: user,start_time: "2021-05-01 10:00:00", end_time: "2021-05-01 11:00:00", duration: 60, location: "Paris", title: "random")
Appointment.create!(user: user,start_time: "2021-05-01 10:00:00", end_time: "2021-05-01 11:00:00", duration: 45, location: "Paris", title: "random")
Appointment.create!(user: user,start_time: "2021-05-01 10:00:00", end_time: "2021-05-01 11:00:00", duration: 15, location: "Paris", title: "random")
Appointment.create!(user: user,start_time: "2021-05-01 10:00:00", end_time: "2021-05-01 11:00:00", duration: 30, location: "Paris", title: "random")
