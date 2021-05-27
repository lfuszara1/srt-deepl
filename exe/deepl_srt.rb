#!/usr/bin/env ruby
# frozen_string_literal: true

require 'deepl_srt'

input_params = ARGV

if input_params.empty?
  puts 'deepl_srt [target_lang] [input path] [result_path]'
else
  target_lang = input_params[0]
  path = input_params[1]
  result_path = input_params[2]

  DeeplSrt.deepl_srt(path, target_lang, result_path)
end
