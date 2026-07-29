import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure CurvatureAnalyticCertificate (A : AdmissibleClass) where
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  riemannTensorSymmetriesClosed : riemannTensorSymmetries
  bianchiIdentitiesClosed : bianchiIdentities
  ricciContractionLawClosed : ricciContractionLaw
  scalarTraceLawClosed : scalarTraceLaw
  curvatureEvolutionInputsClosed : curvatureEvolutionInputs
  curvatureEvidence : A.endpointSatisfied ∧ A.remainderRecorded

def CurvatureAnalyticCertificateClosed (A : AdmissibleClass) (C : CurvatureAnalyticCertificate A) : Prop :=
  C.riemannTensorSymmetries ∧ C.bianchiIdentities ∧ C.ricciContractionLaw ∧
  C.scalarTraceLaw ∧ C.curvatureEvolutionInputs ∧ (A.endpointSatisfied ∧ A.remainderRecorded)

theorem curvature_analytic_certificate_closed (A : AdmissibleClass) (C : CurvatureAnalyticCertificate A) : CurvatureAnalyticCertificateClosed A C := by
  exact And.intro C.riemannTensorSymmetriesClosed (And.intro C.bianchiIdentitiesClosed (And.intro C.ricciContractionLawClosed (And.intro C.scalarTraceLawClosed (And.intro C.curvatureEvolutionInputsClosed C.curvatureEvidence))))

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse