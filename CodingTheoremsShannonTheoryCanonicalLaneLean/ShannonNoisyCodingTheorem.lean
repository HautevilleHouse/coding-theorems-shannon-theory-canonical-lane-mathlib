import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure DiscreteMemorylessChannel where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  stochastic : ∀ x, ∑ y, transitionMatrix x y = 1

structure ShannonNoisyCodingPackage (M : DiscreteMemorylessChannel) where
  codeRate : ℝ
  blockLength : ℕ
  errorProbability : ℝ
  capacity : ℝ
  rateBelowCapacity : codeRate < capacity
  errorProbabilityVanishes : errorProbability → 0 as blockLength → ∞

structure ShannonNoisyCodingEvidence {M : DiscreteMemorylessChannel} (S : ShannonNoisyCodingPackage M) where
  rateBelowCapacityClosed : S.rateBelowCapacity
  errorProbabilityVanishesClosed : S.errorProbabilityVanishes

def ShannonNoisyCodingClosed {M : DiscreteMemorylessChannel} (S : ShannonNoisyCodingPackage M) : Prop :=
  S.rateBelowCapacity ∧ S.errorProbabilityVanishes

theorem shannon_noisy_coding_closed_from_evidence {M : DiscreteMemorylessChannel} (S : ShannonNoisyCodingPackage M) (E : ShannonNoisyCodingEvidence S) : ShannonNoisyCodingClosed S := by
  exact And.intro E.rateBelowCapacityClosed E.errorProbabilityVanishesClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse