class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  after_initialize :init

  def init
    self.xp  ||= 0   
    self.health  ||= 0
    self.attack  ||= 0
    self.defense  ||= 0
    self.mana  ||= 0
  end
  
  def level
    level = case self.xp
    when 0..99 then 1
    when 100..299 then 2
    when 300..599 then 3
    when 600..999 then 4
    when 1000..1499 then 5
    when 1500..2099 then 6
    when 2100..2799 then 7
    else
      "Invalid Level"
    end
  end
 
end
