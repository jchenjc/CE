def cluster(dataArray, threshold = 5)
  results = []
  dataLen = dataArray.length
  return [dataArray] if dataLen == 1

  centroidIdx = generate_centroid_idx(0, dataLen - 1)
  leftBound, rightBound = 0, dataLen - 1
  currBucket, newRightBound, newLeftBound = group_neighbors(dataArray, centroidIdx, leftBound, rightBound, threshold)

  # recurse the left side of the dataArray
  leftDataArray = newRightBound < leftBound ? [] : dataArray[leftBound..newRightBound]
  leftSubCluster = leftDataArray.empty? ? [] : cluster(leftDataArray, threshold)
  results.concat(leftSubCluster)

  # add the current group to the results, so we can start adding the rightSubCluster
  results.concat(currBucket)

  #recurse the right side of the dataArray
  rightDataArray = newLeftBound > rightBound ? [] : dataArray[newLeftBound..rightBound]
  rightSubCluster = rightDataArray.empty? ? [] : cluster(rightDataArray, threshold)
  results.concat(rightSubCluster)
end

# add the neighbors of current centroid to the group if they qualify
# output: the group around current centroid
#         the rightBound for the left side of the dataArray
#         the leftBound for the right side of the dataArray

def group_neighbors(dataArray, centroidIdx, leftBound, rightBound, threshold)
  currGroup = [ dataArray[centroidIdx] ]
  leftIdx, rightIdx = centroidIdx - 1, centroidIdx + 1

  while leftIdx >= leftBound
    similar = similar?(dataArray[leftIdx], currGroup.first, threshold)
    break if !similar
    currGroup.unshift(dataArray[leftIdx])
    leftIdx -= 1
  end

  while rightIdx <= rightBound
    similar = similar?(currGroup.last, dataArray[rightIdx], threshold)
    break if !similar
    currGroup << dataArray[rightIdx]
    rightIdx += 1
  end

  # I wrapped currGroup inside an array, so we can use Array#concat in the caller method
  [[currGroup], leftIdx, rightIdx]
end

def similar?(small, large, threshold)
  return true if (large - small) <= threshold
end

def generate_centroid_idx(low, max)
  prng = Random.new
  prng.rand(low..max)
end


dataArray = [392, 396, 400, 406, 422, 436, 446, 448, 450, 454, 462, 470, 478, 488, 490, 508, 512, 518, 526, 528, 532, 538, 548, 562, 570, 580, 592, 594, 596, 598, 600, 604, 608, 614, 620, 626, 632, 640]

testArray = [5, 15, 16, 18, 19, 25, 35, 60]

puts cluster(testArray, 5).inspect
puts "\n"
puts cluster(dataArray, 5).inspect