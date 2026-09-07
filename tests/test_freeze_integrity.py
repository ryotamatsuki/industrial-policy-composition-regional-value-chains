from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def test_freeze_id_and_core_markers_present():
    text = (ROOT/'THEORY_FREEZE.md').read_text(encoding='utf-8')
    assert 'IPCRVC-THEORY-FREEZE-2026-09-07-v1' in text
    assert 'A^P' in text
    assert 'A^N' in text
    assert 'first best' in text.lower()

def test_stage9_points_to_canonical_freeze_commit():
    provenance = (ROOT/'docs'/'PROVENANCE.md').read_text(encoding='utf-8')
    assert '16bd8c50801a5af0ec7acc740a667a26ca8dac1b' in provenance
