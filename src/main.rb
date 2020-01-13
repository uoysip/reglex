# due190214.rb

class PrefixToTree
  # subtrees returns a list: the roots children (aka the roots subtrees!)
  # if the current root is a leaf, subtrees will return an empty list
  attr_accessor :root, :subtrees, :tree_representation

  def initialize(tree_representation)
    @tree_representation = tree_representation
    @root = nil
    @subtrees = []
  end

  def to_tree
    open_brackets = 0
    temp_open_brackets = 0
    temp_index = 0
    substring = ""
    inner_subtree = false
    tree = PrefixToTree.new(@tree_representation)

    @tree_representation.each_char.with_index do |char, index|
      if index == 0 and char == "("
      elsif index == 0 # for leaves
        tree.root = @tree_representation[0]
      elsif index == 1 and @tree_representation[0] == "(" # the current index is . + or |, set it to root!
        tree.root = char
      elsif tree.root != nil and char != "(" and char != ")" and inner_subtree == false # ex.: LD in (|LD)
        tree.subtrees.append(PrefixToTree.new(@tree_representation[index]).to_tree)
      elsif tree.root != nil and char == "(" and inner_subtree == false # get ready for an inner subtree
        inner_subtree = true
        open_brackets += 1
        temp_open_brackets = open_brackets
        temp_index = index
      elsif tree.root != nil and char == ")" and inner_subtree == true # 
        open_brackets -= 1
        if temp_open_brackets == open_brackets + 1 
          inner_subtree = false
          substring = @tree_representation[temp_index..index]
          tree.subtrees.append(PrefixToTree.new(substring).to_tree)
        end
      end
    end

    tree

  end

end
