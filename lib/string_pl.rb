# encoding: iso-8859-2
class String
  # old up/down-case without Polish transcodings
  PL_UTF_LOWER = ("\xc4\x85\xc5\xbc\xc5\x9b\xc5\xba\xc4\x99" + 
    "\xc4\x87\xc5\x84\xc3\xb3\xc5\x82").force_encoding("UTF-8")
  PL_UTF_UPPER = ("\xc4\x84\xc5\xbb\xc5\x9a\xc5\xb9\xc4\x98" + 
    "\xc4\x86\xc5\x83\xc3\x93\xc5\x81").force_encoding("UTF-8")

  alias old_downcase_wo_pl downcase
  alias old_upcase_wo_pl upcase

  def downcase
    if self.encoding == Encoding.find("ISO-8859-2")
      self.tr("¡¯¦¬ÊÆÑÓ£","±¿¶¼êæñó³").old_downcase_wo_pl
    elsif self.encoding == Encoding.find("UTF-8")
      self.tr(PL_UTF_UPPER,PL_UTF_LOWER).old_downcase_wo_pl
    else
      self.old_downcase_wo_pl
    end
  end

  def upcase
    if self.encoding == Encoding.find("ISO-8859-2")
      self.tr("±¿¶¼êæñó³","¡¯¦¬ÊÆÑÓ£").old_upcase_wo_pl
    elsif self.encoding == Encoding.find("UTF-8")
      self.tr(PL_UTF_LOWER,PL_UTF_UPPER).old_upcase_wo_pl
    else
      self.old_upcase_wo_pl
    end
  end
end

