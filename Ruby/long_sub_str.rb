# Longest Sub string
# Example:
#   a = 'cbadfghggz'
#   long_sub_str(a) #=> 'adfgh'
# Return the longest substring (increasing alphabetic order)

def long_sub_str(str)
  return if !str || str.empty?
  start, stop = 0, str.length
  curPtr = curMaxCount = tempMaxCount= 1
  curStart = 0

  while str[curPtr]
    if str[curPtr] >= str[curPtr - 1]
      tempMaxCount += 1
    else
      if tempMaxCount > curMaxCount
        curMaxCount = tempMaxCount
        start, stop = curStart, curPtr - 1
      end
      tempMaxCount = 1
      curStart = curPtr
    end

    curPtr += 1
  end

  str[start..stop]
end

a = 'cbadfghggz'
puts long_sub_str(a) == 'adfgh'
puts long_sub_str('abcde') == 'abcde'
puts long_sub_str('aabcde') == 'aabcde'
puts long_sub_str('abcabc') == 'abc'
puts long_sub_str('abcabcda') == 'abcd'
puts long_sub_str('') == nil
puts long_sub_str('a') == 'a'
