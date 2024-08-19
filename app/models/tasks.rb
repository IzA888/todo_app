class Tasks < ApplicationRecord
    belongs_to :user
    scope :completed, -> {
        where{
            completed = True
        }
    }

    scope :todo, -> {
        where{
            completed = False
        }
    }
end
