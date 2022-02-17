needinputpredicates = []
lines = File.read("chapter78.pl")
  
  #REGEXP TO EXTRACT ALL PREDICATES ON THE LEFT SIDE
   #grep '[,| |(][a-z&_&A-Z]*('
  #REGEXP FOR LEFT SIDE
   #grep '^[a-z&_&A-Z]*('

#p lines

rhs = lines.scan(/[,| |(][a-z&_&A-Z]*\(/).map{|x| x.delete(", ()")}#.delete("")#.uniq
lhs = lines.scan(/^[a-z&_&A-Z]*\(/).map{|x| x.delete(", ()")}#.delete("")#.uniq

rhs.delete("")
lhs.delete("")


(rhs.uniq-lhs.uniq).each do |pred|
  puts "#{pred}(...) :- write('....'),write(X),write('.......................................?'),provide_option."
end

#believes_bound_by_law(X) :- write('Did '),write(X),write(' believe that he/she was bound by law to do so?'),provide_option.

#p lhs.uniq
