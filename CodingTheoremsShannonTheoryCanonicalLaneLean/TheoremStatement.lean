import HautevilleHouse.CodingTheoremsShannonTheoryCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure ShannonAdmittedObject where
  channelModel : Prop
  capacityReached : Prop
  conclusion : capacityReached

def ShannonWitnessClosed (O : ShannonAdmittedObject) : Prop :=
  O.capacityReached

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse
