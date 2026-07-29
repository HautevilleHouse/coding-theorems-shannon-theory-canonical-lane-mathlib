import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure MultipleAccessChannelPackage where
  channel : Type u
  senderAlphabets : List Type
  receiverAlphabet : Type v
  capacityRegion : Set (ℝ × ℝ)
  regionAchievable : Prop
  regionAchievableTerm : regionAchievable

structure MultipleAccessChannelEvidence (M : MultipleAccessChannelPackage) where
  regionAchievableClosed : M.regionAchievable

def MultipleAccessChannelClosed (M : MultipleAccessChannelPackage) : Prop :=
  M.regionAchievable

theorem multiple_access_channel_closed_from_evidence
    (M : MultipleAccessChannelPackage) (E : MultipleAccessChannelEvidence M) :
    MultipleAccessChannelClosed M := by
  exact E.regionAchievableClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse