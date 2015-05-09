require "time"
require "date"

date_line = 'Thu May 05 21:57:45 -0400 2011'

date_line = Time.parse(date_line.gsub("Date:", "").strip)

p date_line
# p ts