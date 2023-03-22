#lang forge
-- Import all the elevator procedures to critique, along with
--   all of the sigs and predicates:
open "elevator.frg"


/*------------------------------------*\
|    Elevator Procedure Descriptions   |
\*------------------------------------*/

-- We provide the source code for 5 different procedures in elevator.frg. 
--   Based on the code and its comments, what documentation do you think would best describe each procedure? 
--   Think about the differences between the procedures and how to best communicate them. 

-- Procedure 1:
--   TODO: 

-- Procedure 2:
--   TODO:  

-- Procedure 3:
--   TODO: 

-- Procedure 4:
--   TODO: 

-- Procedure 5:
--   TODO: 


/*------------------------------------*\
|    Model Properties + Verification   |
\*------------------------------------*/

-- TODO: encode a few predicates to test the properties of the overall model
--   and verify whether or not they hold in the following test-expect block

-- Hint: Think about what is/ isn't possible within the limitations of the model!

// Property: Movement is only possible when the elevator's door is closed
pred elevatorOnlyMoveWhenDoorClosed[e: Elevator] {
	e.floor != e.floor' => e.door = Closed
}

test expect {
	-- TODO: test overall model properties here
	test1: {traces implies elevatorOnlyMoveWhenDoorClosed[Elevator]} for exactly 1 Elevator is theorem
	
}


/*-------------------------------------------------*\
|    Elevator Procedure Properties + Verification   |
\*-------------------------------------------------*/

-- TODO: encode a few predicates to test the properties of the elevator procedures
--   and verify whether or not they hold in the following test-expect blocks. Remember
--   that procedures 4 and 5 make use of the `nextRequest` and `lastMove` Elevator
--   fields, so be sure to write predicates that test properties of these fields for
--   those procedures

-- Hint: Think about what behavior is allowed/ expected by each procedure!

// Property: forward progress is always possible
pred forwardProgress[e: Elevator] {
	always eventually enabled[e]
}



test expect {
	-- TODO: test procedure1 properties here
	fp1: {traces and always procedure1[Elevator] implies forwardProgress[Elevator]} for exactly 1 Elevator is theorem

}

test expect {
	-- TODO: test procedure2 properties here
	fp2: {traces and always procedure2[Elevator] implies forwardProgress[Elevator]} for exactly 1 Elevator is theorem

}

test expect {
	-- TODO: test procedure3 properties here
	fp3: {traces and always procedure3[Elevator] implies forwardProgress[Elevator]} for exactly 1 Elevator is theorem
}

test expect {
	-- TODO: test procedure4 properties here
	fp4: {traces and always procedure4[Elevator] implies forwardProgress[Elevator]} for exactly 1 Elevator is theorem

}

test expect {
	-- TODO: test procedure5 properties here
	fp5: {traces and always procedure5[Elevator] implies forwardProgress[Elevator]} for exactly 1 Elevator is theorem

}


/*-------------------------------------*\
|    Challenge Problem: Two Elevators   |
\*-------------------------------------*/

-- This predicate is meant to help test various procedures:
--   just change which procedure is being called here (in one place)
--   and the controller will follow suit.
pred runElevatorProcedure[e: Elevator] {
	procedure5[e]
}

-- The controller, depending on its own needs (which are incomprehensible to
--   mortals and people who work in the CIT) will allow some elevator(s) to go
--   in every state (but not necessarily all of them).
-- This predicate is needed for the challenge problem, but not sooner. 
pred elevatorControl {
	traces
	always {some e: Elevator | runElevatorProcedure[e]}
    always {all e: Elevator | not runElevatorProcedure[e] => stayStill[e]}
}

-- TODO: Add a constraint that ensures procedures work for multiple elevators. 

-- TODO: Test your constraint on predicates from the previous tasks.