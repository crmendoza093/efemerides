# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create a category', type: :request do
  let(:payload) { { name: 'deportes' } }

  subject(:request) { post '/v1/categories', params: payload }

  context 'when the request has the complete params' do
    before { request }

    it 'returns a created status' do
      expect(response).to have_http_status :created
    end

    it 'should return an category with status available' do
      expect(response.body).to include 'available'
    end
  end

  it 'creates a category' do
    expect { request }.to change(Category, :count).by(1)
  end

  context 'when the name has already been taken' do
    before do
      payload[:name] = categories(:base).name
      request
    end

    it 'returns an unprocessable_entity status' do
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'returns a message error' do
      expect(response.body).to include I18n.t('errors.messages.taken')
    end
  end

  context 'when the name parameter is nil' do
    before do
      payload[:name] = nil
      request
    end

    it 'returns an unprocessable_entity status' do
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
