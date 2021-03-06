class TitleFor < Dynasnip
  def handle(snip_name=nil, tag="h1")
    snip = snip_name ? app.soup[snip_name] : app.request.snip
    if snip.page_title
      %{<#{tag}>#{snip.page_title}</#{tag}>}
    end
  end
  self
end