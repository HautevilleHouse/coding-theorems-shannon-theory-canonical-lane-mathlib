import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure ShannonCapacityPackage (C : DiscreteMemorylessChannel) where
  capacity : ℝ
  capacityDefinedViaMutualInformation : Prop
  capacityAchievable : Prop
  converseHolds : Prop

structure ShannonCapacityEvidence (C : DiscreteMemorylessChannel) (Sc : ShannonCapacityPackage C) where
  capacityDefinedViaMutualInformationClosed : Sc.capacityDefinedViaMutualInformation
  capacityAchievableClosed : Sc.capacityAchievable
  converseHoldsClosed : Sc.converseHolds

def ShannonCapacityClosed (C : DiscreteMemorylessChannel) (Sc : ShannonCapacityPackage C) : Prop :=
  Sc.capacityDefinedViaMutualInformation ∧ Sc.capacityAchievable ∧ Sc.converseHolds

theorem shannon_capacity_closed_from_evidence (C : DiscreteMemorylessChannel)
    (Sc : ShannonCapacityPackage C) (Ev : ShannonCapacityEvidence C Sc) : ShannonCapacityClosed C Sc :=
  And.intro Ev.capacityDefinedViaMutualInformationClosed
    (And.intro Ev.capacityAchievableClosed Ev.converseHoldsClosed)

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse