import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure NonassociativeWord (X : Type u) where
  length : ℕ
  leaves : List X
  bracketing : Tree Unit

def NonassociativeWordSet (X : Type u) : Set (NonassociativeWord X) := Set.univ

structure FreeBasisStructure (X : Type u) where
  carrier : Set (NonassociativeWord X)
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  basisProperty : LinearIndependent ℤ carrier
  multiplicationClosure : ∀ a b : carrier, mul a b ∈ carrier
  additionClosure : ∀ a b : carrier, add a b ∈ carrier

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse