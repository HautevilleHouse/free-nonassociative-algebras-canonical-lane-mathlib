import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeAlgebraBasis (X : Type u) where
  generatingSet : Set X
  basis : Type v
  linearIndependent : Prop
  spanning : Prop

structure BasisEvidence (X : Type u) (B : FreeAlgebraBasis X) where
  linearIndependentClosed : B.linearIndependent
  spanningClosed : B.spanning

def BasisClosed (X : Type u) (B : FreeAlgebraBasis X) : Prop :=
  B.linearIndependent ∧ B.spanning

theorem basis_closed_from_evidence (X : Type u) (B : FreeAlgebraBasis X) (E : BasisEvidence X B) : BasisClosed X B := by
  exact And.intro E.linearIndependentClosed E.spanningClosed

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse