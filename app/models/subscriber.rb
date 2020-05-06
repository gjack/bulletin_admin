class Subscriber < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def self.current_subscriber=(subscriber)
    Thread.current[:current_subscriber] = subscriber
  end

  def self.current_subscriber
    Thread.current[:current_subscriber]
  end


  def full_name
    "#{first_name} #{last_name}"
  end
end
