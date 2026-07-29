import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure AlternativeAlgebra (R : Type) [CommRing R] where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  leftAlternative : ∀ x y : carrier, mul (mul x x) y = mul x (mul x y)
  rightAlternative : ∀ x y : carrier, mul y (mul x x) = mul (mul y x) x
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addComm : ∀ x y : carrier, add x y = add y x
  addZero : ∀ x : carrier, add x zero = x
  zeroAdd : ∀ x : carrier, add zero x = x
  mulAddDistribLeft : ∀ x y z : carrier, mul x (add y z) = add (mul x y) (mul x z)
  mulAddDistribRight : ∀ x y z : carrier, mul (add x y) z = add (mul x z) (mul y z)

theorem artin_theorem (A : AlternativeAlgebra ℤ) :
    ∀ a b : A.carrier, SubalgebraGeneratedBy {a,b} IsAssociative := by
  intro a b
  refine SubalgebraGeneratedBy.isAssociative_of_alternative a b ?_ ?_
  · intro x y
    exact A.leftAlternative x y
  · intro x y
    exact A.rightAlternative x y

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse