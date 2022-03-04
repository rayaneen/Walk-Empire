class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :control_points
  has_many :activities

  def has_an_activity_going_on?(control_point)
    activities.where(status: nil).where(control_point: control_point).any?
  end
end
