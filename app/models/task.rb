class Task < ApplicationRecord
  belongs_to :user
  validates :task_name, presence: true, length: {minimum: 3, maximum: 50}
  validates :task_points, presence: true
  
end