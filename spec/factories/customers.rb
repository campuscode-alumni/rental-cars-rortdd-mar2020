FactoryBot.define do
  factory :customer do
    name { 'Fulano Sicrano' }
    cpf { CPF.generate }
    sequence(:email) { |n| "email#{n}@email.com" }
  end
end