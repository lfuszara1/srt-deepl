# frozen_string_literal: true

require_relative './deepl_srt/version'
require_relative './deepl_srt/srt_translate'

# Main module of DeeplSrt
module DeeplSrt
  class Error < StandardError; end

  def self.deepl_srt(api_key, target_lang, input_path, result_path, from_line)
    srt_translate = SrtTranslate.new(api_key, target_lang, input_path, result_path)
    srt_translate.parse(from_line)
  end
end
