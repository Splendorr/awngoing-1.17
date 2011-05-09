class LinkToWithTitle < Dynasnip
  def handle(snip_name, link_text=snip_name, part=nil)
    snip = app.soup[snip_name]
    if snip && snip.page_title && link_text == snip_name
      link_text = snip.page_title
    end
    link_to(link_text, snip_name, part)
  end
  self
end