class PolyTreeNode

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    attr_reader :parent, :children, :value

    #node1 = root
    #node2 = inernal (child of node 1 & a parent)
    # node2.parent => node1
    # def parent=(new_parent)
    #     if !new_parent.children.include?(self) && self.parent != nil
    #         @parent = new_parent
    #         # self.parent.children.push(self)
    #         @parent.children << self
    #     end
    # end

    def parent=(new_parent)
        # if @parent != nil
        #     @parent.children.delete(self)
        # end

        # if new_parent == nil
        #     @parent = nil
        # else
        #     @parent = new_parent
        #     new_parent.children << self # unless new_parent.children.include?(self)
        # end

        unless @parent == nil
            @parent.children.delete(self)
        end

        @parent = new_parent

        unless @parent == nil
            @parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if self.children.include?(child_node)
            child_node.parent = nil
        else
            raise Error
        end
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |ele| 
            unless ele.children.empty?
                ele.dfs(target_value) 
            end
        end
        nil
    end
end
