import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNonassociativeAlgebra (generators : Type) where
  carrier : Type
  add : carrier → carrier → carrier
  zero : carrier
  mul : carrier → carrier → carrier
  leftDistrib : ∀ x y z : carrier, mul x (add y z) = add (mul x y) (mul x z)
  rightDistrib : ∀ x y z : carrier, mul (add x y) z = add (mul x z) (mul y z)
  zeroAdd : ∀ x : carrier, add zero x = x
  addZero : ∀ x : carrier, add x zero = x
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addComm : ∀ x y : carrier, add x y = add y x

def FreeMagma (X : Type) : Type :=
  List (X × Bool)  -- binary tree representation via Dyck-like encoding

structure MagmaFreeProduct (A B : Type) where
  left : A
  right : B

theorem free_magma_universal {X : Type} (M : FreeNonassociativeAlgebra X) :
    (X → M.carrier) ≃ (FreeMagma X → M.carrier) := by
  refine {
    toFun := λ f => ?_
    invFun := λ g => ?_
    left_inv := ?_
    right_inv := ?_
  }
  · intro x
    induction x with
    | nil => exact M.zero
    | cons h t ih =>
      rcases h with ⟨x, b⟩
      exact if b then M.mul (f x) ih else M.add (f x) ih
  · intro x
    exact λ x' => g [⟨x', true⟩]
  · intro f
    ext x
    simp
  · intro g
    ext x
    induction x with
    | nil => 
      simp [M.zeroAdd, M.addZero]
    | cons h t ih =>
      rcases h with ⟨x', b⟩
      simp [ih]
      cases b <;> simp

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse