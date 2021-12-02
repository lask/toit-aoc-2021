import ..file
import reader

main:
  lines := get_input
  prev := null
  increases := 0
  lines.do:
    depth := int.parse it
    if prev and prev < depth:
      increases++
    prev = depth

  print "The answer is $increases"


get_input -> List:
  reader := reader.BufferedReader
    Stream.for_read "1/in1.txt"

  line := reader.read_line
  lines := []
  while line:
    lines.add line
    line = reader.read_line
  return lines
