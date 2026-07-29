import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure LieAlgebra (R : Type) [CommRing R] where
  carrier : Type
  add : carrier → carrier → carrier
  bracket : carrier → carrier → carrier
  zero : carrier
  bilinear : ∀ a b : R, ∀ x y z : carrier, bracket (a • x + b • y) z = a • bracket x z + b • bracket y z
    ∧ bracket z (a • x + b • y) = a • bracket z x + b • bracket z y
  alternating : ∀ x : carrier, bracket x x = 0
  jacobiIdentity : ∀ x y z : carrier, bracket x (bracket y z) + bracket y (bracket z x) + bracket z (bracket x y) = 0
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addComm : ∀ x y z : carrier, add x y = add y x
  addZero : ∀ x : carrier, add x zero = x

theorem free_lie_algebra (X : Type) : LieAlgebra ℤ :=
  { carrier := FreeMagma X / (LieRelator)
    bracket := λ x y => Quot.mk _ (MagmaFreeProduct.mk x y)
    zero := Quot.mk _ (FreeMagma.nil)
    add := λ x y => Quot.mk _ (FreeMagma.append x y)
    bilinear := by
      intro a b x y z
      constructor
      · refine Quot.induction_on x ?_
        intro x'
        refine Quot.induction_on y ?_
        intro y'
        refine Quot.induction_on z ?_
        intro z'
        simp [MagmaFreeProduct.mk, FreeMagma.append, FreeMagma.nil, SMul.smul, HSMul.hSMul]
      · refine Quot.induction_on x ?_
        intro x'
        refine Quot.induction_on y ?_
        intro y'
        refine Quot.induction_on z ?_
        intro z'
        simp [MagmaFreeProduct.mk, FreeMagma.append, FreeMagma.nil, SMul.smul, HSMul.hSMul]
    alternating := by
      intro x
      refine Quot.induction_on x ?_
      intro x'
      simp [MagmaFreeProduct.mk, FreeMagma.nil, FreeMagma.append, LieRelator, Quot.mk_eq_mk]
    jacobiIdentity := by
      intro x y z
      refine Quot.induction_on x ?_
      intro x'
      refine Quot.induction_on y ?_
      intro y'
      refine Quot.induction_on z ?_
      intro z'
      simp [MagmaFreeProduct.mk, FreeMagma.append, FreeMagma.nil]
    addAssoc := by
      intro x y z
      refine Quot.induction_on x ?_
      intro x'
      refine Quot.induction_on y ?_
      intro y'
      refine Quot.induction_on z ?_
      intro z'
      simp [FreeMagma.append, FreeMagma.nil]
    addComm := by
      intro x y z
      refine Quot.induction_on x ?_
      intro x'
      refine Quot.induction_on y ?_
      intro y'
      simp [FreeMagma.append, FreeMagma.nil]
    addZero := by
      intro x
      refine Quot.induction_on x ?_
      intro x'
      simp [FreeMagma.append, FreeMagma.nil] }

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse