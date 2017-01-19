class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  after_initialize :init

  def init
    self.xp  ||= 0   
    self.health  ||= 10
    self.attack  ||= 1
    self.defense  ||= 1
    self.mana  ||= 10
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
    when 2800..3599 then 8
    when 3600..4499 then 9
    when 4500..5499 then 10
    when 5500..6599 then 11
    when 6600..7799 then 12
    when 7800..9099 then 13
    when 9100..10499 then 14
    when 10500..11999 then 15
    when 12000..13599 then 16
    when 13600..15299 then 17
    when 15300..17099 then 18
    when 17100..18999 then 19
    when 19000..20999 then 20
    when 21000..23099 then 21
    else
      "Level is too high"
    end
  end
 
  def upgrade_stats
    
  end
 
 
end
