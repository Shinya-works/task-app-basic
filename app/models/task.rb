class Task < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :detail, presence: true, length: { minimum: 5 }
end
