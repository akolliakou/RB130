class School
  attr_accessor :grade_group

  def initialize
    @grade_group = {}
  end

  def add(name, grade)
    if grade_group.include?(grade)
      grade_group[grade] << name
    else
      grade_group[grade] = [name]
    end
  end

  def grade(num)
    return [] if !grade_group.keys.include?(num)
    grade_group.values_at(num).flatten
  end

  def to_h
    grade_group.sort.each do |subarr|
      subarr[1].sort!
    end.to_h
  end
end