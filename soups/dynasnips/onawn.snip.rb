class TitleRandomizer
  def handle(*args)
    pivot = rand(6)
    if pivot < 4
      "Ongoing"
    elsif pivot > 3
      "awngo.in/g/"
    end
  end
  self
end

:render_as: Ruby