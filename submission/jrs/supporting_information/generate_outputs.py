"""Generate deterministic figure/table source files for the blinded supplement."""
from __future__ import annotations
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
TABLES = ROOT / 'tables'
FIGURES = ROOT / 'figures'
RESULTS = ROOT / 'results'
FREEZE_ID = 'IPCRVC-THEORY-FREEZE-2026-09-07-v1'
for p in (TABLES, FIGURES, RESULTS):
    p.mkdir(exist_ok=True)

threshold_table = r'''% Auto-generated. Do not edit by hand.
\begin{table}[htbp]
\centering
\caption{Switching thresholds and certified scope}
\label{tab:thresholds}
\begin{tabular}{lll}
\toprule
Object & Expression & Certified scope \\
\midrule
Coordinated fixed-capacity threshold & $A^P=\Delta$ & Baseline continuous game \\
Decentralized threshold & $A^N=\Delta/(1-\alpha)$ & Baseline continuous game \\
Threshold gap & $A^N-A^P=\alpha\Delta/(1-\alpha)$ & $\Delta>0,\ 0<\alpha<1$ \\
Constant-capture coordinated threshold & $G^P=\Delta$ & Binary switching lemma \\
Constant-capture local threshold & $G^N=\Delta/\lambda$ & $0<\lambda<1$ \\
\bottomrule
\end{tabular}
\end{table}
'''
(TABLES / 'thresholds.tex').write_text(threshold_table, encoding='utf-8')

phase_tex = r'''% Auto-generated. Do not edit by hand.
\begin{figure}[htbp]
\centering
\setlength{\unitlength}{1mm}
\begin{picture}(150,37)
\put(0,18){\framebox(45,12){\shortstack{Both regimes duplicate\\$0<A<A^P$}}}
\put(45,18){\framebox(55,12){\shortstack{Unique decentralized duplication\\coordinated reallocation\\$A^P<A<A^N$}}}
\put(100,18){\framebox(50,12){\shortstack{Differentiated NE emerge\\symmetric NE also exists\\$A>A^N$}}}
\put(0,12){\line(1,0){150}}
\put(45,10){\line(0,1){4}}
\put(100,10){\line(0,1){4}}
\put(45,5){\makebox(0,0){$A^P=\Delta$}}
\put(100,5){\makebox(0,0){$A^N=\Delta/(1-\alpha)$}}
\put(75,0){\makebox(0,0){Cross-regional complementarity $A$}}
\end{picture}
\caption{Baseline regime map. The middle interval is the Priority Duplication Wedge. The figure records equilibrium and coordinated-policy regimes only within the frozen two-region, two-activity baseline.}
\label{fig:phase-regions}
\end{figure}
'''
(FIGURES / 'phase_regions.tex').write_text(phase_tex, encoding='utf-8')

manifest = {
    'freeze_id': FREEZE_ID,
    'generator': 'generate_outputs.py',
    'generated': ['tables/thresholds.tex', 'figures/phase_regions.tex'],
    'note': 'These are exposition artifacts; theorem validity rests on the analytical proofs and checks.'
}
(RESULTS / 'generated_manifest.json').write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')
print('Generated anonymous manuscript outputs')
