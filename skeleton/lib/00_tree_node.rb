require 'byebug'

class PolyTreeNode

  attr_accessor :parent, :children
  attr_reader :value


  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent =(mom)
    @parent = mom
    # debugger 
    mom.children << self
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
  p3.parent = p1
  p4.parent = p2
  p5.parent = p2

  p p1
  p p2
  p p2.parent.value
  p p2.parent.children
end

build_extree