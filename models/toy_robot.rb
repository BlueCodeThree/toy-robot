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
        elsif @direction == "NORTH EAST"
            (@y += 1 && @x += 1) if @x < @tabletop.x_max && @y < @tabletop.y_max && @tabletop.check_avoid(@x + 1, @y + 1)
        elsif @direction == "NORTH WEST"
            (@y += 1 && @x -= 1) if @y < @tabletop.y_max && @x > @tabletop.x_min && @tabletop.check_avoid(@x - 1, @y + 1)
        elsif @direction == "SOUTH EAST"
            (@y -= 1 && @x += 1) if @y > @tabletop.y_min && @x < @tabletop.x_max && @tabletop.check_avoid(@x + 1, @y - 1)
        elsif @direction == "SOUTH WEST"
            (@y -= 1 && @x -= 1) if @y > @tabletop.y_min && @x > @tabletop.x_min && @tabletop.check_avoid(@x - 1, @y - 1)
        end
    end

    def left
        case @direction
        when "NORTH"
            @direction = "NORTH WEST"
        when "NORTH WEST"
            @direction = "WEST"
        when "WEST"
            @direction = "SOUTH WEST"
        when "SOUTH WEST"
            @directon = "SOUTH"
        when "SOUTH"
            @direction = "SOUTH EAST"
        when "SOUTH EAST"
            @direction = "EAST"
        when "EAST"
            @direction = "NORTH EAST"
        when "NORTH EAST"
            @direction = "NORTH"
        end
    end

    def right
        case @direction
        when "NORTH"
            @direction = "NORTH EAST"
        when "NORTH EAST"
            @direction = "EAST"
        when "EAST"
            @direction = "SOUTH EAST"
        when "SOUTH EAST"
            @direction = "SOUTH"
        when "SOUTH"
            @direction = "SOUTH WEST"
        when "SOUTH WEST"
            @direction = "WEST"
        when "WEST"
            @direction = "NORTH WEST"
        when "NORTH WEST"
            @direction = "NORTH"
        end
    end

    def report
        return [@x, @y, @direction]
    end

end