class Location < ActiveRecord::Base
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  has_many :users

  def grab_cohorts

    cohort = {}
    cohorts = []
    users = self.users
    ids = []

    users.each do |user|

      cohorts.each do |cohort|
        ids << cohort[:id]
      end

      unless ids.include?(user.cohort_id)
        cohort[:id] = user.cohort_id
        cohort[:name] = user.cohort_name.gsub(/\s.+/, '')
        cohorts << cohort
        cohort = {}
      end
        # cohort[user.cohort_id] = user.cohort_name.gsub(/\s.+/, '')
    end

    cohorts

  end
end
