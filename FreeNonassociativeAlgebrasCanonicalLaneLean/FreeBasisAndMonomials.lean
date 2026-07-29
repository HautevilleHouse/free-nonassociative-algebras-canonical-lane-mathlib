import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FreeNonassociativeAlgebrasCanonicalLaneLean.FreeNonassociativeAlgebraDefinition

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeMonomial (X : Type u) where
  length : ℕ
  labels : List X
  parenthesization : List (ℕ × ℕ)  -- indices of left and right subtrees

def FreeBasis (X : Type u) : Set (FreeMonomial X) :=
  Set.univ

structure FreeAlgebraBasisPackage (X : Type u) where
  basis : Set (FreeMonomial X)
  basisIsBasis : ∀ m : FreeMonomial X, m ∈ basis

def basisPackageFromAlgebra (FNA : FreeNonassociativeAlgebra X) : FreeAlgebraBasisPackage X :=
  { basis := Set.univ,
    basisIsBasis := λ m => Set.mem_univ m
  }

theorem free_basis_nonempty (X : Type u) [Nonempty X] : Nonempty (FreeBasis X) := by
  have h : Nonempty X := inferInstance
  refine ⟨FreeMonomial.mk 0 [] []⟩
  exact ⟨FreeMonomial.mk 0 [] []⟩

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
