import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure AdmissibleClass where
  object : FreeNAAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FreeNAWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse