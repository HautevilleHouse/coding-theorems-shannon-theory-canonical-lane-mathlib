import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryCanonicalLaneLean

structure SourceCodingPackage (E : EntropyPackage) where
  symbolAlphabet : Type u
  codeAlphabet : Type v
  encoding : symbolAlphabet → List codeAlphabet
  decoding : List codeAlphabet → Option symbolAlphabet
  uniquelyDecodable : Prop
  expectedCodeLength : ℝ
  lengthBound : expectedCodeLength ≥ E.entropyValue

structure SourceCodingEvidence {E : EntropyPackage} (S : SourceCodingPackage E) where
  uniquelyDecodableClosed : S.uniquelyDecodable
  lengthBoundClosed : S.lengthBound

def SourceCodingClosed {E : EntropyPackage} (S : SourceCodingPackage E) : Prop :=
  S.uniquelyDecodable ∧ S.lengthBound

theorem source_coding_closed_from_evidence {E : EntropyPackage} (S : SourceCodingPackage E)
    (Ev : SourceCodingEvidence S) : SourceCodingClosed S :=
  And.intro Ev.uniquelyDecodableClosed Ev.lengthBoundClosed

end CodingTheoremsShannonTheoryCanonicalLaneLean
end HautevilleHouse