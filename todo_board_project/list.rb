require "byebug"
require_relative "./item.rb"

class List

    attr_writer :label
    attr_reader :items
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def swap(index_1, index_2)
        return false if @items[index_1].nil? || @items[index_2].nil?

        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts @label
        puts "Index, Item, Deadline"

        @items.each_with_index do |item, i|
        puts  i.to_s + ", " + item.title + ", " + item.deadline
        end
    end

    def print_full_item(index)
        puts self[index].to_s if !self[index].nil?
    end

    def print_priority
        self.print_full_item(0)
    end

    def down(index, amount=1)
        debugger

        i = index
        return false if @items[index].nil?

        while i < index + amount || i != self.size - 1 
            self.swap(i, i+1)
            i += 1
        end
    end
    true
end

my_list = List.new("Groceries")
my_list.add_item('cheese', '2019-10-25')
my_list.add_item('toothpaste', '2019-10-25')
my_list.add_item('shampoo', '2019-10-24')
my_list.add_item("candy", "2019-10-31")

my_list.print
my_list.down(0, 2)
my_list.print

