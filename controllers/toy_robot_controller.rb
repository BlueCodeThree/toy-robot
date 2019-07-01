require_relative '../models/toy_robot'
require_relative '../views/toy_robot_view'

class ToyRobotController
    def initialize
        @toy_robot_view = ToyRobotView.new
        @toy_robot_model = ToyRobot.new
    end

    def place
        loop do
            input = @toy_robot_view.place.split(/ |, |,/)
            if input[0] == "PLACE"
                break if place_robot(input)
            end
        end
    end

    def place_robot(input)
        if @toy_robot_model.place(input[1].to_i, input[2].to_i, input[3] )
            @toy_robot_view.placed
            return true
        else
            @toy_robot_view.error
        end
    end

    def run
        place
        loop do
            input = @toy_robot_view.input
            case input
            when "MOVE"
                @toy_robot_model.move
            when "LEFT"
                @toy_robot_model.left
            when "RIGHT"
                @toy_robot_model.right
            when "REPORT"
                @toy_robot_view.report(@toy_robot_model.report)
            when "EXIT", "QUIT"
                @toy_robot_view.exit
                break
            else
                if input.split(/ |, |,/)[0] == "PLACE"
                    place_robot(input.split(/ |, |,/))
                else
                    @toy_robot_view.error
                end
            end
        end
    end
end