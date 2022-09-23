class Item
    def self.valid_date?(date_string)
        return false if date_string.length != 10
        return false if date_string[5..6].to_i > 12
        return false if date_string[8..9].to_i > 31 || date_string[8..9].to_i < 1
        return false if date_string[4] != "-" || date_string[7] != "-"
        true
    end

    attr_accessor :title, :description
    def initialize(title, deadline, description)
        raise "deadline is not valid" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(date_string)
        raise "deadline is not valid" if !Item.valid_date?(date_string)
        @deadline = date_string if Item.valid_date?(date_string)
    end
end