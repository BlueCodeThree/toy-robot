require_relative 'tabletop'

class ToyRobot
    attr_reader :tabletop, :x, :y
    def initialize
        @tabletop = TableTop.new
    end

    def place(x, y, direction_facing)
        @x = x
        @y = y
        @direction = direction_facing

        @tabletop.check_direction_is_valid(direction_facing) && @tabletop.check_placed_on_grid(x,y) ? true : false
    end

    def move
        if @direction == "NORTH"
            @y += 1 if @y < @tabletop.y_max
        elsif @direction == "SOUTH"
            @y -= 1 if @y > @tabletop.y_min
        elsif @direction == "EAST"
            @x += 1 if @x < @tabletop.x_max
        elsif @direction == "WEST"
            @x -= 1 if @x > @tabletop.x_min
        end
    end

    def left
        case @direction
        when "NORTH"
            @direction = "WEST"
        when "EAST"
            @direction = "NORTH"
        when "SOUTH"
            @direction = "EAST"
        when "WEST"
            @direction = "SOUTH"
        end
    end

    def right
        case @direction
        when "NORTH"
            @direction = "EAST"
        when "EAST"
            @direction = "SOUTH"
        when "SOUTH"
            @direction = "WEST"
        when "WEST"
            @direction = "NORTH"
        end
    end

    def report
        return [@x, @y, @direction]
    end
end