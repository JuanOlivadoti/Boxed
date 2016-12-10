class Trainclass < ApplicationRecord
	enum train_class_type: ["Cross Advanced", "Cross Intermediate","Functional Training"]

	has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
end
