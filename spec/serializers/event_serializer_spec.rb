require 'rails_helper'

RSpec.describe EventSerializer, type: :serializer do
  let(:model) { events(:base) }
  subject { described_class.new(model).as_json }

  it 'builds the attributes' do
    expect(subject[:id]).to eq(model.id)
    expect(subject[:description]).to eq(model.description)
    expect(subject[:effective_date]).to eq(model.effective_date)
    expect(subject[:status]).to eq(model.status)
    expect(subject[:image_url]).to eq(model.image_url)
  end
end
