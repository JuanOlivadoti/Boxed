class Trainclass < ApplicationRecord
	enum train_class_type: [:cross_advanced, :cross_intermediate,:functional_training]

	has_many :users, through: :bookings
  has_many :bookings
end
