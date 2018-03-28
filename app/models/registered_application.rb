class RegisteredApplication < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true, uniqueness: true
  validates :URL, presence: true, uniqueness: true, url: true

end
