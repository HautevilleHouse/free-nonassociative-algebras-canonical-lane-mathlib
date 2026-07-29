import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNAAlgebra (X : Type u) where
  carrier : Type v
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  gen : X → carrier
  freeNonassociative : Prop

def FreeNAAlgebra.freeNonassociative (X : Type u) (A : FreeNAAlgebra X) : Prop :=
  A.freeNonassociative

structure FreeNAAdmittedObject where
  algebra : FreeNAAlgebra Unit
  basis : Prop
  dimensionCountable : Prop
  conclusion : basis ∧ dimensionCountable

def FreeNAWitnessClosed (O : FreeNAAdmittedObject) : Prop :=
  O.basis ∧ O.dimensionCountable

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse