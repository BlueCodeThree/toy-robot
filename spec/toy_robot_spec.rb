require_relative '../models/toy_robot'

describe "Toy Robot Not Placed Correctly" do
    it "shouldn't work if not placed on the grid - x axis" do
        expect( ToyRobot.new.place(7,0,"NORTH") ).to be false
    end
    it "shouldn't work if not placed on the grid - y axis" do
        expect( ToyRobot.new.place(0,7,"NORTH") ).to be false
    end
    it "should return false if direction not valid" do
        expect( ToyRobot.new.place(0,0,"42") ).to be false
    end
end
describe "Toy Robot Placed Correctly" do

    it "should return true" do
        expect(ToyRobot.new.place(0,0,"NORTH")).to be true
    end
    it "should return true" do
        expect(ToyRobot.new.place(1,2,"EAST")).to be true
    end
end
describe "Toy Robot Moving" do
    it "should move one place to the North" do
        robot = ToyRobot.new
        robot.place(0,0,"NORTH")
        expect(robot.move).to eq(1)
        expect(robot.report).to eq([0,1,"NORTH"])
    end
    it "should move two places to the East" do
        robot = ToyRobot.new
        robot.place(0,0,"EAST")
        robot.move
        expect(robot.move).to eq(2)
        expect(robot.report).to eq([2,0,"EAST"])
    end
    it "should not move past the boundaries of the tabletop - top" do
        robot = ToyRobot.new
        robot.place(0,0,"NORTH")
        robot.move
        robot.move
        robot.move
        robot.move
        robot.move
        expect(robot.move).to eq(6)
        expect(robot.move).to eq(nil)
        expect(robot.report).to eq([0,6,"NORTH"])
    end
    it "should not move past the boundaries of the tabletop - bottom" do
        robot = ToyRobot.new
        robot.place(0,0,"WEST")
        robot.move
        expect(robot.report).to eq([0,0,"WEST"])
    end
end
describe "Toy Robot Moving Left and Right" do
    it "should change directions without moving - left" do
        robot = ToyRobot.new
        robot.place(0,0,"NORTH")
        expect(robot.left).to eq("WEST")
        expect(robot.report).to eq([0,0,"WEST"])
    end
    it "should change directions without moving - right" do
        robot = ToyRobot.new
        robot.place(0,0,"NORTH")
        expect(robot.right).to eq("EAST")
        expect(robot.report).to eq([0,0,"EAST"])
    end
    it "should move in the new direction" do
        robot = ToyRobot.new
        robot.place(1,2,"EAST")
        robot.move
        robot.move
        robot.left
        robot.move
        expect(robot.report).to eq([3,3, "NORTH"])
    end
    it "should not go past the boundaries of the table" do
        robot = ToyRobot.new
        robot.place(1,2,"EAST")
        robot.move
        robot.move
        robot.left
        robot.move
        robot.move
        robot.move
        robot.move
        robot.move
        expect(robot.report).to eq([3,6, "NORTH"])
    end
end
describe "Toy Robot Can Be Placed Again" do
    it "should change the position of the toy robot when placed again" do
        robot = ToyRobot.new
        robot.place(0,0,"NORTH")
        expect(robot.report).to eq([0,0,"NORTH"])
        robot.move
        expect(robot.report).to eq([0,1,"NORTH"])
        robot.place(2,3,"WEST")
        expect(robot.report).to eq([2,3,"WEST"])
    end
end