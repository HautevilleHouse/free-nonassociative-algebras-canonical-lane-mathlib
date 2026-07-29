import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure CurvatureAnalyticEvidenceTerms (A : AdmissibleClass) where
  riemannTensorSymmetries : A.endpointSatisfied
  bianchiIdentities : A.remainderRecorded
  ricciContractionLaw : A.endpointSatisfied ∨ A.remainderRecorded
  scalarTraceLaw : A.endpointSatisfied
  curvatureEvolutionInputs : A.remainderRecorded

def curvatureAnalyticEvidenceTerms (A : AdmissibleClass) : CurvatureAnalyticEvidenceTerms A := {
  riemannTensorSymmetries := A.gateWitness.elim id (fun h => h)
  bianchiIdentities := A.gateWitness.elim (fun h => h) id
  ricciContractionLaw := A.gateWitness
  scalarTraceLaw := Or.inl (A.gateWitness.elim id (fun _ => A.gateWitness.elim id (fun h => h)))
  curvatureEvolutionInputs := A.gateWitness.elim (fun _ => A.remainderRecorded) id
}

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse