require 'test_helper'

class OmniauthCentralidTest < Minitest::Test
  def test_module_is_declared
    assert_kind_of Module, OmniauthCentralid
  end

  def test_version_is_defined
    refute_nil OmniauthCentralid::VERSION
  end

  def test_name_is_centralid
    assert name, 'centralid'
  end

  def test_site_url_is_defined
    assert :site, 'https://centralid.herokuapp.com'
  end

  def test_fields_are_defined
    assert :fields, [:name, :email]
  end

  def test_authorization_initialization
    # get "/auth/centralid"
    # assert_equal 302, last_response.status
  end
end