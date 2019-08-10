module Semiring

open FStar.Algebra.CommMonoid
open FStar.Tactics.CanonCommSemiring
open FStar.Tactics
open FStar.Mul

#set-options "--max_fuel 0 --max_ifuel 0 --z3rlimit 10"

///
/// Ring of integers modulo 2^130 - 5 (the Poly1305 prime)
///
///

let prime: pos =
  normalize_term_spec (pow2 130 - 5);
  pow2 130 - 5

let ring : eqtype = a:nat{a < prime}

[@canon_attr]
let zero : ring = 0

[@canon_attr]
let one : ring = normalize_term_spec prime; 1

//[@(strict_on_arguments [0;1])]
let ( +% ) (a b:ring) : ring = (a + b) % prime

//[@(strict_on_arguments [0;1])]
let ( *% ) (a b:ring) : ring = (a * b) % prime

val add_identity: a:ring -> Lemma (zero +% a == a)
let add_identity a = normalize_term_spec prime

val mul_identity: a:ring -> Lemma (one *% a == a)
let mul_identity a = normalize_term_spec prime

#set-options "--z3cliopt smt.arith.nl=false"

val add_associativity: a:ring -> b:ring -> c:ring
  -> Lemma (a +% b +% c == a +% (b +% c))
let add_associativity a b c =
  normalize_term_spec prime;
  calc (==) {
    a +% b +% c;
    == { }
    ((a + b) % prime + c) % prime;
    == { Math.Lemmas.lemma_mod_plus_distr_l (a + b) c prime }
    ((a + b) + c) % prime;
    == { }
    (a + (b + c)) % prime;
    == { Math.Lemmas.lemma_mod_plus_distr_r a (b + c) prime }
    a +% (b +% c);
  }

val add_commutativity: a:ring -> b:ring -> Lemma (a +% b == b +% a)
let add_commutativity a b = ()

val mul_associativity: a:ring -> b:ring -> c:ring
  -> Lemma (a *% b *% c == a *% (b *% c))
let mul_associativity a b c =
  calc (==) {
    a *% b *% c;
    == { }
    (((a * b) % prime) * c) % prime;
    == { Math.Lemmas.lemma_mod_mul_distr_l (a * b) c prime }
    ((a * b) * c) % prime;
    == { Math.Lemmas.paren_mul_right a b c }
    (a * (b * c)) % prime;
    == { Math.Lemmas.lemma_mod_mul_distr_r a (b * c) prime }
    (a * ((b * c) % prime)) % prime;
    == { }
    a *% (b *% c);
  }

val mul_commutativity: a:ring -> b:ring -> Lemma (a *% b == b *% a)
let mul_commutativity a b = ()

[@canon_attr]
let ring_add_cm : cm ring =
  CM zero ( +% ) add_identity add_associativity add_commutativity

[@canon_attr]
let ring_mul_cm : cm ring =
  CM one ( *% ) mul_identity mul_associativity mul_commutativity

val mul_add_distr: distribute_left_lemma ring ring_add_cm ring_mul_cm
let mul_add_distr a b c =
  normalize_term_spec prime;
  calc (==) {
    a *% (b +% c);
    == { }
    (a * (b +% c)) % prime;
    == { Math.Lemmas.lemma_mod_add_distr a (b + c) prime }
    (a * ((b + c) % prime)) % prime;
    == { Math.Lemmas.lemma_mod_mul_distr_r a (b + c) prime }
    (a * (b + c)) % prime;
    == { Math.Lemmas.distributivity_add_right a b c }
    (a * b + a * c) % prime;
    == { Math.Lemmas.lemma_mod_add_distr (a * b) (a * c) prime }
    (a * b + a *% c) % prime;
    == { }
    (a *% c + a * b) % prime;
    == { Math.Lemmas.lemma_mod_add_distr (a *% c) (a * b) prime }
    (a *% c + a *% b) % prime;
    == { }
    (a *% b + a *% c) % prime;
    == { }
    a *% b +% a *% c;
  }

val mul_zero_l: mult_zero_l_lemma ring ring_add_cm ring_mul_cm
let mul_zero_l a = assert_norm (0 % prime == 0)

[@canon_attr]
let ring_cr : cr ring = CR ring_add_cm ring_mul_cm mul_add_distr mul_zero_l

let poly_semiring () : Tac unit = canon_semiring_with ring_cr ( +% ) ( *% )

let test_poly1 (a b:ring) =
  assert (a +% b == b +% a) by (poly_semiring ())

let test_poly2 (a b c:ring) =
  assert ((a +% b) *% c == a *% c +% b *% c) by (poly_semiring ())

[@expect_failure "problem with constants: expected type spolynomial ring; got type spolynomial int"]
let test_poly3 (a b c:ring) =
  let two:ring = 2 in
  assert (two *% (a +% b) *% c == two *% b *% c +% two *% a *% c)
  by (poly_semiring ())

#set-options "--tactic_trace_d 1"

[@tcdecltime]
let poly_update_repeat_blocks_multi_lemma2_simplify (a b c w r d:ring) :
  Lemma
  ( (((a *% (r *% r)) +% c) *% (r *% r)) +% ((b *% (r *% r)) +% d) *% r ==
    (((((a *% (r *% r)) +% b *% r) +% c) *% r) +% d) *% r)
=
  normalize_term_spec prime;
  assert (
    (((a *% (r *% r)) +% c) *% (r *% r)) +% ((b *% (r *% r)) +% d) *% r ==
    ((a *% (r *% r) +% b *% r +% c) *% r +% d) *% r)
  by (poly_semiring ())
