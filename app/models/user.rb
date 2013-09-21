class User < ActiveRecord::Base
  # validates :name, presence: true
  # validates :cohort, presence: true
  validates :email, presence: true

  belongs_to :location

  def grab_handle
    p self.twitter_handle
    p self.name
    if self.twitter_handle != nil
      handle = "- @" + self.twitter_handle.split('/')[-1]
    else
      return nil
    end
  end
end
