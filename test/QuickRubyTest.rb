list = "Jonathan Edge (1 tix - ZCLCMT)
Sara Pappa (1 tix - BIHJPB)
Mason Barret (14 tix - AMXZZY)
Brandi J Chavis (1 tix - ESQNUW)"

arr = list.split(/\n/)

arr.each do |i|
  tokens = i.split("(")
  tix_locator = tokens[1] #e.g. "1 tix - SSSAAA"
  # p tokens
  #Name
  name = tokens[0]
  tix_locator_split = tix_locator.split
  #Number of Tickets
  num_tickets = tix_locator_split[0]
  #Locator
  locator = tix_locator_split[3].chomp(")") #To remove last ')'
  
    p "==Creating Guest=="
    p name
    p num_tickets
    p locator

  
end

