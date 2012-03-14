# str = "abc-efg-{####}-1234-{##232}-{#}-{##}-{##"
# pattern = all the {#*}
# rm_pattern(str) #=> "abc-efg- -1234-{##232}- - -{##"
#
# gsub Approach

def rm_pattern_gsub(str)
  str.gsub(/\{#+\}/, ' ')
end

def rm_pattern(str)

end

str = "abc-efg-{####}-1234-{##232}-{#}-{##}-{##"
puts rm_pattern_gsub(str)
puts rm_pattern_gsub(str) == 'abc-efg- -1234-{##232}- - -{##'

#puts rm_pattern(str) == 'abc-efg- -1234-{##232}- - -{##'
#puts rm_pattern(str)
