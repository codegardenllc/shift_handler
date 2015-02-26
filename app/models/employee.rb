class Employee < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :recoverable

  belongs_to :organization
  has_many :activities

  validates :name, presence: true
  validates :email, presence: true
end
