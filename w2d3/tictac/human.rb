require "byebug"
class Human

attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position (row,col)
        row = row.to_i
        col = col.to_i
    end

end#lastend