class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_one_attached :picture
  after_create :welcome_send

  def full_name
    self.first_name + " " + self.last_name
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
