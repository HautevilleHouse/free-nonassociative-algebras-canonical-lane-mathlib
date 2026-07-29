import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNAModule (R : Type u) [Ring R] (A : FreeNAAlgebra Unit) where
  carrier : Type v
  add : carrier → carrier → carrier
  smul : R → carrier → carrier
  action : A.carrier → carrier → carrier
  moduleStructure : Prop
  moduleStructureClosed : moduleStructure

structure FreeNAModuleEvidence {R : Type u} [Ring R] {A : FreeNAAlgebra Unit} (M : FreeNAModule R A) where
  moduleStructureClosed : M.moduleStructureClosed

def FreeNAModuleClosed {R : Type u} [Ring R] {A : FreeNAAlgebra Unit} (M : FreeNAModule R A) : Prop :=
  M.moduleStructure

theorem free_na_module_closed_from_evidence {R : Type u} [Ring R] {A : FreeNAAlgebra Unit} (M : FreeNAModule R A) (E : FreeNAModuleEvidence M) : FreeNAModuleClosed M := by
  exact E.moduleStructureClosed

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse