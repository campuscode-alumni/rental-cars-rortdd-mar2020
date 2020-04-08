require 'rails_helper'
# RSpec puro -> não tem funcionalidades de navegação, não simula o usuário final
describe Manufacturer, type: :model do

  context 'validation' do
    it 'name cannot be blank' do
      manufacturer = Manufacturer.new

      manufacturer.valid?

      expect(manufacturer.errors[:name]).to include('Nome não pode '\
                                                    'ficar em branco')
    end

    it 'name must be uniq' do
      Manufacturer.create!(name: 'Honda')
      manufacturer = Manufacturer.new(name: 'Honda')

      manufacturer.valid?

      expect(manufacturer.errors[:name]).to include('Nome deve ser único')
    end
  end
end
