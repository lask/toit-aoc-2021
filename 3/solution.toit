import ..file
import reader

main:
  print "Part 1"
  first
  print "Part 2"
  second

first:
  reader := reader.BufferedReader
    Stream.for_read "3/in.txt"

  next := reader.read_line

  line_size := next.size
  bits := List line_size 0
  in_size := 0

  while next:
    in_size++
    for i := 0; i < line_size; i++:
      if next[i] == '1': bits[i]++

    next = reader.read_line

  result := List line_size
  for i := 0; i < line_size; i++:
    result[i] = bits[i] > in_size / 2 ? 1 : 0

  gamma := 0
  epsilon := 0
  result.do:
    gamma <<= 1
    gamma += it

    epsilon <<= 1
    epsilon += it ^ 1

  print "The answer is $(gamma * epsilon)"


second:
  reader := reader.BufferedReader
    Stream.for_read "3/in.txt"

  lines := []
  while next := reader.read_line:
    lines.add next

  oxygen := List lines.size 1
  co2 := List lines.size 1

  val := null
  val_2 := null
  for i := 0; i < lines[0].size; i++:
    zeroes := 0
    ones := 0
    zeroes_2 := 0
    ones_2 := 0
    for j := 0; j < lines.size; j++:
      if oxygen[j] == 1:
        if lines[j][i] == '1': ones++
        else: zeroes++
      if co2[j] == 1:
        if lines[j][i] == '1': ones_2++
        else: zeroes_2++

    dom := zeroes <= ones ? '1' : '0'
    left := 0

    dim := zeroes_2 <= ones_2 ? '0' : '1'
    left_2 := 0

    for j := 0; j < lines.size; j++:
      if oxygen[j] == 1:
        if lines[j][i] == dom:
          left++
          val = lines[j]
        else:
          oxygen[j] = 0

      if co2[j] == 1:
        if lines[j][i] == dim:
          left_2++
          val_2 = lines[j]
        else:
          co2[j] = 0

  oxy_num := 0
  val.do:
    oxy_num <<= 1
    oxy_num |= it - '0'

  co2_num := 0
  val_2.do:
    co2_num = co2_num << 1
    co2_num |= it - '0'

  print "The answer is: $(oxy_num * co2_num)"
