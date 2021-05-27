# frozen_string_literal: false

require 'json'
require 'srt'
require_relative './deepl_request'

# Class to translate subtitles
class SrtTranslate
  def initialize(api_key, path, target_lang)
    @file = SRT::File.parse(File.new(path))
    @deepl_request = DeeplRequest.new(api_key)
    @target_lang = target_lang
  end

  def parse
    @new_content = ''
    @file.lines.each_with_index do |line, index|
      @new_content << parse_part(line, index)
    end
    @new_content
  end

  private

  def parse_part(line, index)
    str = ''
    str << "#{index}\n"
    str << "#{line.time_str}\n"
    line.text.each do |txt|
      json = translate(txt)
      str << "#{JSON.parse(json)['translations'][0]['text']}\n"
    end
    str << "\n"
    str
  end

  def translate(text)
    @deepl_request.request(text, @target_lang).body
  end
end
