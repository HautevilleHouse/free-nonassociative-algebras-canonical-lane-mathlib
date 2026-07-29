import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure JordanAlgebra (R : Type) [CommRing R] where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  commutative : ∀ x y : carrier, mul x y = mul y x
  jordanIdentity : ∀ x y : carrier, mul (mul (mul x x) y) x = mul (mul x x) (mul y x)
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addComm : ∀ x y : carrier, add x y = add y x
  addZero : ∀ x : carrier, add x zero = x
  zeroAdd : ∀ x : carrier, add zero x = x
  mulAddDistribLeft : ∀ x y z : carrier, mul x (add y z) = add (mul x y) (mul x z)
  mulAddDistribRight : ∀ x y z : carrier, mul (add x y) z = add (mul x z) (mul y z)

theorem jordan_algebra_power_associative (J : JordanAlgebra ℤ) (x : J.carrier) :
    ∀ m n : ℕ, mul (x^m) (x^n) = x^(m+n) := by
  intro m n
  induction' m with k ih generalizing n
  · simp [pow_zero, zero_add]
  · simp [pow_succ, mul_assoc, ih, add_comm, add_left_comm, add_assoc]

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse