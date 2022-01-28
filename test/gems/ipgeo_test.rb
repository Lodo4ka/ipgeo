# frozen_string_literal: true

require 'test_helper'

class IpgeoTest < Minitest::Test
  def setup
    xml = File.new('test/fixture.xml')
    stub_request(:get, 'http://ip-api.com/xml/8.8.8.8').and_return(status: 200, body: xml)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Gems::Inside::VERSION
  end

  def test_it_does_something_useful
    ip_meta = Ipgeo.lookup('8.8.8.8')
    pp ip_meta.lat
    assert_equal 'Ashburn', ip_meta.city
    assert_equal 'United States', ip_meta.country
    assert_equal 'US', ip_meta.countryCode
    assert_equal '39.03', ip_meta.lat
    assert_equal '-77.5', ip_meta.lon
  end
end
