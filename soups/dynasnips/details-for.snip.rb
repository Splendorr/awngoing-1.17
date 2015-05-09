class DetailsFor < Dynasnip
  def handle(snip_name)
    if snip = app.soup[snip_name]
      details = %{The above snip, #{link_to snip.page_title, snip.name}, was last updated on #{snip.updated_at}}
      details + "."
    end
  end
  self
end