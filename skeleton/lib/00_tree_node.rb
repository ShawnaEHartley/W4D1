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
    def parent=(new_parent)
        if !new_parent.children.include?(self) && self.parent != nil
            @parent = new_parent
            self.parent.children.push(self)

        end


    end

end