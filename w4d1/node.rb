require "byebug"
class Node1

    def inspect
        return "<#{self.value}>"
    end

    attr_reader :value, :parent, :children
    attr_writer :parent,  :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if @parent
            i =  @parent.children.index(self)
            @parent.children.delete_at(i)
        end

        @parent = node
        if node != nil && !@parent.children.include?(self)
            node.children << self
        end
        
    end

    def add_child(child)
      @children << child
      child.parent = self
    end

    def remove_child(child)
      if @children.include?(child)
        child.parent = nil     
      else
        raise "see court proceedings"
      end
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.children.empty?      
        self.children.each do |child|
            check = child.dfs(target_value)
            return check if check #return check if check!= nil
        end 
        return nil
    end

    def bfs(target_value)
        # return self if self.value == target_value
        queue = [self] # [a]
        # i = 0
        found = false
        
        while !found # found == false
            return nil if queue.empty?
            found = true
            if queue[0].children.length > 0
                queue += queue[0].children # [a,b]
            end

            if queue[0].value != target_value
                found = false
                queue.shift
            end
        end
        queue[0]

    end

end

#8x8 gid
#possible positipns
#vaid positions (filter)
#make into child pairs?