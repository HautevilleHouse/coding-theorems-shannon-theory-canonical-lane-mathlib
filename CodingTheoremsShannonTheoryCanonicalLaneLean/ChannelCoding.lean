import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure DiscreteMemorylessChannel where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionProb : inputAlphabet → outputAlphabet → ℝ
  transitionProbNonneg : ∀ i o, transitionProb i o ≥ 0
  sumOverOutputs : ∀ i, ∑ o, transitionProb i o = 1

structure ChannelCodingPackage (C : DiscreteMemorylessChannel) where
  blockLength : ℕ
  codeSize : ℕ
  encoding : (Fin codeSize) → (Fin blockLength) → C.inputAlphabet
  decoding : (Fin blockLength) → C.outputAlphabet → Option (Fin codeSize)
  maxErrorProbability : ℝ
  errorBound : Prop

structure ChannelCodingEvidence {C : DiscreteMemorylessChannel} (P : ChannelCodingPackage C) where
  errorBoundClosed : P.errorBound
  codeSizeBound : ℕ
  reliabilityWitness : codeSizeBound = P.codeSize

def ChannelCodingClosed {C : DiscreteMemorylessChannel} (P : ChannelCodingPackage C) : Prop :=
  P.errorBound

theorem channel_coding_closed_from_evidence {C : DiscreteMemorylessChannel} (P : ChannelCodingPackage C)
    (E : ChannelCodingEvidence P) : ChannelCodingClosed P :=
  E.errorBoundClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse