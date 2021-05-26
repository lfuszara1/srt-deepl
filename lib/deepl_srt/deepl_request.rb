# frozen_string_literal: true

require 'net/http'

# Class to send request to DeepL API
class DeeplRequest
  def self.request(_source_lang, _target_lang, _content)
    'https://api-free.deepl.com/v2/translate'
  end
end
