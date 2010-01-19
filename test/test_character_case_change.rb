# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class TestCharacterCaseChange < Test::Unit::TestCase

  def setup
    @utf_lower = "ąćęłńóśżźabcdefghijklmnopqrstuvwxyz".force_encoding("UTF-8")
    @utf_upper = "ĄĆĘŁŃÓŚŻŹABCDEFGHIJKLMNOPQRSTUVWXYZ".force_encoding("UTF-8")
    @iso_lower = "\xb1\xe6\xea\xb3\xf1\xf3\xb6\xbf\xbcabcdefghijklmnopqrstuvwxyz".force_encoding("ISO-8859-2")
    @iso_upper = "\xa1\xc6\xca\xa3\xd1\xd3\xa6\xaf\xacABCDEFGHIJKLMNOPQRSTUVWXYZ".force_encoding("ISO-8859-2")
    @windows_lower = "\xb9\xe6\xea\xb3\xf1\xf3\x9c\xbf\x9fabcdefghijklmnopqrstuvwxyz".force_encoding("Windows-1250")
    @windows_upper = "\xa5\xc6\xca\xa3\xd1\xd3\x8c\xaf\x8fABCDEFGHIJKLMNOPQRSTUVWXYZ".force_encoding("Windows-1250")
  end

  def test_utf_8_downcase
    assert_equal(@utf_lower, @utf_upper.downcase)
  end

  def test_utf_8_upcase
    assert_equal(@utf_upper, @utf_lower.upcase)
  end

  def test_iso_8859_2_downcase
    assert_equal(@iso_lower, @iso_upper.downcase)
  end

  def test_iso_8859_2_upcase
    assert_equal(@iso_upper, @iso_lower.upcase)
  end

  def test_windows_1250_downcase
    assert_equal(@windows_lower, @windows_upper.downcase)
  end

  def test_windows_1250_upcase
    assert_equal(@windows_upper, @windows_lower.upcase)
  end
end

