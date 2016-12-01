require "supertitle/read/srt"

module Supertitle

  def self.read(content, type)
    raise "Sorry, only :srt is supported right now!" unless type == :srt
    Read::Srt.new(content).read
  end

end
