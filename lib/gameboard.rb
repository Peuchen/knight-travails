class GameBoard

  def knight_moves(start, finish)
    @first_knight = Knight.new(start)
    create_tree(finish)
    path = find_path(finish)

    puts "You made it in #{path.size - 1} moves! Here's your path:"
    path.each { |move| puts "#{move}"}
  end

  def create_tree(finish, queue = [@first_knight], index = 0)
    current = queue[index]
    create_children(current)
    current.children.each do |child|
      next if queue.include?(child)
      queue << child
    end

    return if current == find_child(finish) || index >= 64

    index += 1
    create_tree(finish, queue, index)
  end

  def create_children(parent)
    parent.possible_moves.each do |move|
      if find_child(move).nil?
        child = Knight.new(move)
      else
        child = find_child(move)
      end
      parent.children << child
    end
  end

  def find_child(move, queue = [@first_knight], index = 0)
    found_knight = nil
    current = queue[index]
    return if current.nil?

    current.children.each do |child|
      queue << child unless queue.include?(child)
      found_knight = child if child.position == move
    end

    index += 1
    return found_knight unless found_knight.nil?

    find_child(move, queue, index)
  end

  def find_path(finish, path = [finish])
    parent = find_parent(finish)
    path.unshift(parent.position)
    return path if parent == @first_knight

    find_path(parent.position, path)
  end

  def find_parent(finish, queue = [@first_knight], index = 0)
    current = queue[index]
    parent = current.possible_moves.any? { |move| move == finish}

    return if current.nil?
    return current if parent == true

    current.children.each do |child|
      queue << child unless queue.include?(child)
    end

    index += 1
    find_parent(finish, queue, index)
  end

end

