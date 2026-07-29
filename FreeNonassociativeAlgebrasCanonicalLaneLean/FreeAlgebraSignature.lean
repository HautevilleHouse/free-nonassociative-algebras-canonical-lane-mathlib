import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNonassociativeSignature where
  generatorSet : Type u
  generatorCount : ℕ
  signatureType : Type v
  arityMap : generatorSet → ℕ

structure FreeNonassociativeSignatureEvidence (S : FreeNonassociativeSignature) where
  generatorSetFinite : Fintype S.generatorSet
  generatorCountCard : Fintype.card S.generatorSet = S.generatorCount
  arityMapConsistent : ∀ g : S.generatorSet, S.arityMap g = 2

def FreeNonassociativeSignatureClosed (S : FreeNonassociativeSignature) : Prop :=
  Fintype S.generatorSet ∧
  Fintype.card S.generatorSet = S.generatorCount ∧
  ∀ g : S.generatorSet, S.arityMap g = 2

theorem free_nonassociative_signature_closed_from_evidence
    (S : FreeNonassociativeSignature) (E : FreeNonassociativeSignatureEvidence S) :
    FreeNonassociativeSignatureClosed S := by
  exact And.intro E.generatorSetFinite (And.intro E.generatorCountCard E.arityMapConsistent)

end HautevilleHouse
end FreeNonassociativeAlgebrasCanonicalLaneLean