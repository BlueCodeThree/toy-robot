require_relative 'tabletop'

class ToyRobot
    attr_reader :tabletop, :x, :y, :direction
    def initialize
        @tabletop = TableTop.new
        @direction = ""
    end

    def place(x, y, direction_facing)
        if direction_facing == nil
            direction_facing = @direction
        end
        if @tabletop.check_avoid(x,y) && @tabletop.check_direction_is_valid(direction_facing) && @tabletop.check_placed_on_grid(x,y)
            @x = x
            @y = y
            @direction = direction_facing
            return true
        else
            return false
        end
    end

    def move
        if @direction == "NORTH"
            @y += 1 if @y < @tabletop.y_max && @tabletop.check_avoid(@x, @y + 1)
        elsif @direction == "SOUTH"
            @y -= 1 if @y > @tabletop.y_min && @tabletop.check_avoid(@x, @y - 1)
        elsif @direction == "EAST"
            @x += 1 if @x < @tabletop.x_max && @tabletop.check_avoid(@x + 1, @y)
        elsif @direction == "WEST"
            @x -= 1 if @x > @tabletop.x_min && @tabletop.check_avoid(@x - 1, @y)
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