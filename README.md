# Toy Robot

## Readify Challenge

by Carlie Hamilton

An application coded in ruby using a MVC model of organisation. The application runs a toy robot on a table top, issuing commands using a CLI interface.

## Installing Dependencies

This is built with ruby version 2.6.3. Check what version you have with
```ruby -v```

- [Information to install ruby](https://www.ruby-lang.org/en/documentation/installation/)

You will also need to have Bundler installed. You can check to see if it is installed with `bundle -v`

To install bundler, use the following command - `gem install bundler`

Once ruby is installed on your machine, navigate to the main directory and install the dependencies using bundler

`bundle install`

This should install rspec on to your machine. Rspec is used for testing the code.

## How To Run

Navigate on your machine to the main directory of this and run the program with the command -

```ruby app.rb```

This is the command line interface for the robot.

## Commands

- PLACE X,Y,DIRECTION
- MOVE
- LEFT
- RIGHT
- REPORT

### How to use the Toy Robot

- You must first place the robot down correctly before you can move or report on the robot, with the PLACE command. For example `PLACE 0,0,NORTH`
- The robot can be placed on a 5x5 tabletop grid. The South West corner is (0,0), and the North East corner is (4,4)
- The robot is also placed facing either NORTH, SOUTH, EAST or WEST
- Once placed, the robot can take other commands, including additional place commands.
- MOVE will move the robot one unit forward in the direction it's facing
- LEFT and RIGHT will rotate the robot 90 degrees without moving it's position.
- REPORT will announce the X, Y and direction the robot is facing.

EXIT or QUIT will exit out of the program.

## Testing

You can test the robot by navigating to the main directory of this program and running the command
```rpec -f documentation```