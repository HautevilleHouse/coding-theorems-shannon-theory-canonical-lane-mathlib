import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure EntropyMutualInformationPackage where
  randomVariable : Type u
  probabilitySpace : ProbabilitySpace randomVariable
  entropy : ℝ
  mutualInformation : randomVariable → randomVariable → ℝ
  chainRuleHolds : Prop

structure EntropyMutualInformationEvidence (E : EntropyMutualInformationPackage) where
  entropyNonnegative : E.entropy ≥ 0
  mutualInformationSymmetric : ∀ X Y : E.randomVariable, E.mutualInformation X Y = E.mutualInformation Y X
  chainRuleClosed : E.chainRuleHolds

def EntropyMutualInformationClosed (E : EntropyMutualInformationPackage) : Prop :=
  E.entropy ≥ 0 ∧ (∀ X Y : E.randomVariable, E.mutualInformation X Y = E.mutualInformation Y X) ∧ E.chainRuleHolds

theorem entropy_mutual_information_closed_from_evidence (E : EntropyMutualInformationPackage)
    (Ev : EntropyMutualInformationEvidence E) : EntropyMutualInformationClosed E := by
  exact And.intro Ev.entropyNonnegative (And.intro Ev.mutualInformationSymmetric Ev.chainRuleClosed)

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse