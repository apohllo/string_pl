# -*- coding: utf-8 -*-

class String
  # old up/down-case without Polish transcodings
  PL_UTF_8_LOWER = ("\xc4\x85\xc5\xbc\xc5\x9b\xc5\xba\xc4\x99" +
    "\xc4\x87\xc5\x84\xc3\xb3\xc5\x82").force_encoding("UTF-8")
  PL_UTF_8_UPPER = ("\xc4\x84\xc5\xbb\xc5\x9a\xc5\xb9\xc4\x98" +
    "\xc4\x86\xc5\x83\xc3\x93\xc5\x81").force_encoding("UTF-8")
  PL_ISO_8859_2_LOWER = PL_UTF_8_LOWER.encode("ISO-8859-2")
  PL_ISO_8859_2_UPPER = PL_UTF_8_UPPER.encode("ISO-8859-2")
  PL_WINDOWS_1250_LOWER = PL_UTF_8_LOWER.encode("Windows-1250")
  PL_WINDOWS_1250_UPPER = PL_UTF_8_UPPER.encode("Windows-1250")

  alias old_downcase_wo_pl downcase
  alias old_upcase_wo_pl upcase
  alias old_capitalize_wo_pl capitalize

  def downcase
    case self.encoding.name
    when "UTF-8"
      self.tr!(PL_UTF_8_UPPER,PL_UTF_8_LOWER)
    when "ISO-8859-2"
      self.tr!(PL_ISO_8859_2_UPPER, PL_ISO_8859_2_LOWER)
    when "Windows-1250"
      self.tr!(PL_WINDOWS_1250_UPPER, PL_WINDOWS_1250_LOWER)
    end
    self.old_downcase_wo_pl
  end

  def upcase
    case self.encoding.name
      when "UTF-8"
      self.tr!(PL_UTF_8_LOWER, PL_UTF_8_UPPER)
      when "ISO-8859-2"
      self.tr!(PL_ISO_8859_2_LOWER, PL_ISO_8859_2_UPPER)
      when "Windows-1250"
      self.tr!(PL_WINDOWS_1250_LOWER, PL_WINDOWS_1250_UPPER)
    end
    self.old_upcase_wo_pl
  end

  def capitalize
    s = self.dup
    s[0] = s[0].upcase
    s[1..-1] = s[1..-1].downcase
    s
  end

  def capitalize!
    old = self.dup
    self[0..-1] = self.capitalize
    self unless old == self
  end

end
