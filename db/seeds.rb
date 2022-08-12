# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    # stock = Stock.create([{ name: "Bitcoin" }, { amount: 5000 }])
    client = IEX::Api::Client.new

    tesla = client.quote('TSLA')
    stock = Stock.create(name: tesla.symbol, price: tesla.latest_price)

    walmart = client.quote('WMT')
    stock = Stock.create(name: walmart.symbol, price: walmart.latest_price)

    nike = client.quote('NKE')
    stock = Stock.create(name: nike.symbol, price: nike.latest_price)

    amazon = client.quote('AMZN')
    stock = Stock.create(name: amazon.symbol, price: amazon.latest_price)