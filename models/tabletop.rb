class TableTop
    attr_reader :x_max, :x_min, :y_max, :y_min
    def initialize
        @x_min = 0
        @x_max = 4
        @y_min = 0
        @y_max = 4
    end

    def check_direction_is_valid(direction)
        case direction
        when "NORTH", "EAST", "SOUTH", "WEST"
            return true
        else
            return false
        end
    end

    def check_placed_on_grid(x,y)
        if x >= @x_min && x <= x_max && y >= y_min && y <= y_max
            return true
        else
            return false
        end
    end

end