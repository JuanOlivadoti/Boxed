# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|

	date = "2016-12-07"

	trainclass = Trainclass.create!({
						date: date,
						time: "2000-01-01 " + (i+6).to_s + ":00:00",
						max_quota: 15,
						train_class_type: "functional_training",
						coach_id: 1,
						quota:15			
	})
end