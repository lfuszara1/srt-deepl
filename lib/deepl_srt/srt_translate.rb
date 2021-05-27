# frozen_string_literal: false

require 'srt'
require_relative './deepl_request'

# Class to translate subtitles
class SrtTranslate
  def initialize(path, target_lang)
    @file = SRT::File.parse(File.new(path))
    @deepl_request = DeeplRequest.new
    @target_lang = target_lang
  end

  def parse(_text)
    @new_content = ''
    @file.lines.each do |line|
      @new_content << line.sequence
      @new_content << line.time_str
      line.text.each do |txt|
        @new_content << translate(txt)
      end
    end
    @new_content
  end

  private

  def translate(text)
    @deepl_request.request(text, @target_lang).body
  end
end
