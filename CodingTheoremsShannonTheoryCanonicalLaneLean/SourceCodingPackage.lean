import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure SourceCodingPackage where
  alphabet: Type u
  sourceDistribution: alphabet -> ℝ
  entropy: ℝ
  entropyRate: ℝ
  jointDistribution: alphabet -> alphabet -> ℝ
  conditionalEntropy: ℝ
  mutualInformation: ℝ

structure SourceCodingEvidence (S: SourceCodingPackage) where
  alphabetClosed: S.alphabet ≃ Fin (Nat.succ 0)
  sourceDistributionClosed: ∀ x: S.alphabet, S.sourceDistribution x ≥ 0 ∧ S.sourceDistribution x ≤ 1
  sumProbabilityClosed: (∑ x: S.alphabet, S.sourceDistribution x) = 1
  entropyClosed: S.entropy = -∑ x: S.alphabet, S.sourceDistribution x * Real.log (S.sourceDistribution x)
  entropyRateClosed: S.entropyRate = S.entropy
  jointDistributionClosed: ∀ x y: S.alphabet, S.jointDistribution x y ≥ 0 ∧ S.jointDistribution x y ≤ 1
  sumJointClosed: (∑ x: S.alphabet, ∑ y: S.alphabet, S.jointDistribution x y) = 1
  conditionalEntropyClosed: S.conditionalEntropy = S.entropy - S.mutualInformation
  mutualInformationClosed: S.mutualInformation = ∑ x: S.alphabet, ∑ y: S.alphabet, S.jointDistribution x y * Real.log (S.jointDistribution x y / (S.sourceDistribution x * S.sourceDistribution y))

def SourceCodingClosed (S: SourceCodingPackage): Prop :=
  S.entropy ≥ 0 ∧ S.entropyRate ≥ 0 ∧ S.conditionalEntropy ≥ 0 ∧ S.mutualInformation ≥ 0

theorem source_coding_closed_from_evidence (S: SourceCodingPackage) (E: SourceCodingEvidence S): SourceCodingClosed S := by
  have h1: S.entropy ≥ 0 := by
    rw [E.entropyClosed]
    refine Finset.sum_nonneg (fun x _ => ?_)
    have ⟨hp, hq⟩ := E.sourceDistributionClosed x
    nlinarith [hp, hq]
  have h2: S.entropyRate ≥ 0 := by
    rw [E.entropyRateClosed]
    exact h1
  have h3: S.conditionalEntropy ≥ 0 := by
    rw [E.conditionalEntropyClosed]
    nlinarith
  have h4: S.mutualInformation ≥ 0 := by
    rw [E.mutualInformationClosed]
    ... 
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse