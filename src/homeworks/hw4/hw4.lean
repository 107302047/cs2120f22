/-
CS 2120 F22 Homework #4. Due Oct 13.
-/

/- #1A [10 points]

Write a formal proposition stating that 
logical and (∧) is associative. That is, 
for arbitrary propositions, P, Q, and R,
P ∧ (Q ∧ R) is true *iff* (P ∧ Q) ∧ R is, 
too. Replace the placeholder (_) with your
answer.
-/

def and_associative : Prop := 
  ∀ (P Q R: Prop), P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R


/- #1B [10 points]

Give an English language proof. Identify
the inference rules of predicate logic
that you use in your reasoning.
-/

/-
Answer: 
Split it into two cases P ∧ (Q ∧ R) → (P ∧ Q) ∧ R and (P ∧ Q) ∧ R → P ∧ (Q ∧ R).
Start by proving P ∧ (Q ∧ R) → (P ∧ Q) ∧ R. Apply and_elimination_left to P ∧ (Q ∧ R)
to get a proof of P. Apply and_elimination_right to P ∧ (Q ∧ R) to get a proof of Q ∧ R
Apply and_elimination_left to Q ∧ R and get a proof of Q. Apply and_elimination_right 
to Q ∧ R and get a proof of R. Apply and_introduction to P Q to get a proof of (P ∧ Q). 
Apply and_introduction to (P ∧ Q) and R to get a proof of (P ∧ Q) ∧ R.

Then continue by proving (P ∧ Q) ∧ R → P ∧ (Q ∧ R). Apply and_elimination_right to
(P ∧ Q) ∧ R to get a proof of R. Apply and_elimination_left to (P ∧ Q) ∧ R to get a proof 
of (P ∧ Q). Apply and_elimination_left to (P ∧ Q) to get a proof of P. Apply 
and_elimination_right to (P ∧ Q) to get a proof of Q. Apply and_introduction to Q R to get
a proof of (Q ∧ R). Apply and_introduction to P and (Q ∧ R) to get a proof of P ∧ (Q ∧ R).

-/

/- #1C [5 points]

Give a formal proof of the proposition.
Hint: unfold and_associative to start.
-/

theorem and_assoc_true : and_associative :=
begin
unfold and_associative,
assume P Q R,
split,
assume h,
let p := h.left,
let q := h.right.left,
let r := h.right.right,
let pq := and.intro p q,
apply and.intro pq r,
intros h2,
let p := h2.left.left,
let q := h2.left.right,
let r := h2.right,
exact and.intro p(and.intro q r),
end



/- #2A [10 points]

Write the proposition that ∨ is associative.,
analogous to the proposition about ∧ in #1.
-/

def or_associative : Prop := 
  ∀ (P Q R: Prop), P ∨ (Q ∨ R) ↔ (P ∨ Q) ∨ R


/- #2B [10 points]

Write an English language proof of it, citing
the specific inference rules you use in your
reasoning.
-/

/-
Answer:
Split it into two cases P ∨ (Q ∨ R) → (P ∨ Q) ∨ R and (P ∨ Q) ∨ R → P ∨ (Q ∨ R).
Start by proving P ∨ (Q ∨ R) → (P ∨ Q) ∨ R. 
-/


/- #2C [5 points]

Complete the following formal proof.
-/

theorem or_associative_true : or_associative :=
begin
unfold or_associative,
intros P Q R,
split,
intros h,
cases h,
apply or.intro_left,
apply or.intro_left,
exact h,
cases h,
apply or.intro_left,
apply or.intro_right,
exact h,
apply or.intro_right,
exact h,
intros h,
cases h,
cases h,
apply or.intro_left,
exact h,
apply or.intro_right,
apply or.intro_left,
exact h,
apply or.intro_right,
apply or.intro_right,
exact h,
end


/- #3A [10 points]
Write a formal statement of the proposition.
-/

def arrow_transitive : Prop :=
  ∀ (X Y Z: Prop), (X → Y) → (Y → Z) → X → Z


/- #3B [10 points]

Write an English language proof of the proposition
that for any propositions, X, Y, and X, it's the
case that (X → Y) → (Y → Z) → (X → Z). In other
words, implication is "transitive." Hint: Recall
that if you have a proof of, say, X → Y, and you 
have a proof of X, you can derive a proof of Y by
arrow elimination. Think of it as applying a proof
of an implication to a proof of its premise to get
yourself a proof of its conclusion.
-/


/- #3C [5 points]. 
Write a formal proof of it.
-/

theorem arrow_transitive_true : arrow_transitive :=
begin
unfold arrow_transitive,
assume X Y Z XY YZ x,
exact YZ(XY x),
end


/- #4
Suppose that if it's raining then the streets
are wet. This problem requires you to prove that
if the streets are not wet then it's not raining.
-/

/- #4A [10 points]

Start by writing the proposition in predicate
logic by completing the following answer.
-/

def contrapositive : Prop :=
  ∀ (Raining Wet : Prop), 
    (Raining → Wet) → (¬Wet → ¬Raining)


/- #4B [10 points]. 
-/

theorem contrapositive_valid : contrapositive :=
begin
unfold contrapositive,
intros Raining Wet h nwet nr,
let w := h nr,
exact nwet w,
-- contradiction
end


/- #4C [5 points]. 

Give an English language proof of it.
-/


/- #5. Extra credit.

Complete the following formal proof of the 
proposition that if for any proposition P, 
P ∨ ¬P is true, then for any propositions, 
X and Y, if it's not the case that X or Y
is true then it is the case that ¬X and ¬Y 
is true. 
-/

theorem demorgan1 : 
  (∀ (P : Prop), P ∨ ¬ P) → 
    ∀ (X Y : Prop), 
      ¬(X ∨ Y) → (¬X ∧ ¬Y) :=
begin
assume em X Y nxory,
cases (em X) with x nx,
let foo := or.intro_left Y x,
_
end

/-
A comment on or.intro_left and or.intro_right.
In Lean each of these takes two arguments: a
proof of the disjunct -- the proposition on 
one side of the ∨ -- that is to be proven true, 
*and* it takes as an argument the proposition 
that is not being proven true. In applications 
of these rules the proposition argument (not 
being proven) comes first, while the proof 
argument comes second.

The reason is that Lean needs to know what 
overall proposition is being proved. From the
proof argument it can infer the proposition 
being proved, but it needs the other proposition
as well to know the full (X ∨ Y) disjunction to
be proved. 

Here's an example:
-/

example : 0 = 0 ∨ 0 = 1 :=
begin
apply or.intro_left (0 = 1) rfl
/-
The "rfl" serves as a proof of 0=0.
But in addition, as the first argument
to or.intro, we need to provide the
*proposition* that is not being proved.
Here's that's (0 = 1). In contexts
where Lean can infer both disuncts,
you can use the simpler or.inl or 
or.inr, each of which just takes one
argument: a proof of the left or of 
the right side, respectively.
-/
end

