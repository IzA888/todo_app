class Tasks < ApplicationRecord

    attribute :completed, :boolean, default: false

    validates :title, presence: true
end
