# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
 
puts "Worksop are beang created"

workshop = Workshop.create([
  {
    name: " Full stack ruby on rails development ",
      descrition: "We are added some dummy description for workshop We are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshop",
    start_date: Date.today+2.days,
    end_date: Date.today+7.days,
    start_time: "10:00 AM",
    end_time: "03:00 PM",
    total_seat: 99,
    remaining_seat: 0,
    registration_fee: 6000
  },
  {
    name: " Full stack Java development ",
      descrition: "We are added some dummy description for workshop We are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshop",
    start_date: Date.today+2.days,
    end_date: Date.today+7.days,
    start_time: "10:00 AM",
    end_time: "03:00 PM",
    total_seat: 99,
    remaining_seat: 0,
    registration_fee: 6000
  },
  {
    name: " Full stack Python development ",
      descrition: "We are added some dummy description for workshop We are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshop",
    start_date: Date.today+2.days,
    end_date: Date.today+7.days,
    start_time: "10:00 AM",
    end_time: "03:00 PM",
    total_seat: 99,
    remaining_seat: 0,
    registration_fee: 6000
  },
  {
    name: " Full stack React development ",
      descrition: "We are added some dummy description for workshop We are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshopWe are added some dummy description for workshopWe are added some dummy description for workshop
      We are added some dummy description for workshop",
    start_date: Date.today+2.days,
    end_date: Date.today+7.days,
    start_time: "10:00 AM",
    end_time: "03:00 PM",
    total_seat: 99,
    remaining_seat: 0,
    registration_fee: 6000
  }

])

puts "workshop create"