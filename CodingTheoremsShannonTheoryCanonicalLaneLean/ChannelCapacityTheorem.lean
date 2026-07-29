import AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure ChannelModel where
  inputAlphabet : Type
  outputAlphabet : Type
  transitionMatrix : Type
  mutualInformationDefined : Prop
  capacityFormula : Prop
  capacityAchieved : Prop

structure ChannelCapacityEvidence (C : ChannelModel) where
  mutualInformationDefinedClosed : C.mutualInformationDefined
  capacityFormulaClosed : C.capacityFormula
  capacityAchievedClosed : C.capacityAchieved

def ChannelCapacityClosed (C : ChannelModel) : Prop :=
  C.mutualInformationDefined ∧ C.capacityFormula ∧ C.capacityAchieved

theorem channel_capacity_closed_from_evidence (C : ChannelModel) (E : ChannelCapacityEvidence C) :
    ChannelCapacityClosed C := by
  exact And.intro E.mutualInformationDefinedClosed (And.intro E.capacityFormulaClosed E.capacityAchievedClosed)

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse