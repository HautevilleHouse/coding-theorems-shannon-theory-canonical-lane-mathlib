import canonicalLaneMathlib.AdmissibleClass
open HautevilleHouse.CodingTheoremsShannonTheoryCanonicalLaneLean

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

def ConstrainedShannonClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_shannon_endgame (A : AdmissibleClass) : ConstrainedShannonClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse