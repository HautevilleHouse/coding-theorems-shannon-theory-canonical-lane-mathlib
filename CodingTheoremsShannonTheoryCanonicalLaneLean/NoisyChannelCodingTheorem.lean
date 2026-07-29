import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure NoisyChannelCodingPackage where
  channelCapacity : ℝ
  achievableRateSet : Set ℝ
  capacityAchievable : Prop
  converseHolds : Prop

structure NoisyChannelCodingEvidence (N : NoisyChannelCodingPackage) where
  capacityAchievableClosed : N.capacityAchievable
  converseHoldsClosed : N.converseHolds

def NoisyChannelCodingClosed (N : NoisyChannelCodingPackage) : Prop :=
  N.capacityAchievable ∧ N.converseHolds

theorem noisy_channel_coding_closed_from_evidence (N : NoisyChannelCodingPackage)
    (E : NoisyChannelCodingEvidence N) : NoisyChannelCodingClosed N := by
  exact And.intro E.capacityAchievableClosed E.converseHoldsClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse