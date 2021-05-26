# frozen_string_literal: true

require 'spec_helper'

require_relative '../lib/deepl_srt/deepl_request'

describe DeeplRequest do
  describe 'DeepL API' do
    it 'check response' do
      expect(DeeplRequest.request('EN', 'PL', 'Test')).to have_http_status(:success)
    end
  end
end
