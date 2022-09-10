# Be sure you've done pip install z3-solver
from telnetlib import X3PAD
from z3 import *


# Here's a file you can often copy as a starting 
# point on a working program to solve some problem
# of interest. Here the problem is to compute and
# return a non-negative square root of argument, n 
def hw2():
    
    
    # Create z3 variable(s) representing the unknown
    # Here, the unknown, x, is the square root of n.
    X, Y, Z = Bools('X Y Z')
    
    s = Solver()
    
    # 1. X ∨ Y, X ⊢ ¬Y 
    # As proposition in PL: ((X \/ Y) /\ X) -> ~Y
    C1 = Implies(And(Or(X,Y),X),Not(Y))
    
    s.add(Not(C1))
    # I believe it's not valid
  
    r = s.check()
    
    # If there's a model/solution return it 
    if (r == unsat):
        print("C1 is valid")
    # otherwise return inconsistent value for error
    else :
        print("C1 is not valid. Here's a counter-example: ", s.model() )
        # If X = true, Y = true, X ∨ Y would be true but ¬Y would be false
    
    s.reset()
    C2 = Implies(And(X, Y), And(X, Y))
    # If X is true, Y is true, then X ∨ Y must be true
    s.add(Not(C2))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C2 is valid")
    else :
        print("C2 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C3 = Implies(And(X, Y), X)
    # If X ∨ Y is true, then X must be true
    s.add(Not(C3))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C3 is valid")
    else :
        print("C3 is not valid. Here's a counter-example: ", s.model() )
    
    s.reset()
    C4 = Implies(And(X, Y), Y)
    # If X ∨ Y is true, then Y must be true
    s.add(Not(C4))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C4 is valid")
    else :
        print("C4 is not valid. Here's a counter-example: ", s.model() )
    
    s.reset()
    C5 = Implies(Not(Not(X)), X)
    # If ¬¬X is true, then X must be true
    s.add(Not(C5))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C5 is valid")
    else :
        print("C5 is not valid. Here's a counter-example: ", s.model() )
    
    s.reset()
    C6 = Not(And(X, Not(X)))
    # The negation of X and not X
    s.add(Not(C6))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C6 is valid")
    else :
        print("C6 is not valid. Here's a counter-example: ", s.model() )
    
    s.reset()
    C7 = Implies(X, Or(X, Y))
    # If X is true, X ∨ Y must be true
    s.add(Not(C7))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C7 is valid")
    else :
        print("C7 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C8 = Implies(Y, Or(X, Y))
    # If Y is true, X ∨ Y must be true
    s.add(Not(C8))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C8 is valid")
    else :
        print("C8 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C9 = Implies(And(Implies(X, Y), Not(X)), Not(Y))
    # If not X is true and X → Y is true, not Y must be true
    s.add(Not(C9))
    # I believe it's not valid
    r = s.check()
    if (r == unsat):
        print("C9 is valid")
    else :
        print("C9 is not valid. Here's a counter-example: ", s.model())
        # If X = false and Y = true, not X is true and X → Y is true, but not Y would be false

    s.reset()
    C10 = Implies(And(Implies(X, Y), Implies(Y, X)), And(Implies(X, Y), Implies(Y, X)))
    # If X → Y is true and Y → X is true, X ↔ Y must be true
    s.add(Not(C10))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C10 is valid")
    else :
        print("C10 is not valid. Here's a counter-example: ", s.model() )
    
    s.reset()
    C11 = Implies(And(Implies(X, Y), Implies(Y, X)), Implies(X, Y))
    # If X ↔ Y is true, X → Y must be true
    s.add(Not(C11))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C11 is valid")
    else :
        print("C11 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C12 = Implies(And(Implies(X, Y), Implies(Y, X)), Implies(Y, X))
    # If X ↔ Y is true, Y → X must be true
    s.add(Not(C12))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C12 is valid")
    else :
        print("C12 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C13 = Implies(And(Or(X, Y), Implies(X, Z), Implies(Y, Z)), Z)
    # If X ∨ Y is true, X → Z is true, Y → Z is true, Z must be true
    s.add(Not(C13))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C13 is valid")
    else :
        print("C13 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C14 = Implies(And(Implies(X, Y), Y), X)
    # If X → Y is true, Y is true, X must be true
    s.add(Not(C14))
    # I believe it's not valid
    r = s.check()
    if (r == unsat):
        print("C14 is valid")
    else :
        print("C14 is not valid. Here's a counter-example: ", s.model() )
        # If X = false, Y = true, then X → Y is true but X is false

    s.reset()
    C15 = Implies(And(Implies(X, Y), X), Y)
    # If X → Y is true, X is true, Y must be true
    s.add(Not(C15))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C15 is valid")
    else :
        print("C15 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C16 = Implies(And(Implies(X, Y), Implies(Y, Z)), Implies(X, Z))
    # If X → Y is true, Y → Z is true, X → Z must be true
    s.add(Not(C16))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C16 is valid")
    else :
        print("C16 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C17 = Implies(Implies(X, Y), Implies(Y, X))
    # If X → Y is true, Y → X must be true
    s.add(Not(C17))
    # I believe it's not valid
    r = s.check()
    if (r == unsat):
        print("C17 is valid")
    else :
        print("C17 is not valid. Here's a counter-example: ", s.model() )
        # If X is false, Y is true, X → Y is true, but Y → X would be false

    s.reset()
    C18 = Implies(Implies(X, Y), Implies(Not(Y), Not(X)))
    # If X → Y is true, ¬Y → ¬X must be true
    s.add(Not(C18))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C18 is valid")
    else :
        print("C18 is not valid. Here's a counter-example: ", s.model() )
        
    s.reset()
    C19 = And(Implies(Not(Or(X, Y)), And(Not(X), Not(Y))), Implies(And(Not(X), Not(Y)), Not(Or(X, Y))))
    # If the negation of X ∨ Y is equivalent to ¬X ∧ ¬Y
    s.add(Not(C19))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C19 is valid")
    else :
        print("C19 is not valid. Here's a counter-example: ", s.model() )

    s.reset()
    C20 = And(Implies(Not(And(X, Y)), Or(Not(X), Not(Y))), Implies(Or(Not(X), Not(Y)), Not(And(X, Y))))
    # If the negation of X ∧ Y is equivalent to ¬X ∨ ¬Y
    s.add(Not(C20))
    # I believe it's valid
    r = s.check()
    if (r == unsat):
        print("C20 is valid")
    else :
        print("C20 is not valid. Here's a counter-example: ", s.model() )

hw2()