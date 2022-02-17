file = File.readlines("tofix.pl")
newfilename = "output.pl"

file.each_slice(3) do |set|
  line1 = set[0]
  line2 = set[1]

  firstpart = line1.split("(")[0]
  checkedvar = "checked_" + firstpart

  theparttoreplace = line1.split(" ")[2].split(";")[0]
  theparttoreplace += ";"
  newline2 = line1.sub(theparttoreplace,"#{theparttoreplace}(not(#{checkedvar}),")
  newline2 = newline2.sub(".",").")
  thething = "provide_option,assert(#{theparttoreplace[0..-2]}"
  newline2.sub!(thething,"((#{thething}));(assert(#{checkedvar}),false)")

  newline1 = "#{checkedvar} :- false."

#   puts ":- dynamic #{checkedvar}/0."
#   puts "retractall(#{checkedvar}),"
  puts newline1
  puts newline2
  puts line2
  puts
end

#violent(X) :- vio(X);(not(checked_violent),(write('Was '),write(X),write(' violent?'),((provide_option,assert(vio(X)));(assert(checked_violent),false)))).


=begin
believes_justified_by_law(X) :- bjbl(X);(write('Did '),write(X),write(' believe that he/she was justified by law to do so?'),provide_option,assert(bjbl(X))).
bjbl(X) :- always_false(X).



checkedabet :- false.
didabet(X,Y) :- (didab(X,Y)) ; ((not(checkedabet)),(write('Did '),write(X),write(' abet '),write(Y),write('?'),(provide_option;assert(checkedabet)),assert(didab(X,Y)))).
didab(X,_) :- always_false(X).
=end

=begin
instigates(X) :- inst(X);(willful(X),(concealment(X,_);misrepresentation(X)),assert(inst(X))).
instigates(X) :- inst(X);(lawmustbechecked(4,107),write('Has '),write(X), write(' instigated anyone to commit the crime?'),provide_option,assert(inst(X))).
inst(X) :- always_false(X).
=end
