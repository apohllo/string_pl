# -*- coding: utf-8 -*-

class String
  UTF_8_ENCODING = "UTF-8"
  ISO_8859_2_ENCODING = "ISO-8859-2"
  WINDOWS_CP1250_ENCODING = "Windows-1250"
  # old up/down-case without Polish transcodings
  PL_UTF_8_LOWER = ("\xc4\x85\xc5\xbc\xc5\x9b\xc5\xba\xc4\x99" +
    "\xc4\x87\xc5\x84\xc3\xb3\xc5\x82").force_encoding(UTF_8_ENCODING)
  PL_UTF_8_UPPER = ("\xc4\x84\xc5\xbb\xc5\x9a\xc5\xb9\xc4\x98" +
    "\xc4\x86\xc5\x83\xc3\x93\xc5\x81").force_encoding(UTF_8_ENCODING)
  PL_ISO_8859_2_LOWER = PL_UTF_8_LOWER.encode(ISO_8859_2_ENCODING)
  PL_ISO_8859_2_UPPER = PL_UTF_8_UPPER.encode(ISO_8859_2_ENCODING)
  PL_WINDOWS_1250_LOWER = PL_UTF_8_LOWER.encode(WINDOWS_CP1250_ENCODING)
  PL_WINDOWS_1250_UPPER = PL_UTF_8_UPPER.encode(WINDOWS_CP1250_ENCODING)

  alias old_downcase_wo_pl downcase!
  alias old_upcase_wo_pl upcase!
  alias old_capitalize_wo_pl capitalize

  def downcase!
    case self.encoding.name
    when UTF_8_ENCODING
      self.tr!(PL_UTF_8_UPPER,PL_UTF_8_LOWER)
    when ISO_8859_2_ENCODING
      self.tr!(PL_ISO_8859_2_UPPER, PL_ISO_8859_2_LOWER)
    when WINDOWS_CP1250_ENCODING
      self.tr!(PL_WINDOWS_1250_UPPER, PL_WINDOWS_1250_LOWER)
    end
    self.old_downcase_wo_pl
  end

  def downcase
    str = self.dup
    str.downcase!
    str
  end

  def upcase!
    case self.encoding.name
    when UTF_8_ENCODING
      self.tr!(PL_UTF_8_LOWER, PL_UTF_8_UPPER)
    when ISO_8859_2_ENCODING
      self.tr!(PL_ISO_8859_2_LOWER, PL_ISO_8859_2_UPPER)
    when WINDOWS_CP1250_ENCODING
      self.tr!(PL_WINDOWS_1250_LOWER, PL_WINDOWS_1250_UPPER)
    end
    self.old_upcase_wo_pl
  end

  def upcase
    str = self.dup
    str.upcase!
    str
  end

  def capitalize
    s = self.dup
    s[0..0] = s[0..0].upcase
    s[1..-1] = s[1..-1].downcase if s[1]
    s
  end

  def capitalize!
    old = self.dup
    self[0..-1] = self.capitalize
    self unless old == self
  end

end

