class ToyRobotView
    def place
        puts "Please place your toy robot:"
        return gets.strip
    end

    def error
        puts
        puts "Your input was invalid. Please try again."
    end

    def placed
        puts
        puts "Your toy robot has been placed on the tabletop."
    end

    def input
        puts
        puts "Please enter your command:"
        return gets.strip
    end

    def report(report_details)
        puts "#{report_details[0]},#{report_details[1]},#{report_details[2]}"
    end

    def exit
        puts "Shutting down"
    end
end