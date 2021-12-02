import ..file
import reader

main:
  horizontal := 0
  depth := 0
  aim := 0

  reader := reader.BufferedReader
    Stream.for_read "2/in.txt"

  next := reader.read_line
  while next:
    els := next.split " "
    command := els[0]
    units := int.parse els[1]
    if command == "up":
      aim -= units
    else if command == "down":
      aim += units
    else if command == "forward":
      horizontal += units
      depth += units * aim

    next = reader.read_line

  print "Depth: $depth horizontal: $horizontal aim: $aim"
  print "Answer 1 is: $(aim * horizontal)"
  print "Answer 2 is: $(depth * horizontal)"
