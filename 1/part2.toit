import reader
import ..file

main:
  lines := get_input
  lines.map --in_place: int.parse it

  window := lines[0] + lines[1] + lines[2]
  increases := 0
  for i := 0; i < lines.size - 3; i++:
    if window < window - lines[i] + lines[i + 3]: increases++
    window -= lines[i]
    window += lines[i + 3]

  print "The answer is: $increases"

get_input -> List:
  reader := reader.BufferedReader
    Stream.for_read "1/in1.txt"

  line := reader.read_line
  lines := []
  while line:
    lines.add line
    line = reader.read_line
  return lines
