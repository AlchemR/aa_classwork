require "byebug"
class PolyTreeNode

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
        # return  
        queue = []
        debugger
        self.each do |ele|
          debugger
        puts ele 
        end

    end

end

