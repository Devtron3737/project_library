require 'byebug'

class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    link = @head
    until link.next == nil
      link = link.next
    end
    link
  end

  def empty?
    @head.key.nil?
  end

  def get(key)
    _, link = return_link_with_prev(key)
    link.nil? ? link : link.val
  end

  def include?(key)
    !get(key).nil?
  end

  def insert(key, val)
    if @head.key.nil?
      @head.key = key
      @head.val = val
    else
      last.next = Link.new(key, val) unless include?(key)
    end
  end

  def remove(key)
    if @head.key == key
      @head.next.nil? ? @head = Link.new : @head = @head.next
    else
      prev, link = return_link_with_prev(key)
      prev.next = link.next
    end
  end

  def each(&block)
    link = @head
    until link.nil?
      block.call(link)
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

  private

  def return_link_with_prev(key, prev = nil)
    link = @head
    until link.nil? || link.key == key
      prev = link
      link = link.next
    end

    [prev, link]
  end

end
