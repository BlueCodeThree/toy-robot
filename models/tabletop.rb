class TableTop
    attr_reader :x_max, :x_min, :y_max, :y_min
    def initialize
        @x_min = 0
        @x_max = 5
        @y_min = 0
        @y_max = 5
        @avoid = []
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

    def add_coord_to_avoid(x,y)
        @avoid.push([x,y])
    end

    def check_avoid(x,y)
        @avoid.each do |coord|
            if [x, y] == coord
                return false
            end
        end
        return true
    end


end