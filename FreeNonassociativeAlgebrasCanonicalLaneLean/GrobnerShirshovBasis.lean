import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure GroebnerShirshovBasis where
  algebra : FreeNonassociativeAlgebraStructure
  leadingTerms : Type u
  compositionClosed : Prop
  completionLemma : Prop
  reductionAlgorithm : Prop

structure GroebnerShirshovEvidence (G : GroebnerShirshovBasis) where
  compositionClosedClosed : G.compositionClosed
  completionLemmaClosed : G.completionLemma
  reductionAlgorithmClosed : G.reductionAlgorithm

def GroebnerShirshovClosed (G : GroebnerShirshovBasis) : Prop :=
  G.compositionClosed ∧ G.completionLemma ∧ G.reductionAlgorithm

theorem groebner_shirshov_closed_from_evidence
    (G : GroebnerShirshovBasis) (E : GroebnerShirshovEvidence G) :
    GroebnerShirshovClosed G := by
  exact And.intro E.compositionClosedClosed (And.intro E.completionLemmaClosed E.reductionAlgorithmClosed)

end HautevilleHouse
end FreeNonassociativeAlgebrasCanonicalLaneLean