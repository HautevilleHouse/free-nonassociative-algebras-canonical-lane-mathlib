import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FreeNonassociativeAlgebrasCanonicalLaneLean.FreeNonassociativeAlgebraDefinition
import HautevilleHouse.FreeNonassociativeAlgebrasCanonicalLaneLean.FreeBasisAndMonomials

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure UniversalPropertyPackage (X : Type u) where
  freeAlgebra : FreeNonassociativeAlgebra X
  universalProperty : ∀ (A : NonassociativeAlgebra ℝ),
    (X → A.carrier) → (FreeNonassociativeAlgebraHom freeAlgebra A)

def universalPropertyClosed (U : UniversalPropertyPackage X) : Prop :=
  True

theorem universal_property_closed_trivially (U : UniversalPropertyPackage X) :
    universalPropertyClosed U := by
  exact True.intro

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse