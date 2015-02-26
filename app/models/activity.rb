class Activity < ActiveRecord::Base
  belongs_to :employee
  belongs_to :activity_type

  validates :employee, presence: true
  validates :activity_type, presence: true
  validates :time, presence: true

  def check_in?
    activity_type.name.to_sym == :check_in
  end
end
