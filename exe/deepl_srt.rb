#!/usr/bin/env ruby
# frozen_string_literal: true

require 'deepl_srt'

input_params = ARGV

if input_params.empty?
  puts 'deepl_srt [api_key] [target_lang] [input path] [result_path]'
else
  api_key = input_params[0]
  target_lang = input_params[1]
  path = input_params[2]
  result_path = input_params[3]

  DeeplSrt.deepl_srt(api_key, path, target_lang, result_path)
end
