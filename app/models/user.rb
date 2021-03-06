class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	# before_save { self.email = email.downcase }

	# validates :name,  presence: true, length: { maximum: 50 }
 #  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 #  validates :email, presence: true, length: { maximum: 255 },
 #                    format: { with: VALID_EMAIL_REGEX },
 #                    uniqueness: { case_sensitive: false }
         
  enum user_type: [:admin, :coach, :final]

		has_many :trainclasses, through: :bookings
    has_many :bookings, dependent: :destroy
    has_many :my_fit_trackers, dependent: :destroy
end
