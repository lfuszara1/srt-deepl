# frozen_string_literal: true

require 'spec_helper'

require_relative '../lib/deepl_srt/deepl_request'

describe DeeplRequest do
  describe 'DeepL API' do
    let(:new_instance) { DeeplRequest.new }
    it 'check response' do
      response = new_instance.request('Hello world!', 'PL')
      expect(response.code.to_i).to eql(200)
    end
  end
end
