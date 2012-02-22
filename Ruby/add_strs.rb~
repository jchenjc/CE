def add_strs(str1, str2)
  temp = ""
  ptr1 = str1.length - 1 
  ptr2 = str2.length - 1
  carry = 0
  guidePt = ptr1 < ptr2 ? ptr1 : ptr2
  longerStr = ptr1 > ptr2 ? str1 : str2
  
  while guidePt >= 0
    t = (str1[ptr1].ord - 48) + (str2[ptr2].ord - 48)
    carry = update(temp, carry, t)
    guidePt -= 1
    ptr1 -= 1
    ptr2 -= 1
  end
  
  offset = ptr1 > ptr2 ? ptr1 : ptr2
  while offset >= 0
    value = longerStr[offset].ord - 48
    carry = update(temp, carry, value)
    offset -= 1
  end
  
  temp.insert(0, "1") if carry == 1
  temp
end
    
def update(temp, carry, t)
  carryRes = 0
  if t + carry == 3
    temp.insert(0, "1")
    carryRes = 1
  elsif t + carry == 2
    temp.insert(0, "0")
    carryRes = 1
  else
    temp.insert(0, "#{t + carry}")
  end
  carryRes
end

a = "1101"
b = "11"
res = "10000"
puts "result should be #{res}"
puts add_strs(a,b)
