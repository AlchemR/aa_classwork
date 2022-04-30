require "byebug"
require "./list.rb"
class Item

attr_accessor :title, :deadline, :description

    def initialize (title, deadline, description)
    @title = title
    @description = description

    if self.valid_date?(deadline) == true
        @deadline = deadline
    else
        raise "You messed up!"
    end
    end


    def valid_date?(date_string)
# dateformat = [4,2,2]
    ds = date_string.split("-")
    ds1 = []
    ds.each_with_index do |ele, idx|
#        elel = ele.length
        ele = ele.to_i 
        if ele.is_a?(Integer) == true #&& elel.length == dateformat[idx]
            ds1 << true
        else
            ds1 << false
        end
    end


    if ds1.all?(true)
        return true
    else 
        return false
    end

    end




end #lastend