import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure HallBasisConstruction where
  algebra : FreeNonassociativeAlgebraStructure
  hallSet : Type u
  hallBasisDefined : Prop
  bracketOrder : Prop
  basisProperties : Prop

structure HallBasisEvidence (H : HallBasisConstruction) where
  hallBasisDefinedClosed : H.hallBasisDefined
  bracketOrderClosed : H.bracketOrder
  basisPropertiesClosed : H.basisProperties

def HallBasisClosed (H : HallBasisConstruction) : Prop :=
  H.hallBasisDefined ∧ H.bracketOrder ∧ H.basisProperties

theorem hall_basis_closed_from_evidence
    (H : HallBasisConstruction) (E : HallBasisEvidence H) :
    HallBasisClosed H := by
  exact And.intro E.hallBasisDefinedClosed (And.intro E.bracketOrderClosed E.basisPropertiesClosed)

end HautevilleHouse
end FreeNonassociativeAlgebrasCanonicalLaneLean