# str = "abc-efg-{####}-1234-{##232}-{#}-{##}-{##"
# pattern = all the {#*}
# rm_pattern(str) #=> "abc-efg- -1234-{##232}- - -{##"
#
# Brute Force Approach: without using any ruby string built-in functions

def rm_pattern(str)
  len = str.length
  curPtr = concatPtr = 0
  res = ''

  while (curPtr < len) do
    if str[curPtr] == '{'
      pure, endPos = all_pure?(str, curPtr + 1)
      endPos = find_close_brace(str, endPos + 1) if !pure && endPos
      endPos = len - 1 unless endPos
      concatPart = pure ? str[concatPtr..(curPtr - 1)] + ' ': str[concatPtr..endPos]
      res = res + concatPart
      concatPtr = curPtr = endPos + 1
    else
      curPtr += 1
    end
  end

  res
end

def find_close_brace(str, startPtr)
  while str[startPtr] != nil do
    return startPtr if str[startPtr] == '}'
    startPtr += 1
  end
end

def all_pure?(str, startPtr)
  endPos = startPtr
  while str[endPos] != nil do
    temp = str[endPos]
    if temp == '#'
      endPos += 1
    elsif temp == '}'
      return [true, endPos]
    else
      return [false, endPos]
    end
  end
end

str = "abc-efg-{####}-1234-{##232}-{#}-{##}-{##"
puts rm_pattern(str)
puts rm_pattern(str) == 'abc-efg- -1234-{##232}- - -{##'