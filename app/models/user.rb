class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :control_points
  has_many :activities, dependent: :destroy

  def current_activity(control_point)
    activity = activities.where(status: 'Pending').where(control_point: control_point).last
    if activity
      activity
    else
      false
    end
  end
end
