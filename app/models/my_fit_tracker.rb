class MyFitTracker < ApplicationRecord
  belongs_to :user

  enum exercise_type: ["Strength", "Resistance", "Other"]
end
