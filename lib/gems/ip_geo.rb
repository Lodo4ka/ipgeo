# frozen_string_literal: true

require_relative 'ipgeo/version'
require_relative 'ipgeo/ip_meta'
require 'addressable/uri'
require 'net/http'

# the gems contains a lookup method that takes an IP address and returns metadata
module IpGeo
  def self.lookup(ip_address)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip_address}")
    xml = Net::HTTP.get(uri)
    IpMeta.parse(xml)
  end
end
