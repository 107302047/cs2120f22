import data.set

/- #1

Formally prove that if there's an object, a, of some 
type, α, having some property (satisfying a predicate), 
P, then not every object of type α fails to have property, 
P. Add a brief comment before each line of your proof 
script to provide what amounts to the outline of a good
English language proof.
-/

example (α : Type) (P : α → Prop) : (∃ a, P a) → (¬(∀ x, ¬ P x)) :=
begin
-- assign a_has_p to ∃ (a : α), P a
-- assign all_x_not_has_p : ∀ (x : α), ¬P x
assume a_has_p all_x_not_has_p,
-- there exists a with type α and a proof of P a as p_a
cases a_has_p with a p_a, 
-- apply a to all_x_not_has_p that leads to ¬P a
let v := all_x_not_has_p a,
-- contradiction appears
contradiction,
end


/- Extra credit. 

The converse of this proposition is clasically true. If
not every object lacks propery, P, then there must be some
object that has it. If you try to prove the converse in
our constructive logic, what happens? Show you work, and
then briefly but clearly explain exactly what goes wrong.
-/



/- #2

Consider the following binary relation, r, with domain
and co-domain both being ℕ. For each following question,
answer yes/no then briefly justify your answer.

( domain = ℕ, r = {(0,0),(1,1),(2,2)}, co-domain=ℕ )

A. Is this relation reflexive? Yes, every value is related to itself.
B. Is this relation symmetric? Yes, the relation between two values can be inverted.
C. Is this relation transitive? Yes, the relation relates a and b, b and c, a and c.
D. Is this relation an equivalence relation? Yes, since it satisfied reflexive, symmetric and transitive.
-/



/- #3

A binary relation, r, is said to be *anti-symetric* 
if, for all values in its domain, a and b, if r a b 
and if r b a then a = b. Give an example of a familiar
arithmetic relation that's anti-symmetric, and briefly
explain why it's so.

Answer here:
a, b : ℕ 
r a b : b = 2 * a
It only holds when a = b = 0. If a ≠ b then either (r a b) or (r b a) must be false.
-/



/- #4
A binary relation, r, is said to be *asymmetric* if
whenever, for any a and b, if r a b then ¬ r b a. Be
careful to note that asymmetry and antisymmetry are
different properties.  Answer each of the following 
sub-questions. We give you a formal definition of anti
-/

def is_asymmetric 
  {α : Type} 
  (r : α → α → Prop) : Prop 
  := ∀ (a b : α), r a b → ¬ r b a 

/- A.

Name a familar arithmetic relation that's asymmetric
and briefly explain why you think it's asymmetric.

Answer here:
r a b : b = a + 1
r a b means b = a + 1, r b a means a = b + 1, if b = a + 1 is true
a = b + 1 = a + 1 + 1 = a + 2, a ≠ a + 2 therefore r a b → ¬ r b a
-/

/- C: 

An object cannot be related to itself in an asymmetric
relation. First, complete the following informal proof
of this statement.

Proof: Assume α, r, and a are as given (and in particular
assume that r is asymmetric). Now assume r a a. <finish
the proof>.

Answer here (rest of proof): 
r a a → ¬ r a a which lead to contradiction. If r is an asymmetric 
relation the assumption r a a cannot be true.
-/

/- D.

Now prove a closely related proposition formally. 
Add a comment to each line of your formal proof 
so as to construct a good skeleton for a fluent 
English language proof.
-/

example
  (α : Type) 
  (r : α → α → Prop)
  (h : is_asymmetric r) :
¬ ∃ (a : α), r a a :=
begin
-- proof by negation
-- there exists a with type α that has relation r a a
assume exist_raa,
cases exist_raa with a raa,
-- v is the proof that if there's proof of r a a there will be a proof of ¬r a a
let v := h a a,
-- there is a proof of r a a 
let b := v raa,
-- ¬r a a is contradict to r a a
contradiction,
end


/- #5
Prove that equality on an inhabited (non-empty) type 
is not assymetric. In the following formalization we
assume there is a value (a : α), which establishes 
that α is inhabited.
-/

example (α : Type) (a : α): ¬ is_asymmetric (@eq α) :=
begin
unfold is_asymmetric,
assume p,
let b := eq.refl a,
let v := p a a b,
contradiction,
end

/- Extra credit: What exactly goes wrong in a formal 
proof if you drop the "inhibitedness" condition? Give
as much of a formal proof as you can then explain why
it can't be completed (if it can't!).
-/



/- #6
Two natural numbers, p and q, are said to be 
"equivalent mod m" if p % m = q % m, which makes
"equivalence mod m" a binary relation on natural
numbers. Here's a formal definition of this binary
relation on the natural numbers (given an m).
-/

def equiv_mod_m (m : ℕ) : ℕ → ℕ → Prop := 
  λ p q : ℕ, p % m = q % m

/-
Prove using Lean's definition of "equivalence" that 
equiv_mod_m is an equivalence relation for any natural
number, m. Here you'll also use Lean's definitions of
reflexive, symmetric, and transitive. They are as we
have covered in class. 
-/

example : ∀ m : ℕ, equivalence (equiv_mod_m m) :=
begin
unfold equivalence equiv_mod_m reflexive symmetric transitive,
assume m,
split,
assume x,
exact eq.refl (x % m),
split,
assume x y xmym,
rw xmym,
assume x y z xmym ymzm,
rw xmym,
rw ymzm,
end



/- #7
Consider the relation, tin_rel, that associates people 
with U.S. taxpayer id numbers, which we'll represent as 
natural numbers here. 

Assume this relation is single-valued. Which of the 
following properties does this relation have? Give
a very brief justification of each answer. Assume
the domain is all living persons, and the co-domain
is all natural numbers.

-- it's a function: Yes, every person could find one and only one taxpayer id number.
-- it's total: Yes, every person could find one taxpayer id number.
-- it's injective (where "): Yes, if two people has identical taxpayer id number, they must be the same person.
-- it's surjective (where the co-domain is all ℕ): No, there were limited number of people but infinite number of ℕ. 
                                                   Not all taxpayer id number correspond to a person.
-- it's strictly partial: No, there's no one that could'nt find one coresponding taxpayer id number.  
-- it's bijective: No its not surjective therfore its no bijective.
-/



/- #8
Suppose r is the empty relation on the natural 
numbers. Which of the following properties does
it have? Explain each answer enough to show you
know why your answer is correct.

-- reflexive: No r has no relation with any natural numbers
-- symmetric: No, since it has no relation with any natural numbers,
              there were no cases to prove it is symmetric.
-- transitive: No, since it has no relation with any natural numbers,
               there were no cases to prove it is transitive.
-/



/- #9
Here's a formal definition of this empty relation.
That there are no constructors given here means there 
are no proofs, which is to say that no pair can be 
proved to be in this relation, so it must be empty.
-/

inductive empty_rel : ℕ → ℕ → Prop

/-
Formally state and prove you answer for each of the
three properties. That is, for each property assert
either that empty_rel does have it or does not have it, 
then prove your assertion. Include English-language 
comments on each line to give the essential elements 
of a good English language proof.
-/


example : ¬reflexive empty_rel :=
begin
unfold reflexive,
assume h,
let x := h 0,
cases x,
end

example : symmetric empty_rel :=
begin
unfold symmetric,
assume a b h,
cases h,
end

example : transitive empty_rel :=
begin
assume a b c h k,
cases h,
end

/- #10
A relation, r, is said to have the property of being 
a *partial order* if it's reflexive, anti-symmetric,
and transitive. Give a brief English language proof 
that the subset relation on the subsets of any set, 
S (of objects of some type), is a partial order. 

Pf:  
Suppose S is a set, with a ⊆ S and b ⊆ S subsets. Then

1. a is a partial order which is reflexive, anti-symmetric and transitive.
2. b is a partial order which is reflexive, anti-symmetric and transitive.
3. Any subset ⊆ S would be a partial order.

QED.
-/



/- #11 
Finally we return again to DeMorgan's laws, but
now for sets. You'll recall that these "laws" as we
have seent them so far tell us how to distribute ¬  
over ∨ and over ∧. You will also recall that set
intersection (∩) is defined by the conjunction (∧) 
of the membership predicates, set union (∪) by the
disjunction (∨), and set complement (Sᶜ for a set,
S), by negation (¬). It makes sense to hypothesize 
that we can recast DeMorgan's laws in terms of the
distribution of complement over set union and set
intersection. Indeed we can. Your job is to state
and prove (formally) the first DeMorgan laws for 
sets, which states that the complement of a union
of any two sets equals the intersection of their 
complements.

Hint: To prove that two sets are equal, S = T, use
the ext tactic. It applies a bew axiom (called set 
extensionality) that states that to prove S = T it 
suffices to prove S ↔ T, viewing the sets as being
defined by their logical membership predicates. You
know how to handle bi-implications. The rest you 
can do by seeing "not," "and," and "or" in place 
of complement, conjunction, and disjuction, resp.  
-/

example 
  (α : Type) 
  (a b: set α) :
  (a ∪ b)ᶜ = aᶜ ∩ bᶜ := 
begin
end


