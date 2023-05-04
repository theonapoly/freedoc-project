# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Créer 10 villes avec des codes postaux aléatoires
10.times do
    City.create!(
    zip_code: Faker::Address.zip_code
    )
    end

# Crée 20 docteurs avec des prénoms, des noms et des codes postaux aléatoires
10.times do |index|
    Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city_id: City.all.sample.id
    )
    end
    
 20.times do |index|
    Patient.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city: City.all.sample
    )
    end

10.times do
    doctor = Doctor.all.sample
    patient = Patient.all.sample
    Appointment.create!(
    date: Faker::Date.between(from: '2014-10-13', to: '2020-09-10'),
    doctor: doctor,
    patient: patient,
    city: doctor.city || patient.city
    )
    end
        

# Crée 20 specialités aléatoires pour les docteurs
10.times do |index|
    Specialty.create!(
    name: Faker::Job.field
    )
    end

# Crée 20 relations entre des docteurs et des spécialités aléatoires
10.times do
    doctor = Doctor.all.sample
    specialty = Specialty.all.sample
    DoctorSpecialty.create!(
    doctor: doctor,
    specialty: specialty
    )
    end




