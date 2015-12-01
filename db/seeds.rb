# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# b1 = Budget.create(owner: "McKay", description: "Test", amount: 5.00, spent_on: Time.new(2015, 10, 1))
# b2 = Budget.create(owner: "Ally", description: "Test", amount: 5.00, spent_on: Time.new(2015, 10, 1))
# b3 = Budget.create(owner: "McKay", description: "Test", amount: 5.00, spent_on: Time.new(2015, 10, 6))
# b4 = Budget.create(owner: "Ally", description: "Test", amount: 5.00, spent_on: Time.new(2015, 10, 6))
# b5 = Budget.create(owner: "McKay", description: "Test", amount: 5.00, spent_on: Time.new(2015, 11, 6))
# b6 = Budget.create(owner: "Ally", description: "Test", amount: 5.00, spent_on: Time.new(2015, 11, 6))
# b7 = Budget.create(owner: "McKay", description: "Test", amount: 5.00, spent_on: Time.new(2015, 11, 29))
# b7 = Budget.create(owner: "Ally", description: "Test", amount: 5.00, spent_on: Time.new(2015, 11, 29))
# b9 = Budget.create(owner: "McKay", description: "Test", amount: 10.00, spent_on: Time.new(2015, 12, 6))
# b10 = Budget.create(owner: "Ally", description: "Test", amount: 10.00, spent_on: Time.new(2015, 12, 6))
b1 = Budget.create(owner: "McKay", description: "Default", amount: 30.00, spent_on: Time.new(2015, 11, 1))
b2 = Budget.create(owner: "Ally", description: "Default", amount: 30.00, spent_on: Time.new(2015, 11, 1))
a1 = Allowance.create(owner: "McKay", amount: 0.0)
a2 = Allowance.create(owner: "Ally", amount: 0.0)