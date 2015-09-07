require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store.each { |list| return true if list.include?(key) }
    false
  end

  def set(key, value)
    list = get_list(key)
    link = list.get(key)
    if link.nil?
      list.insert(key, value)
      @count += 1
      resize! if @count == num_buckets
    else
      link.val = value
    end
  end

  def get_list(key)
    idx = key.hash % num_buckets
    @store[idx]
  end

  def get(key)
    get_list(key).get(key)
  end

  def delete(key)
    get_list(key).remove(key)
    @count -= 1
  end

  def each(&block)
    @store.each do |list|
      next if list.empty?
      list.each do |link|
        # debugger
        block.call(link.key, link.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = num_buckets * 2
    new_store = Array.new(new_buckets) { LinkedList.new }
    each do |key, val|
      idx = key.hash % (new_buckets)
      new_store[idx].insert(key, val)
    end
    @store = new_store
  end

  # def resize!
  #   new_buckets = num_buckets * 2
  #   old_store = @store
  #   @store = Array.new(new_buckets) { LinkedList.new }
  #   old_store.each do |list|
  #     list.each do |link|
  #       get_list(link.key).insert(link.key, link.val)
  #     end
  #   end
  # end


  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
