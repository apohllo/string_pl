# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class TestCharacterCaseChange < Test::Unit::TestCase

  def setup
  end

  def test_each_small_letter_comparison
    assert_equal("a" <=> "b",-1)
    assert_equal("a" <=> "ą",-1)
    assert_equal("ą" <=> "a",1)
    assert_equal("ą" <=> "ą",0)
    assert_equal("b" <=> "ą",1)
    assert_equal("b" <=> "ć",-1)
    assert_equal("ć" <=> "ć",0)
    assert_equal("ć" <=> "e",-1)
    assert_equal("ć" <=> "b",1)
    assert_equal("ę" <=> "e",1)
    assert_equal("ę" <=> "f",-1)
    assert_equal("ł" <=> "l",1)
    assert_equal("ł" <=> "m",-1)
    assert_equal("ń" <=> "n",1)
    assert_equal("ń" <=> "o",-1)
    assert_equal("ó" <=> "o",1)
    assert_equal("ó" <=> "p",-1)
    assert_equal("ś" <=> "s",1)
    assert_equal("ś" <=> "t",-1)
    assert_equal("ź" <=> "z",1)
    assert_equal("ź" <=> "ż",-1)
    assert_equal("ż" <=> "ź",1)
  end

  def test_each_big_letter_comparison
    assert_equal("A" <=> "B",-1)
    assert_equal("A" <=> "Ą",-1)
    assert_equal("Ą" <=> "A",1)
    assert_equal("Ą" <=> "Ą",0)
    assert_equal("B" <=> "Ą",1)
    assert_equal("B" <=> "Ć",-1)
    assert_equal("Ć" <=> "Ć",0)
    assert_equal("Ć" <=> "E",-1)
    assert_equal("Ć" <=> "B",1)
    assert_equal("Ę" <=> "E",1)
    assert_equal("Ę" <=> "F",-1)
    assert_equal("Ł" <=> "L",1)
    assert_equal("Ł" <=> "M",-1)
    assert_equal("Ń" <=> "N",1)
    assert_equal("Ń" <=> "O",-1)
    assert_equal("Ó" <=> "O",1)
    assert_equal("Ó" <=> "P",-1)
    assert_equal("Ś" <=> "S",1)
    assert_equal("Ś" <=> "T",-1)
    assert_equal("Ź" <=> "Z",1)
    assert_equal("Ź" <=> "Ż",-1)
    assert_equal("Ż" <=> "Ź",1)
  end

  def test_non_string_comparison
    assert_equal("a" <=> nil,nil)
    assert_equal("ą" <=> nil,nil)
    assert_equal(nil <=> "a",nil)
    assert_equal(nil <=> "ą",nil)
  end

  def test_cross_encoding_comparison
    assert_equal("a" <=> "b".encode("iso-8859-2"),-1)
    assert_equal("a".encode("iso-8859-2") <=> "ą",-1)
    assert_equal("a" <=> "ą".encode("iso-8859-2"),-1)
    assert_equal("ą".encode("iso-8859-2") <=> "a".encode("iso-8859-2"),1)
    assert_equal("a".encode("iso-8859-2") <=> "ą".encode("iso-8859-2"),-1)
    assert_equal("ą".encode("iso-8859-2") <=> "ą".encode("iso-8859-2"),0)
    assert_equal("b".encode("Windows-1250") <=> "ą".encode("iso-8859-2"),1)
    assert_equal("b".encode("iso-8859-2") <=> "ć".encode("Windows-1250"),-1)
    assert_equal("b".encode("iso-8859-2") <=> "b".encode("Windows-1250"),0)
    assert_equal("ć".encode("Windows-1250") <=> "ć".encode("Windows-1250"),0)
    assert_equal("ć".encode("Windows-1250") <=> "e".encode("Windows-1250"),-1)
    assert_equal("ć" <=> "b".encode("Windows-1250"),1)
    assert_equal("ę".encode("Windows-1250") <=> "e",1)
    assert_equal("ę" <=> "ę".encode("Windows-1250"),0)
    assert_equal("ę".encode("Windows-1250") <=> "ę",0)
  end

  def test_multiletter_comparison
    assert_equal("" <=> "ał",-1)
    assert_equal("ał" <=> "",1)
    assert_equal("a" <=> "ał",-1)
    assert_equal("ał" <=> "a",1)
    assert_equal("ał" <=> "ał",0)
    assert_equal("ó" <=> "ów",-1)
    assert_equal("ów" <=> "ó",1)
  end

  def test_sort
    assert_equal(
      ["ała","ama","ala"].sort,
      ["ala","ała","ama"])
  end

  def test_case_comparison
    assert_equal("Ą" <=> "ą",-1)
    assert_equal("ą" <=> "Ą",1)
    assert_equal("a" <=> "Ą",1)
    assert_equal("Ą" <=> "a",-1)
  end

end
