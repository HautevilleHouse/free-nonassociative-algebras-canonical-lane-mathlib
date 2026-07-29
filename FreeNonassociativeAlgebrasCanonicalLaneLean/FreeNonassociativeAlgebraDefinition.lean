import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNonassociativeAlgebra (X : Type u) where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  mul : carrier → carrier → carrier
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  zeroMul : ∀ a : carrier, mul zero a = zero
  mulZero : ∀ a : carrier, mul a zero = zero
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  addZero : ∀ a : carrier, add a zero = a
  addNeg : ∀ a : carrier, add a (neg a) = zero

def FreeNonassociativeAlgebra.admissible (FNA : FreeNonassociativeAlgebra Unit) : Prop :=
  True

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
