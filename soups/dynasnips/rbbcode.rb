require 'rubygems'
require 'rbbcode'
include Rbbcode::Parser

module Vanilla::Renderers
  class Rbbcode < Base
    def prepare(snip, part=:content, args=[], enclosing_snip=snip)
      @snip = snip
    end
    
    def process_text(content)
      parser = Rbbcode::Parser.new
      parser.parse(content)
    end
  end
end

