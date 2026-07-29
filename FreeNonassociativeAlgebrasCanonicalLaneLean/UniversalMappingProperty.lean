import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure UniversalMappingProperty where
  algebra : FreeNonassociativeAlgebraStructure
  targetAlgebra : FreeNonassociativeAlgebraStructure
  homSet : Type u
  universalExtension : Prop
  homExtensionUnique : Prop

structure UniversalMappingPropertyEvidence (U : UniversalMappingProperty) where
  universalExtensionClosed : U.universalExtension
  homExtensionUniqueClosed : U.homExtensionUnique

def UniversalMappingPropertyClosed (U : UniversalMappingProperty) : Prop :=
  U.universalExtension ∧ U.homExtensionUnique

theorem universal_mapping_property_closed_from_evidence
    (U : UniversalMappingProperty) (E : UniversalMappingPropertyEvidence U) :
    UniversalMappingPropertyClosed U := by
  exact And.intro E.universalExtensionClosed E.homExtensionUniqueClosed

end HautevilleHouse
end FreeNonassociativeAlgebrasCanonicalLaneLean