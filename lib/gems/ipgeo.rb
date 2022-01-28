# frozen_string_literal: true

require_relative 'inside/version'
require_relative 'ipmeta'
require 'addressable/uri'
require 'net/http'

# the gems contains a lookup method that takes an IP address and returns metadata
module Ipgeo
  class Error < StandardError; end

  def self.lookup(ip_address)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip_address}")
    xml = Net::HTTP.get(uri)
    IpMeta.parse(xml)
  end
end
