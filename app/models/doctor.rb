class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    belongs_to :city, optional: true
    has_many :doctor_specialties
    has_many :specialties, through: :doctor_specialties
end
