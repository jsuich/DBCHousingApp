class User < ActiveRecord::Base
  # validates :name, presence: true
  # validates :cohort, presence: true
  validates :email, presence: true

  belongs_to :location
end
