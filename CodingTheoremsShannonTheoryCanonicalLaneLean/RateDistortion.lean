import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure RateDistortionPackage (E : EntropyPackage) (C : DiscreteMemorylessChannel) where
  reproductionAlphabet : Type u
  distortionMeasure : C.inputAlphabet → reproductionAlphabet → ℝ
  maximumDistortion : ℝ
  rate : ℝ
  rateLowerBound : rate ≥ E.entropyValue  -- placeholder
  achievable : Prop

structure RateDistortionEvidence {E : EntropyPackage} {C : DiscreteMemorylessChannel}
    (R : RateDistortionPackage E C) where
  rateLowerBoundClosed : R.rateLowerBound
  achievableClosed : R.achievable

def RateDistortionClosed {E : EntropyPackage} {C : DiscreteMemorylessChannel}
    (R : RateDistortionPackage E C) : Prop :=
  R.rateLowerBound ∧ R.achievable

theorem rate_distortion_closed_from_evidence {E : EntropyPackage} {C : DiscreteMemorylessChannel}
    (R : RateDistortionPackage E C) (Ev : RateDistortionEvidence R) : RateDistortionClosed R :=
  And.intro Ev.rateLowerBoundClosed Ev.achievableClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse