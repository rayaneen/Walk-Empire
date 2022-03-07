class Activity < ApplicationRecord
  STATUS = ['Pending', 'Successful', 'Failed', 'Abandonned', nil]
  belongs_to :user
  belongs_to :control_point
  validates :status, inclusion: { in: STATUS }
end
