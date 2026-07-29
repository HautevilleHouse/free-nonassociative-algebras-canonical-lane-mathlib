import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure BasisAndDimension where
  algebra : FreeNonassociativeAlgebraStructure
  basisSet : Type u
  basisCardinal : ℕ
  basisIndependence : Prop
  basisSpanning : Prop
  dimensionFormula : Prop

structure BasisAndDimensionEvidence (B : BasisAndDimension) where
  basisIndependenceClosed : B.basisIndependence
  basisSpanningClosed : B.basisSpanning
  dimensionFormulaClosed : B.dimensionFormula

def BasisAndDimensionClosed (B : BasisAndDimension) : Prop :=
  B.basisIndependence ∧ B.basisSpanning ∧ B.dimensionFormula

theorem basis_and_dimension_closed_from_evidence
    (B : BasisAndDimension) (E : BasisAndDimensionEvidence B) :
    BasisAndDimensionClosed B := by
  exact And.intro E.basisIndependenceClosed (And.intro E.basisSpanningClosed E.dimensionFormulaClosed)

end HautevilleHouse
end FreeNonassociativeAlgebrasCanonicalLaneLean