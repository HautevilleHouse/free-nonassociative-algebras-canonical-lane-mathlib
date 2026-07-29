import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure NoncollapsingPackage (A : AdmissibleClass) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence (A : AdmissibleClass) (N : NoncollapsingPackage A) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed (A : AdmissibleClass) (N : NoncollapsingPackage A) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence (A : AdmissibleClass) (N : NoncollapsingPackage A) (E : NoncollapsingEvidence A N) : NoncollapsingClosed A N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse