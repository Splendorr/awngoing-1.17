class FirstLinesOf < Dynasnip
   def handle(snip_name)
     snip = app.soup[snip_name]
     num_chars_to_show = 150
     snip.content[0...num_chars_to_show]
   end
   self
end