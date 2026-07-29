import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure ShannonAdmittedObject where
  sourceAlphabet : Type u
  channelModel : Type v
  inputDistribution : Type w
  mutualInformationBound : Prop
  capacityAchieved : Prop
  conclusion : mutualInformationBound ∧ capacityAchieved

structure AdmissibleClass where
  object : ShannonAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.mutualInformationBound ∧ A.object.capacityAchieved) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse