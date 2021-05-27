# frozen_string_literal: true

require 'dotenv/load'
require 'uri'
require 'net/http'

# Class to send request to DeepL API
class DeeplRequest
  def initialize
    @uri = URI('https://api-free.deepl.com/v2/translate')
    env = Dotenv.load('.env')
    @api_key = env['API_KEY']
  end

  def request(text, target_lang)
    Net::HTTP.post_form(@uri, 'auth_key' => @api_key, 'text' => text, 'target_lang' => target_lang)
  end
end
