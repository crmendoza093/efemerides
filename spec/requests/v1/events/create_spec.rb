# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create a event', type: :request do
  let(:payload) { { description: 'devs day', effective_date: '12/12/2021', image_url: 'http://www.iamge.com', category_id: categories(:base).id } }

  subject(:request) { post '/v1/events', params: payload }

  context 'when the request has the complete params' do
    before { request }

    it 'returns a created status' do
      expect(response).to have_http_status :created
    end

    it 'should return an event with status available' do
      expect(response.body).to include 'available'
    end
  end

  it 'creates a event' do
    expect { request }.to change(Event, :count).by(1)
  end

  context 'when the description parameter is nil' do
    before do
      payload[:description] = nil
      request
    end

    it 'returns an unprocessable_entity status' do
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
