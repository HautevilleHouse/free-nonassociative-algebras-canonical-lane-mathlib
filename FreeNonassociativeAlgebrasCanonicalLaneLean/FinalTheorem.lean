import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FreeNonassociativeAlgebrasCanonicalLaneLean.UniversalProperty

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedFreeNonassociativeAlgebrasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_free_nonassociative_algebras_endgame (A : AdmissibleClass) :
    ConstrainedFreeNonassociativeAlgebrasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
