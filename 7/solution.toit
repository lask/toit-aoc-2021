import ..file
import reader

main:
  in := (reader.BufferedReader
    Stream.for_read "7/in.txt").read_line

  positions := (in.split ",").map: int.parse it
  positions.sort --in_place

  res_1 := positions.size * positions.last
  (positions.last - positions.first + 1).repeat:
    goal_pos := it + positions.first
    fuel_cost_1 := positions.reduce --initial=0: | acc pos | acc + (goal_pos - pos).abs



    if fuel_cost_1 < res_1: res_1 = fuel_cost_1

  res_2 := positions.size * (positions.last * (positions.last + 1)) / 2
  (positions.last - positions.first + 1).repeat:
    goal_pos := it + positions.first
    fuel_cost_2:= positions.reduce --initial=0: | acc pos |
      n := (goal_pos - pos).abs
      acc + (n * (n + 1)) / 2

    if fuel_cost_2 < res_2: res_2 = fuel_cost_2

  print "The answer to the first part is: $res_1"
  print "The answer to the second part is: $res_2"
