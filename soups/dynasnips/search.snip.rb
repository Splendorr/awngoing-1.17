class Search < Dynasnip
  attribute :search_form, %{
    <form method="post" action="" class="search">
    <label for="q">Search</label>
    <input type="text" name="q" />
    <button>Sear</button>
    </form>
  }

  def get(*args)
    if app.request.params[:q]
      search
    else
      "<h2>Search</h2>" + search_form
    end
  end

  def post(*args)
    search
  end

  private

  def search
    term = app.request.params[:q]
    if term =~ /[^\w\s\-_\.]/
      "<p>Please only use characters, spaces, hyphens, underscores and periods in your search term</p>"
    else
      matches = `fgrep -r "#{term}" {#{app.config[:soups].join(",")}}`.split("\n")
      "<h2>Search results</h2>" + search_form + if matches.any?
        grouped_matches = {}
        matches.each do |match|
          next if match =~ /::/
          parts = match.split(":")
          snip = File.basename(parts.shift, ".yml")
          context = parts.join
          grouped_matches[snip] ||= []
          grouped_matches[snip] << context
        end
        snips = grouped_matches.keys.sort_by { |s| grouped_matches[s].length }.reverse
        "<ol>" + snips.map do |snip|
          contexts = grouped_matches[snip].map! do |context|
            start = context.index(term)
            context.gsub("{", "&#123;").gsub("}", "&#125;").
              insert(start + term.length, "</span>").
              insert(start, %{<span class="match">}).strip
          end
          %{<li class="search_result">{link_to(#{snip})} &rarr; <i>#{contexts.join(" &hellip; ")}</i></li>}
        end.join + "</ol>"
      else
        %{<p>No matches for "#{term}"</p>}
      end
    end
  end

  self
end

:page_title: See Arch