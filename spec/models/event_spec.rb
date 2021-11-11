require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { events(:base) }

  describe 'Validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:effective_date) }
    it { should validate_presence_of(:category_id) }

    it 'validates enum values' do
      should define_enum_for(:status)
        .with_values(%i[available archived])
    end

    it 'validates associations' do
      should belong_to(:category)
    end
  end
end
