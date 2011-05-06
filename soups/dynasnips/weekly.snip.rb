require 'vanilla/dynasnip'
require 'atom'
require 'date'

class Weekly < Dynasnip
  def handle(*name)
    snips = app.soup.with(:name => name)
    entries = snips.sort_by { |s| s.created_at || Time.at(0) }.reverse[0...limit.to_i].map do |snip|
      render_entry_in_template(snip, as, kind)
    end
    render_entry_collection(snips, entries, as, kind)
  end
end

def prepare_snip_contents(snip)
  app.render(snip)
end