require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { categories(:base) }

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it 'validates enum values' do
      should define_enum_for(:status)
        .with_values(%i[available archived])
    end

    it 'validates associations' do
      should have_one(:event)
    end
  end
end
