local Recovery = {}
function Recovery.to_newline(parser) while parser:current().kind ~= "newline" and parser:current().kind ~= "eof" do parser.index = parser.index + 1 end end
return Recovery
