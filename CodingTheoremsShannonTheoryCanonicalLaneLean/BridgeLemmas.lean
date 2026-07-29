import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.mutualInformationBound ∧ A.object.capacityAchieved

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse