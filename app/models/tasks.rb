class Tasks < ApplicationRecord
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
