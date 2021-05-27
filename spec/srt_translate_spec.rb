# frozen_string_literal: true

require 'spec_helper'

require_relative '../lib/deepl_srt/srt_translate'

describe SrtTranslate do
  describe 'Translate Subtiltes' do
    let(:new_instance) { SrtTranslate.new('./examples/example.srt', 'PL') }
    it 'translate' do
      expect(new_instance.parse('')).to be_instance_of String
    end
  end
end
