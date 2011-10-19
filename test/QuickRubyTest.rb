list = "Jonathan Edge (1 tix - ZCLCMT)
Sara Pappa (1 tix - BIHJPB)
Mason Barret (14 tix - AMXZZY)"

arr = list.split(/\n/)

arr.each do |i|
  #now I have all every record in token
  tokens = i.split
  name = tokens[0] + " " + tokens[1]
  #replace "(" with empty string to get the tickets
  num_tickets = tokens[2].tr_s('(', '')
  #
  locator = tokens[5].tr_s(')', '')
  #p tokens
  
  p name
  p num_tickets
  p locator
end

