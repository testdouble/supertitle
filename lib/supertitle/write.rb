require "supertitle/write/transcript"

module Supertitle
  def self.write(supertitle_lines, type)
    raise "Sorry, only :transcript is supported right now!" unless type == :transcript
    Write::Transcript.new(supertitle_lines).write
  end
end

