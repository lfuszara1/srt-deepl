#!/usr/bin/env ruby
# frozen_string_literal: true

require 'deepl_srt'

input_params = ARGV

if input_params.empty?
  puts 'deepl_srt [input path] [target_lang] [result_path]'
else
  path = input_params[0]
  target_lang = input_params[1]
  result_path = input_params[2]

  DeeplSrt.deepl_srt(path, target_lang, result_path)
end
