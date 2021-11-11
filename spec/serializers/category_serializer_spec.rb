require 'rails_helper'

RSpec.describe CategorySerializer, type: :serializer do
  let(:model) { categories(:base) }
  subject { described_class.new(model).as_json }

  it 'builds the attributes' do
    expect(subject[:id]).to eq(model.id)
    expect(subject[:name]).to eq(model.name)
    expect(subject[:status]).to eq(model.status)
  end
end
