filename = "data.txt"
lines = File.readlines(filename)

lines.each do |line|
  if line[0]=="#"
    linesplit = line.delete("#").delete(".").split("->")
    next if linesplit.length<2
#    p linesplit.len
    antecedent = linesplit[1].chomp.gsub(/\s+/, ' ')
    prething = linesplit[0].gsub(/\s+/, ' ')
    prething.gsub!(" and ",",")
    prething.gsub!(" or ",";")
    puts "#{antecedent} :- #{prething}"
  end
end
