class PigLatin
  def self.translate(string)
    string.split.map do |str|
      if rule_one(str)
        rule_one_result
      elsif rule_two(str)
        rule_two_result(str)
      else
        rule_three_result
      end
    end.join(" ")
  end

  def self.rule_one(str)
    str.match?(/^([aeiou])|(y[^aeiou])|xr/)
  end

  def self.rule_two(str)
    str.match?(/^sch|qu|th|ch/)
  end

  def self.rule_one_result(str)
    str + 'ay'
  end

  def self.rule_two_result(str)
    if str.start_with?(/^sch|squ|thr/)
      str[3..-1] + str[0..2] + 'ay'
    else
      str[2..-1] + str[0..1] + 'ay'
    end
  end

  def self.rule_three_result(str)
    str[1..-1] + str[0] + 'ay'
  end
end

p PigLatin.translate('ear')
p PigLatin.translate('yttria')
p PigLatin.translate('xray')
p PigLatin.translate('queen')
p PigLatin.translate('square')
p PigLatin.translate('pig')
p PigLatin.translate('koala')
p PigLatin.translate('thrush')
