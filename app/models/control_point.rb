class ControlPoint < ApplicationRecord
  STATUS = ['Owned', 'Unowned', 'Neutral']
  belongs_to :user
  def admin?
    user_id == User.find_by_nickname("No one").id
  end
end
