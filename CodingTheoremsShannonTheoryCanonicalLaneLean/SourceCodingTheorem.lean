import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure SourceCodingPackage where
  sourceAlphabet : Type u
  probabilityDistribution : sourceAlphabet → ℝ
  entropyDefined : Prop
  expectedLengthOptimal : Prop
  prefixCodeExists : Prop

structure SourceCodingEvidence (S : SourceCodingPackage) where
  entropyDefinedClosed : S.entropyDefined
  expectedLengthOptimalClosed : S.expectedLengthOptimal
  prefixCodeExistsClosed : S.prefixCodeExists

def SourceCodingClosed (S : SourceCodingPackage) : Prop :=
  S.entropyDefined ∧ S.expectedLengthOptimal ∧ S.prefixCodeExists

theorem source_coding_closed_from_evidence (S : SourceCodingPackage)
    (E : SourceCodingEvidence S) : SourceCodingClosed S := by
  exact And.intro E.entropyDefinedClosed
    (And.intro E.expectedLengthOptimalClosed E.prefixCodeExistsClosed)

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse