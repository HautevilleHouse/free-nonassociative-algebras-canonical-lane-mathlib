import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure FreeNonassociativeAlgebra (X : Type u) where
  carrier : Type v
  plus : carrier → carrier → carrier
  zero : carrier
  mul : carrier → carrier → carrier
  leftDistrib : ∀ a b c : carrier, mul a (plus b c) = plus (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (plus a b) c = plus (mul a c) (mul b c)

structure AdmittedFreeAlgebra (X : Type u) where
  algebra : FreeNonassociativeAlgebra X
  isFree : Prop
  conclusion : isFree

end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse