# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update a category', type: :request do
  let(:id) { categories(:base).id }
  let(:payload) { { name: 'deportivos' } }
  subject(:request) { put "/v1/categories/#{ id }", params: payload }

  context 'when the request is valid' do
    before { request }

    it 'returns an ok status' do
      expect(response).to have_http_status :ok
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
