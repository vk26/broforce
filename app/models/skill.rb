class Skill < ActiveRecord::Base
  belongs_to :user


  # Валидации
    validates :about, length: { maximum: 300 }

end