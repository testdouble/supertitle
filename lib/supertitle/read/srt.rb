require "supertitle/line"

module Supertitle::Read
  class Srt
    def initialize(content)
      @content = content
    end

    def read
      lines = @content.
        split("\n").
        chunk { |line| line == "" }. #<- group by every blank line
        reject { |(blank,_)| blank }. #<- eliminate blank lines
        map { |(_, components)|
          start, stop = time_offsets_for(components[1])
          Supertitle::Line.new(start, stop, components[2..-1].map(&:strip).join(" "))
        }
    end

    private

    def time_offsets_for(time_string)
      time_string.
        split(" --> ").
        map {|s|
          matches = s.match(/(\d\d):(\d\d):(\d\d),(\d\d\d)/)
          matches[1].to_i * 1000 * 60 * 60 + # hours
            matches[2].to_i * 1000 * 60 + # minutes
            matches[3].to_i * 1000 + # seconds
            matches[4].to_i # ms
        }
    end
  end
end
