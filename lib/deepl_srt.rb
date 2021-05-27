# frozen_string_literal: true

require_relative './deepl_srt/version'
require_relative './deepl_srt/srt_translate'

# Main module of DeeplSrt
module DeeplSrt
  class Error < StandardError; end

  def deepl_srt(path, target_lang, result_path)
    srt_translate = SrtTranslate.new(path, target_lang)
    result = srt_translate.parse
    File.open(result_path, 'w') { |file| file.write(result) }
  end
end
