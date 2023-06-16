# frozen_string_literal: true

require 'date'

class Processor
  def visit(node)
    name, *args = node
    public_send("#{name}_node", *args)
  end

  def if_node(*args)
    condition_node, result_node = args

    visit(result_node) if visit(condition_node)
  end

  def unless_node(*args)
    condition_node, result_node = args

    visit(result_node) unless visit(condition_node)
  end

  def eq_node(*args)
    left, right = args

    visit(left) == visit(right)
  end

  def and_node(*args)
    left, right = args

    visit(left) && visit(right)
  end

  def get_node(subject)
    return DateTime.now.month if subject == 'month'
    return DateTime.now.year if subject == 'year'
  end

  def int_to_char_node(args)
    visit(args).chr
  end

  def plus_node(*args)
    left, right = args

    visit(left) + visit(right)
  end

  def return_node(value)
    value
  end
end
