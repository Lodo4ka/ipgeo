# frozen_string_literal: true

require 'happymapper'

class IpMeta
  include HappyMapper

  tag 'query'
  element :city, String
  element :country, String
  element :country_code, String, tag: 'countryCode'
  element :lat, String
  element :lon, String
end
