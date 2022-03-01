class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :controlpoint
end
