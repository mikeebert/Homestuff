# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Category.destroy_all
categories = Category.create([{:title => 'Furniture'}, {:title => 'Clothes'}, {:title => 'Electronics'}, {:title => 'Sporting Goods'}, {:title => 'Appliances'}])

Condition.destroy_all
conditions = Condition.create([{:state => "Excellent"}, {:state => 'Very Good'}, {:state => 'Good'}, {:state => 'Fair'}, {:state => 'Poor'}])