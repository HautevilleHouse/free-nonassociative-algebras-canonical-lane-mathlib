import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FreeNonassociativeAlgebrasCanonicalLaneLean.FreeNonassociativeAlgebras

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

def AssociativeClosure (A : FreeNonassociativeAlgebra (Fin 0)) : FreeNonassociativeAlgebra (Fin 0) :=
  { carrier := A.carrier / (Relation.GeneratedBy (λ x y z => mul (mul x y) z = mul x (mul y z)))
    add := λ x y => Quot.mk _ (A.add (Quot.out x) (Quot.out y))
    zero := Quot.mk _ A.zero
    mul := λ x y => Quot.mk _ (A.mul (Quot.out x) (Quot.out y))
    leftDistrib := by
      intro x y z
      apply Quot.sound
      exact A.leftDistrib (Quot.out x) (Quot.out y) (Quot.out z)
    rightDistrib := by
      intro x y z
      apply Quot.sound
      exact A.rightDistrib (Quot.out x) (Quot.out y) (Quot.out z)
    zeroAdd := by
      intro x
      apply Quot.sound
      exact A.zeroAdd (Quot.out x)
    addZero := by
      intro x
      apply Quot.sound
      exact A.addZero (Quot.out x)
    addAssoc := by
      intro x y z
      apply Quot.sound
      exact A.addAssoc (Quot.out x) (Quot.out y) (Quot.out z)
    addComm := by
      intro x y
      apply Quot.sound
      exact A.addComm (Quot.out x) (Quot.out y) }

theorem associative_closure_is_associative (A : FreeNonassociativeAlgebra (Fin 0)) :
    ∀ (x y z : (AssociativeClosure A).carrier),
      (AssociativeClosure A).mul ((AssociativeClosure A).mul x y) z = (AssociativeClosure A).mul x ((AssociativeClosure A).mul y z) := by
  intro x y z
  apply Quot.sound
  exact Relation.MulAssoc (Quot.out x) (Quot.out y) (Quot.out z)

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse