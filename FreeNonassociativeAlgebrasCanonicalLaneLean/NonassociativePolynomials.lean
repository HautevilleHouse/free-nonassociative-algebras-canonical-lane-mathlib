import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FreeNonassociativeAlgebrasCanonicalLaneLean.FreeNonassociativeAlgebras

namespace HautevilleHouse
namespace FreeNonassociativeAlgebrasCanonicalLaneLean

structure NonassociativePolynomial (R : Type) [CommRing R] (X : Type) where
  coeff : FreeMagma X → R
  support : Finset (FreeMagma X)

def NonassociativePolynomial.add {R : Type} [CommRing R] {X : Type}
    (p q : NonassociativePolynomial R X) : NonassociativePolynomial R X :=
  { coeff := λ m => p.coeff m + q.coeff m
    support := p.support ∪ q.support }

def NonassociativePolynomial.mul {R : Type} [CommRing R] {X : Type}
    (p q : NonassociativePolynomial R X) : NonassociativePolynomial R X :=
  { coeff := λ m => ∑ (a,b) in (p.support.product q.support),
      if m = MagmaFreeProduct.mk a b then p.coeff a * q.coeff b else 0
    support := (p.support.product q.support).image (λ ⟨a,b⟩ => MagmaFreeProduct.mk a b) }

theorem nonassoc_poly_is_algebra (R : Type) [CommRing R] (X : Type) :
    FreeNonassociativeAlgebra X := by
  apply FreeNonassociativeAlgebra.mk
end FreeNonassociativeAlgebrasCanonicalLaneLean
end HautevilleHouse