# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show a category', type: :request do
  let(:id) { categories(:base).id }
  let(:params) { {} }
  subject(:request) { get "/v1/categories/#{ id }", params: params }

  before { request }

  context 'when existing a category is requested' do
    it 'returns an OK status' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when the categories was not found' do
    let(:id) { 'not_found' }

    it 'returns an not_found status' do
      request

      expect(response).to have_http_status :not_found
    end
  end
end
