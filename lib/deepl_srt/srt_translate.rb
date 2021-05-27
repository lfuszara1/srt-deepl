# frozen_string_literal: true

require 'srt'
require_relative './deepl_request'

# Class to translate subtitles
class SrtTranslate
  def initialize(path)
    @file = SRT::File.parse(File.new(path))
    @deepl_request = DeeplRequest.new
  end

  def translate(text, target_lang)
    @deepl_request.request(text, target_lang).body
  end
end
