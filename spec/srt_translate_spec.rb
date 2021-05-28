# frozen_string_literal: true

require 'spec_helper'

require_relative '../lib/deepl_srt/srt_translate'

describe SrtTranslate do
  describe 'Translate Subtiltes' do
    it 'translate' do
      env = Dotenv.load('.env')
      api_key = env['API_KEY']
      new_instance = SrtTranslate.new(api_key, 'PL', './examples/example.input.srt', './examples/example.output.tmp')
      expect(new_instance.parse(0)).to be_instance_of String
    end
  end
end
