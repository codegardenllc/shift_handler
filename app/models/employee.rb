class Employee < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :recoverable

  belongs_to :organization
  has_many :activities

  validates :name, presence: true
  validates :email, presence: true

  def self.active
    joins(activities: :activity_type)
    .where('activities.time = (SELECT MAX(activities.time) FROM activities WHERE activities.employee_id = employees.id)')
    .where('activity_types.name IN (?)', %w(check_in break_in break_out))
    .group('employees.id')
  end

  def status
    last_activity.try(:activity_type).try(:name)
  end

  def last_activity
    activities.order(:time).last
  end

  def last_break
    last_check_in = activities.joins(:activity_type).where('activity_types.name = ?', :check_in).last.try(:time) || Time.now.utc
    activities.joins(:activity_type).where('activity_types.name = ? and time > ?', :break_in, last_check_in).last
  end

  def has_taken_break?
    last_break
  end
end
