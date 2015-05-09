class Newindex < Dynasnip
  def get(*args)
    # list = app.soup.instance_eval { @backend }.send(:all_snips).sort_by { |a| a.updated_at || Time.at(0) }.reverse.map { |snip|
    list = app.soup.instance_eval { @backend }.send(:all_snips).sort_by { |a| a.updated_at.to_s || Time.at(0) }.reverse.map { |snip|
    # list = app.soup.instance_eval { @backend }.send(:all_snips).sort_by { |a| a.updated_at.to_s}.reverse.map { |snip|
      "#{link_to snip.page_title, snip.name}<br />"
    }
    "#{list}"
  end
end

Newindex

:page_title: New Index
:render_as: Ruby