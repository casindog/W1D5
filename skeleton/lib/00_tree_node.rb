require 'byebug'

class PolyTreeNode

  attr_accessor :parent, :children
  attr_reader :value


  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(new_parent)
    unless @parent.nil? #check to see if old parent exist and makes old parent forget child
        @parent.children.reject! {|children| children == self} 
    end

    if new_parent.nil? 
      @parent = nil
    else
      @parent = new_parent
      new_parent.children << self
    end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "That is not their child" unless @children.include?(child)
    child.parent = nil
  end

  def inspect
    "<PolyTreeNode V=#{value} parent= #{parent} children= #{children}>"
  end

end

def build_extree
  p1 = PolyTreeNode.new(1)
  p2 = PolyTreeNode.new(2)
  p3 = PolyTreeNode.new(3)
  p4 = PolyTreeNode.new(4)
  p5 = PolyTreeNode.new(5)

  p2.parent = p1
  # p3.parent = p1
  # p4.parent = p2
  # p5.parent = p2

  p p1
  p p2
  p p2.parent.value
  p p2.parent.children
end

# build_extree