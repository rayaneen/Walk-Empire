class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :control_point
end
