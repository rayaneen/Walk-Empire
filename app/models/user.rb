class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :control_points


#   def calculate_level
#     @user = current_user
#     @lvl = 1
#     case @user.xp
#     when 0..10
#       @lvl = 1
#     when 10..30
#       @lvl = 2
#     else
#       @lvl = 100
#     end
#   end
end
