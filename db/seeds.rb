# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

7.times do |f|

		date = Date.today+4

	10.times do |i|

		trainclass = Trainclass.create!({
							date: date,
							datetime: Time.now,
							capacity: 15,
							train_class_type: rand(0..2),
							coach_id: 1,
							quota: i			
		})
	end
end