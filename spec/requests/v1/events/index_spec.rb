# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List events', type: :request do
  subject(:request) { get '/v1/events' }

  before { request }

  context 'when the request is valid' do
    it 'returns an OK status' do
      expect(response).to have_http_status :ok
    end

    it 'should not be empty' do
      expect(response.body).to_not be_empty
    end
  end
end
