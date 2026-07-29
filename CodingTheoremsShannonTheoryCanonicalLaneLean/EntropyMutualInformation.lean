import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure EntropyPackage where
  sourceDistribution : Type u → ℝ
  entropyValue : ℝ
  logBase : ℝ
  logBasePositive : logBase > 0
  entropyNonnegative : entropyValue ≥ 0

structure MutualInformationPackage (E : EntropyPackage) where
  jointDistribution : Type u → Type v → ℝ
  mutualInfoValue : ℝ
  nonnegative : mutualInfoValue ≥ 0
  boundByEntropy : mutualInfoValue ≤ E.entropyValue

structure EntropyEvidence (E : EntropyPackage) where
  entropyNonnegativeClosed : E.entropyNonnegative
  logBasePositiveClosed : E.logBasePositive

def EntropyClosed (E : EntropyPackage) : Prop :=
  E.entropyNonnegative ∧ E.logBasePositive

theorem entropy_closed_from_evidence (E : EntropyPackage) (Ev : EntropyEvidence E) : EntropyClosed E :=
  And.intro Ev.entropyNonnegativeClosed Ev.logBasePositiveClosed

structure MutualInformationEvidence (E : EntropyPackage) (M : MutualInformationPackage E) where
  nonnegativeClosed : M.nonnegative
  boundByEntropyClosed : M.boundByEntropy

def MutualInformationClosed (E : EntropyPackage) (M : MutualInformationPackage E) : Prop :=
  M.nonnegative ∧ M.boundByEntropy

theorem mutual_information_closed_from_evidence (E : EntropyPackage) (M : MutualInformationPackage E)
    (Ev : MutualInformationEvidence E M) : MutualInformationClosed E M :=
  And.intro Ev.nonnegativeClosed Ev.boundByEntropyClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse