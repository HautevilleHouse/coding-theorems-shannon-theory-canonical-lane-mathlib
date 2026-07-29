import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure ChannelCodingPackage where
  inputAlphabet: Type u
  outputAlphabet: Type v
  channelMatrix: inputAlphabet -> outputAlphabet -> ℝ
  capacity: ℝ
  codeRate: ℝ
  errorProbability: ℝ
  mutualInformation: ℝ

structure ChannelCodingEvidence (C: ChannelCodingPackage) where
  channelMatrixClosed: ∀ x: C.inputAlphabet, (∑ y: C.outputAlphabet, C.channelMatrix x y) = 1
  capacityClosed: C.capacity = max_{p: inputAlphabet -> ℝ, sum p = 1} (∑ x: C.inputAlphabet, ∑ y: C.outputAlphabet, p x * C.channelMatrix x y * Real.log (C.channelMatrix x y / (∑ x': C.inputAlphabet, p x' * C.channelMatrix x' y)))
  codeRateClosed: C.codeRate = Real.log (Card C.inputAlphabet) / Real.log 2

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse