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
    @utf_capitalized = "Ąćęłńóśżźabcdefghijklmnopqrstuvwxyz".force_encoding("UTF-8")
    @iso_capitalized = "\xa1\xe6\xea\xb3\xf1\xf3\xb6\xbf\xbcabcdefghijklmnopqrstuvwxyz".force_encoding("ISO-8859-2")
    @windows_capitalized = "\xa5\xe6\xea\xb3\xf1\xf3\x9c\xbf\x9fabcdefghijklmnopqrstuvwxyz".force_encoding("Windows-1250")
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

  def test_utf_8_capitalize
    assert_equal(@utf_capitalized, @utf_lower.capitalize)
  end

  def test_windows_1250_capitalize
    assert_equal(@windows_capitalized, @windows_lower.capitalize)
  end

  def test_iso_8859_2_capitalize
    assert_equal(@iso_capitalized, @iso_lower.capitalize)
  end

  def test_preserve_utf_lower_case
    original = @utf_lower.dup
    @utf_lower.upcase
    assert_equal(original,@utf_lower)
  end

  def test_preserve_utf_upper_case
    original = @utf_upper.dup
    @utf_upper.downcase
    assert_equal(original,@utf_upper)
  end

  def test_preserve_iso_lower_case
    original = @iso_lower.dup
    @iso_lower.upcase
    assert_equal(original,@iso_lower)
  end

  def test_preserve_iso_upper_case
    original = @iso_upper.dup
    @iso_upper.downcase
    assert_equal(original,@iso_upper)
  end

  def test_preserve_windows_lower_case
    original = @windows_lower.dup
    @windows_lower.upcase
    assert_equal(original,@windows_lower)
  end

  def test_preserve_windows_upper_case
    original = @windows_upper.dup
    @windows_upper.downcase
    assert_equal(original,@windows_upper)
  end

  def test_same_case
    copy = @utf_lower.dup
    assert_equal(@utf_lower,copy.downcase)
  end

  def test_same_case_bang
    copy = @utf_lower.dup
    assert_equal(nil,copy.downcase!)
    assert_equal(copy,@utf_lower)
  end

  def test_change_utf_lower_case
    copy = @utf_lower.dup
    copy.upcase!
    assert_equal(copy,@utf_upper)
  end

  def test_change_utf_upper_case
    copy = @utf_upper.dup
    copy.downcase!
    assert_equal(copy,@utf_lower)
  end

  def test_change_iso_lower_case
    copy = @iso_lower.dup
    copy.upcase!
    assert_equal(copy,@iso_upper)
  end

  def test_change_iso_upper_case
    copy = @iso_upper.dup
    copy.downcase!
    assert_equal(copy,@iso_lower)
  end

  def test_change_windows_lower_case
    copy = @windows_lower.dup
    copy.upcase!
    assert_equal(copy,@windows_upper)
  end

  def test_change_windows_upper_case
    copy = @windows_upper.dup
    copy.downcase!
    assert_equal(copy,@windows_lower)
  end

  def test_capitalize
    original = @utf_lower.dup
    assert_equal(original.capitalize, @utf_capitalized)
    assert_equal(original, @utf_lower)
  end

  def test_capitalize!
    copy = @utf_lower.dup
    assert_equal(copy.capitalize!, @utf_capitalized)
    assert_equal(copy.capitalize!, nil)
  end

end
