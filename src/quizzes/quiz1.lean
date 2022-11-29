/-
CS2120 Fall 2022 Sullivan. Quiz #1. Edit your answers into
this file using VSCode. Save the file to your *local* hard 
drive (File > Save As > local > ...). Submit it to the Quiz1
assignment on Collab.
-/

/-
#1: For each of the following questions give a yes/no answer 
and then a very brief explanation why that answer is correct.
To explain why your answer is correct, name the specific rule
of inference that tells you it's correct, or explain that 
there is no such valid inference rule.
-/

/-
#1A

If a ball, b, is round *and* b is also red, is b red?

A: yes/no: Yes

B: Why? 
We can derived that b is red by applying and_elimination_right rule to b is round and red.



#1B

If flowers make you happy and chocolates make you happy,
and I give you flowers *or* I give you chocolates, will
you be happy?

A: yes/no: Yes.

B: Why? 
If we know that I am given flowers or chocolate and either of them could make me happy, 
<<<<<<< HEAD
we can apply or_elimination rule to conclude that I am happy.
=======
we can apply or_elimoination rule to conclude that I am happy.
>>>>>>> a0eb0546845ec83b144a4227ed6d0ec7a42cb5a1


#1C: If giraffes are just zebras in disguise, then the 
moon is made of green cheese?

A. yes/: No.

B. Why?
There is no clear relationship between two statements 
that we could'nt come up with an inference rule to apply. 


#1D. If x = y implies that 0 = 1, then is it true that
x ≠ y?

A. yes/no: Yes. 

B. Why? 
If we have a proof of x = y, we can derived a proof of 0 = 1. 
However we couln't find a proof 0 = 1 which indecates that
there's no proof of x = y which means x ≠ y.



#1E. If every zebra has stripes and Zoe is a Zebra then
Zoe has stripes.

A. yes/no: Yes.

B. Why?
By applying ∀ elimination rule. If being any zebra z implies 
z has stripes and Zoe is a particular zebra which implies Zoe 
has stripes. 


#1F. If Z could be *any* Zebra and Z has stripes, then 
*every* Zebra has stripes.

A. Yes/no: Yes.

B: Why?
By arrow_forall_equivalent rule, if Z being a zebra
implies that Z has stripes, it impies that for all the
Z if Z happen to be a zebra, Z has stripes.



#1G. If whenever the wind blows, the leaves move, and 
the leaves are moving, then the wind is blowing.

A. yes/no: No.

B. Why? 
The wind blows implies that the leaves are moving doesn't 
necessary means that the leaves moving implies that the 
wind blows.


#1H: If Gina is nice *or* Gina is tall, and Gina is nice,
then Gina is not tall. (The "or" here is understood to be
the or of predicate logic.)

A. yes/no: No.

B. Why? 
If Gina is tall and nice, Gina is tall or Gina is nice would 
be true, Gina is nice would be true but Gina is not tall 
would be false.
-/



/- 
#2

Consider the following formula/proposition in propositional
logic: X ∨ ¬Y.

#2A: Is is satisfiable? If so, give a model (a binding of 
the variables to values that makes the expressions true).
Its satisfiable.
(X:true, Y:true), (X:true, Y:False), (X:false, Y:false)



#2B: Is it valid? Explain your answer. 
It's not valid.
X ∨ ¬Y would be false if X is false and Y is true.
-/


/-
#3: 

Express the following propositions in predicate logic, by
filling in the blank after the #check command.

If P and Q are arbitrary (any) propositions, then if (P is 
true if and only if Q is true) then if P is true then Q is 
true.
-/

#check ∀ (P Q:Prop), P ↔ Q → (P → Q) 



/-
#4 Translate the following expressions into English.
The #check commands are just Lean commands and can
be ignored here. 
-/


-- A
#check ∀ (n m : ℕ), n < m → m - n > 0

/-
Answer:
For all natural number n and m, if we have a proof 
that n is smaller than m then we can derived a proof 
that m minus n will be greater than 0

-/

-- B

#check ∃ (n : ℕ), ∀ (m : nat), m >= n

/-
Answer: 
There exists natural number n that all the natural number
m is bigger or equal to n.
-/


-- C

variables (isEven: ℕ → Prop) (isOdd: ℕ → Prop)
#check ∀ (n : ℕ), isEven n ∨ isOdd n

/-
Answer:
For all natural number n, n is even or odd. 
-/


-- D

#check ∀ (P : Prop), P ∨ ¬P

/-
Answer:
For all proposition P, P is true or false.
-/


-- E

#check ∀ (P : Prop), ¬(P ∧ ¬P)

/-
Answer:
For all proposition P, P cannot the both true and false.
-/


/-
#5 Extra Credit

Next we define contagion as a proof of a slightly long
proposition. Everything before the comma introduces new
terms, which are then used after the comma to state the
main content of the proposition. 

Using the names we've given to the variables to infer
real-world meanings, state what the logic means in plain
natural English. Please don't just give a verbatim reading
of the formal logic. 
-/

variable contagion : 
  ∀ (Animal : Type) 
  (hasVirus : Animal → Prop) 
  (a1 a2 : Animal) 
  (hasVirus : Animal → Prop)
  (closeContact : Animal → Animal → Prop), 
  hasVirus a1 → closeContact a1 a2 → hasVirus a2

/-
For all animal a1 a2, if we have a proof that a1 has virus 
and we also have a proof that a1 a2 have close contact then
we can derived that a2 has virus.
-/


