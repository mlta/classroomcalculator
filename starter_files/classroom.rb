# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10. Score of the student - assigment
def assignment_score(grade_hash, student, assignment_num)
grade_hash.select {|data| data == student}[student][assignment_num -1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  grade_hash.map {|data| data[1][assignment_num-1]}
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num) #each
  scores = assignment_scores(grade_hash, assignment_num)
  scores.sum / scores.size
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash) # look at arrays
  grade_hash.transform_values do |scores|
    scores.sum / scores.length
  end
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  case score
  when 90..Float::INFINITY
    "A"
  when 80..89
    "B"
  when 70..79
    "C"
  when 60..69
    "D"
  when 0..59
    "F"
  end

end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)# combine average and letter_grade
  grade.hash.transform_values do |scores|
  average = scores.sum / scores.length
  letter_grade(scores.sum / scores.length)
  end
end

# Return the average for the entire class.
def class_average(grade_hash)
  hash = averages(grade_hash)
  average_scores = hash.value
  return average_scores.sum / average_scores.length
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  hash_of_averages = averages(grade_hash)
  sorted_hash_of_averages = hash_of_averages.sort_by { |student, average| -average }
  top_students = sorted_hash_of_averages.first(number_of_students)
  return top_students.to_h.keys
end
