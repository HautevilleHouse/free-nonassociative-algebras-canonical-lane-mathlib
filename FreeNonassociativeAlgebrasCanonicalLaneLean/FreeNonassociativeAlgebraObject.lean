import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNonassociativeAlgebra (X : Type u) where
  carrier : Type v
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  add_assoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zero_add : ∀ a : carrier, add zero a = a
  add_zero : ∀ a : carrier, add a zero = a
  add_comm : ∀ a b : carrier, add a b = add b a
  left_distrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  right_distrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  basis : Set (carrier)
  basis_independent : LinearIndependent ℤ basis

structure FreeNonassociativeAlgebraObject (X : Type u) where
  algebra : FreeNonassociativeAlgebra X
  free_generators : Set (algebra.carrier)
  universal_property : ∀ (A : NonassociativeRing), ∃! f : algebra.carrier → A, f preserves_structure
  conclusion : universal_property

def FreeNonassociativeWitnessClosed (O : FreeNonassociativeAlgebraObject) : Prop :=
  O.universal_property

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse