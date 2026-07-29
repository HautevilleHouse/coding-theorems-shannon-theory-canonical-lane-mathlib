import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure ShannonTheoremPackage where
  sourceCoding: SourceCodingPackage
  channelCoding: ChannelCodingPackage
  sourceCodingRate: ℝ
  channelCapacity: ℝ
  reliableCommunicationPossible: Prop
  optimalRate: ℝ

structure ShannonTheoremEvidence (S: ShannonTheoremPackage) where
  sourceCodingEvidence: SourceCodingEvidence S.sourceCoding
  channelCodingEvidence: ChannelCodingEvidence S.channelCoding
  sourceCodingRateClosed: S.sourceCodingRate = S.sourceCoding.entropyRate
  channelCapacityClosed: S.channelCapacity = S.channelCoding.capacity
  reliableCommunicationPossibleClosed: S.reliableCommunicationPossible ↔ S.sourceCodingRate ≤ S.channelCapacity
  optimalRateClosed: S.optimalRate = min S.sourceCodingRate S.channelCapacity

def ShannonTheoremClosed (S: ShannonTheoremPackage): Prop :=
  S.sourceCodingRate ≤ S.channelCapacity → S.reliableCommunicationPossible

theorem shannon_theorem_closed_from_evidence (S: ShannonTheoremPackage) (E: ShannonTheoremEvidence S): ShannonTheoremClosed S := by
  intro h
  rcases E.reliableCommunicationPossibleClosed.mpr ?_ with hrel
  · exact hrel
  · exact h

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse