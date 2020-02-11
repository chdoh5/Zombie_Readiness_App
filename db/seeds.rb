# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Group.destroy_all
User.destroy_all
Supply.destroy_all
Weapon.destroy_all
OwnedItem.destroy_all

10.times { Group.create(name: Faker::Games::Witcher.unique.location) }

100.times { User.create(name: Faker::FunnyName.name, group_id: Group.all.sample.id) }

Supply.create(name: "Rope", readiness_value: 2)
Supply.create(name: "Food", readiness_value: 4)
Supply.create(name: "Lighter", readiness_value: 2)
Supply.create(name: "Wood", readiness_value: 1)
Supply.create(name: "Shelter", readiness_value: 5)
Supply.create(name: "Bicycle", readiness_value: 2)
Supply.create(name: "Medexcine", readiness_value: 3)
Supply.create(name: "First Aid", readiness_value: 2)
Supply.create(name: "Water Supply", readiness_value: 4)
Supply.create(name: "Alcohol", readiness_value: 1)
Supply.create(name: "Robot", readiness_value: 8)
Supply.create(name: "Soap", readiness_value: 1)


100.times { Weapon.create(name: Faker::Games::Pokemon.move, readiness_value: rand(3..10), user_id: User.all.sample.id) }
10.times { Weapon.create(name: Faker::Games::Pokemon.move, readiness_value: rand(3..10)) }

500.times { OwnedItem.create(user_id: User.all.sample.id, supply_id: Supply.all.sample.id) }