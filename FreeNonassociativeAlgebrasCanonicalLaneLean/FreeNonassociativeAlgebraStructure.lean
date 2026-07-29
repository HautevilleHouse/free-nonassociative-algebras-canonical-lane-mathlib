import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNonassociativeAlgebraStructure where
  signature : FreeNonassociativeSignature
  carrierType : Type w
  multiplication : carrierType → carrierType → carrierType
  freenessCondition : Prop
  generatedBySignatureSet : Prop

structure FreeNonassociativeAlgebraEvidence (A : FreeNonassociativeAlgebraStructure) where
  multiplicationClosed : True
  freenessConditionClosed : A.freenessCondition
  generatedBySignatureSetClosed : A.generatedBySignatureSet

def FreeNonassociativeAlgebraClosed (A : FreeNonassociativeAlgebraStructure) : Prop :=
  A.freenessCondition ∧ A.generatedBySignatureSet

theorem free_nonassociative_algebra_closed_from_evidence
    (A : FreeNonassociativeAlgebraStructure) (E : FreeNonassociativeAlgebraEvidence A) :
    FreeNonassociativeAlgebraClosed A := by
  exact And.intro E.freenessConditionClosed E.generatedBySignatureSetClosed

end HautevilleHouse
end FreeNonassociativeAlgebrasCanonicalLaneLean