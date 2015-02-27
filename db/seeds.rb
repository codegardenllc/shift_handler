ActivityType.create!(name: :check_in)
ActivityType.create!(name: :check_out)

organization = Organization.create!(name: 'RMH')
organization.employees.create!(name: 'Tester Example', email: 'tester@example.com', password: 'passw0rd', password_confirmation: 'passw0rd', admin: true)
organization.employees.create!(name: 'Tester Example2', email: 'tester2@example.com', password: 'passw0rd', password_confirmation: 'passw0rd')