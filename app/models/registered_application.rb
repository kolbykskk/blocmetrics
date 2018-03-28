class RegisteredApplication < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :URL, presence: true, uniqueness: true, url: true

end
