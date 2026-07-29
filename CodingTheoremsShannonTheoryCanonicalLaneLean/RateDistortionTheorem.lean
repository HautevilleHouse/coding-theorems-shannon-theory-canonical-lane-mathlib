import AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure RateDistortionModel where
  sourceAlphabet : Type
  distortionMeasure : Type
  rateDistortionFunction : Prop
  rateDistortionBound : Prop
  optimalCodingAchieved : Prop

structure RateDistortionEvidence (R : RateDistortionModel) where
  rateDistortionFunctionClosed : R.rateDistortionFunction
  rateDistortionBoundClosed : R.rateDistortionBound
  optimalCodingAchievedClosed : R.optimalCodingAchieved

def RateDistortionClosed (R : RateDistortionModel) : Prop :=
  R.rateDistortionFunction ∧ R.rateDistortionBound ∧ R.optimalCodingAchieved

theorem rate_distortion_closed_from_evidence (R : RateDistortionModel) (E : RateDistortionEvidence R) :
    RateDistortionClosed R := by
  exact And.intro E.rateDistortionFunctionClosed (And.intro E.rateDistortionBoundClosed E.optimalCodingAchievedClosed)

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse