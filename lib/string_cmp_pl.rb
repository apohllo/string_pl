# -*- coding: utf-8 -*-
require 'string_case_pl'

class String
  PL_LETTER_ORDER = {}

  ("AĄBCĆDEĘFGHIJKLŁMNŃOÓPQRSŚTUVWXYZŹŻ" +
   "aąbcćdeęfghijklłmnńoópqrsśtuvwxyzźż").force_encoding(UTF_8_ENCODING).
   each_char.with_index do |char,index|
    PL_LETTER_ORDER[char] = index
  end

  alias old_cmp_wo_pl <=>

  def <=>(other)
    if !other.is_a?(String)
      old_cmp_wo_pl(other)
    elsif self.encoding.name != UTF_8_ENCODING ||
      other.encoding.name != UTF_8_ENCODING
      case self.encoding.name
      when UTF_8_ENCODING
        case other.encoding.name
        when ISO_8859_2_ENCODING,WINDOWS_CP1250_ENCODING
          self.<=>(other.encode(UTF_8_ENCODING))
        else
          old_cmp_wo_pl(other)
        end
      when ISO_8859_2_ENCODING
        case other.encoding.name
        when UTF_8_ENCODING
          self.encode(UTF_8_ENCODING) <=> other
        when ISO_8859_2_ENCODING,WINDOWS_CP1250_ENCODING
          self.encode(UTF_8_ENCODING) <=> other.encode(UTF_8_ENCODING)
        else
          old_cmp_wo_pl(other)
        end
      when WINDOWS_CP1250_ENCODING
        case other.encoding.name
        when UTF_8_ENCODING
          self.encode(UTF_8_ENCODING) <=> other
        when ISO_8859_2_ENCODING,WINDOWS_CP1250_ENCODING
          self.encode(UTF_8_ENCODING) <=> other.encode(UTF_8_ENCODING)
        else
          old_cmp_wo_pl(other)
        end
      else
        old_cmp_wo_pl(other)
      end
    else
      self.each_char.with_index do |char,index|
        position1 = PL_LETTER_ORDER[char]
        position2 = PL_LETTER_ORDER[other[index]]
        if position1 && position2
          if position1 != position2
            return (position1 < position2 ? -1 : 1)
          end
        else
          if other[index]
            if char.old_cmp_wo_pl(other[index]) != 0
              return char.old_cmp_wo_pl(other[index])
            end
          else
            return 1
          end
        end
      end
      # all equal, compare length
      if self.length == other.length
        return 0
      elsif self.length < other.length
        return -1
      else
        return 1
      end
    end
  end
end
