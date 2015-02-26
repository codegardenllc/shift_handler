ActivityType.create!(name: :check_in)
ActivityType.create!(name: :check_out)

organization = Organization.create!(name: 'RMH')
employee = organization.employees.create!(name: 'Oksana Kalinchuk', email: 'ok@rmh.com', password: '123456', password_confirmation: '123456')