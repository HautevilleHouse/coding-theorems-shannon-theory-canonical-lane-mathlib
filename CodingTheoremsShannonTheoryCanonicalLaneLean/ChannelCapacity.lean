import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure ChannelPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  capacityDefined : Prop
  capacityIsSupremum : Prop

structure ChannelCapacityEvidence (C : ChannelPackage) where
  capacityDefinedClosed : C.capacityDefined
  capacityIsSupremumClosed : C.capacityIsSupremum

def ChannelCapacityClosed (C : ChannelPackage) : Prop :=
  C.capacityDefined ∧ C.capacityIsSupremum

theorem channel_capacity_closed_from_evidence (C : ChannelPackage)
    (E : ChannelCapacityEvidence C) : ChannelCapacityClosed C := by
  exact And.intro E.capacityDefinedClosed E.capacityIsSupremumClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse