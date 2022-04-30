require "./item.rb"

class List
attr_accessor :label

    def initialize(label)
    @label = label
    @list = []
    end

    def label 
        @label
    end

    def label=(label)
        @label = label
    end

    def add_item(title, deadline, description)
       neww = Item.new(title, deadline, description)
        @list << neww
    end

    def size
        @list.length
    end 

    def valid_index?(index)    
        if index < 0 || index > (@list.length - 1)
        return false
        else
        return true
        end
    end


    def swap(index1, index2)
        if valid_index?(index1) == true && valid_index?(index2) == true
        temp = @list[index1] 
        @list[index1] = @list[index2] 
        @list[index2] = temp
            return true
        else
            return false
        end
    end

        def [] (index)
            @list[index]
        end

        def priority
            @list[0]
        end

        def print
            puts "----------------------------------"
            puts "{#@label}"
            puts "----------------------------------"
            puts "     Index |       Item         | deadline "
            puts "----------------------------------"
                @list.each_with_index do |ele, idx|
                puts "  #{idx}"         "| #{ele.title}"          " | #{ele.deadline} "
                end
            puts "----------------------------------"
            puts "----------------------------------"
        end

        def print_full_item(index)
        puts "----------------------------------"
       puts  @list[index].title
        puts @list[index].description
       puts  @list[index].deadline
        puts "----------------------------------"
        return
        end

def print_priority
    puts  @list[0].title
    puts @list[0].description
   puts  @list[0].deadline
   return
end

def up(idx, ammount = 1)
    while (ammount > 0 == true )
        break if idx <= 0
        # 1off = idx-1
        self.swap(idx, (idx-1)) 
        ammount -= 1
         idx -= 1
    end
end

def down(idx, ammount = 1)
    while (ammount > 0 == true )
        break if idx <= (@list.length - 1)
        # 1off = idx-1
        self.swap((idx-1),idx) 
        ammount -= 1
         idx += 1
    end
end

end #lastend