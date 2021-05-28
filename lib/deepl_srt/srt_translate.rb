# frozen_string_literal: false

require 'fileutils'
require 'json'
require 'srt'
require_relative './deepl_request'

# Class to translate subtitles
class SrtTranslate
  def initialize(api_key, target_lang, input_path, result_path)
    @file = SRT::File.parse(File.new(input_path))
    @deepl_request = DeeplRequest.new(api_key)
    @target_lang = target_lang
    FileUtils.touch(result_path) unless File.exist?(result_path)
    @result_path = result_path
  end

  def parse(from_line)
    @new_content = ''
    @file.lines.drop(from_line.to_i).each_with_index do |line, index|
      @new_content << parse_part(line, index + from_line.to_i)
    end
    @new_content
  end

  private

  def parse_part(line, index)
    str = ''
    str << "#{index + 1}\n"
    str << "#{line.time_str}\n"
    json = translate(line.text.join('\n'))
    result = shorter(JSON.parse(json)['translations'][0]['text'])
    str << "#{result}\n\n"
    save_line(str)
  end

  def translate(text)
    @deepl_request.request(@target_lang, text).body
  end

  def shorter(line)
    short = line.split.each_slice(6).map { |a| a.join ' ' }
    short.join("\n")
  end

  def save_line(line)
    File.open(@result_path, 'a+') { |file| file.write(line) }
  end
end
