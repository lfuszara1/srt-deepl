# frozen_string_literal: true

require 'dotenv/load'
require 'uri'
require 'net/http'

# Class to send request to DeepL API
class DeeplRequest
  def initialize(api_key)
    @uri = URI('https://api-free.deepl.com/v2/translate')
    @api_key = api_key
  end

  def request(target_lang, text)
    Net::HTTP.post_form(@uri, 'auth_key' => @api_key,
                              'text' => text,
                              'target_lang' => target_lang,
                              'preserve_formatting' => 1)
  end
end
