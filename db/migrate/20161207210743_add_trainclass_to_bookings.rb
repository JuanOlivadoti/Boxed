class AddTrainclassToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :trainclass, foreign_key: true
  end
end
