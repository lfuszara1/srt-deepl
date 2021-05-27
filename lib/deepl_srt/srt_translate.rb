# frozen_string_literal: false

require 'json'
require 'srt'
require_relative './deepl_request'

# Class to translate subtitles
class SrtTranslate
  def initialize(path, target_lang)
    @file = SRT::File.parse(File.new(path))
    @deepl_request = DeeplRequest.new
    @target_lang = target_lang
  end

  def parse
    @new_content = ''
    @file.lines.each do |line|
      @new_content << line.sequence.to_i
      @new_content << line.time_str
      line.text.each do |txt|
        json = translate(txt)
        @new_content << JSON.parse(json)['translations'][0]['text']
      end
    end
    @new_content
  end

  private

  def translate(text)
    @deepl_request.request(text, @target_lang).body
  end
end
