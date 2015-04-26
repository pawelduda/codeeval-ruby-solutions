# https://www.codeeval.com/browse/156/

def rollercoaster_case(str)
  upcase = false

  str.split('').map do |c|
    if c =~ /[A-Za-z]/ 
      upcase = !upcase
      upcase ? c.upcase : c.downcase
    else
      c
    end
  end.join
end

File.open(ARGV[0]).each_line do |line|
  puts rollercoaster_case(line)
end

# tests
=begin
p rollercoaster_case("To be, or not to be: that is the question.") == "To Be, Or NoT tO bE: tHaT iS tHe QuEsTiOn."
p rollercoaster_case("Whether 'tis nobler in the mind to suffer.") == "WhEtHeR 'tIs NoBlEr In ThE mInD tO sUfFeR."
p rollercoaster_case("The slings and arrows of outrageous fortune.") == "ThE sLiNgS aNd ArRoWs Of OuTrAgEoUs FoRtUnE."
p rollercoaster_case("Or to take arms against a sea of troubles.") == "Or To TaKe ArMs AgAiNsT a SeA oF tRoUbLeS."
p rollercoaster_case("And by opposing end them, to die: to sleep.") == "AnD bY oPpOsInG eNd ThEm, To DiE: tO sLeEp."
=end