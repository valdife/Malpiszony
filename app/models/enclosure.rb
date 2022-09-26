class Enclosure < ApplicationRecord
    has_many :event, dependent: :delete_all
    has_many :employee_enclosures#, dependent: :delete_all
    has_many :employees, through: :employee_enclosures
    has_many :animals, dependent: :delete_all
    validates :localization, presence: true
    validates :name, presence: true
end
