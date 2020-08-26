# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plan.create(name: "Small Monthly", stripe_id: "price_1HK4HZE45tZHky7eBtCrdimr", amount: 25_00, interval: "month")
Plan.create(name: "Small Annual", stripe_id: "price_1HK4HJE45tZHky7exl4966in", amount: 250_00, interval: "year")
Plan.create(name: "Large Monthly", stripe_id: "price_1HK4GwE45tZHky7erUPAXxgq", amount: 100_00, interval: "month")
Plan.create(name: "Large Annual", stripe_id: "price_1HK4GXE45tZHky7ewO1ItB0X", amount: 1000_00, interval: "year")