import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure BroadcastChannelPackage where
  channel : Type u
  inputAlphabet : Type v
  outputAlphabets : List Type
  capacityRegion : Set (ℝ × ℝ)
  regionAchievable : Prop
  regionAchievableTerm : regionAchievable

structure BroadcastChannelEvidence (B : BroadcastChannelPackage) where
  regionAchievableClosed : B.regionAchievable

def BroadcastChannelClosed (B : BroadcastChannelPackage) : Prop :=
  B.regionAchievable

theorem broadcast_channel_closed_from_evidence
    (B : BroadcastChannelPackage) (E : BroadcastChannelEvidence B) :
    BroadcastChannelClosed B := by
  exact E.regionAchievableClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse