# New theoretical paper — Stage 1 original-parent source and mathematical audit (2026-10-10)

**Verdict:** CONDITIONAL GO — the main mathematical starting models have been reconstructed, but **one material evidence gate** remains: original journal-final model/proposition scrutiny of the closest adjacent regional/fiscal and IO policy competition studies, especially Armbruster–Hintermann (2020) and Suga–Yanase–Tawada (2026). DO NOT claim full Stage-1 closure or novelty, and DO NOT start new game/Stage 3 until Stage-2 absorption gate passes. Research method: THEORY ONLY, zero empirical design/analysis/calibration. Original IPCRVC frozen theory and Stage-4 NO-GO findings untouched.

## 1. Primary-parent A: Liu (2019, QJE): exact primitives, fiscal accounting and propositions

Original full journal PDF examined (66 pp), especially pp.1887–1905 / PDF pp.4–22:
https://ernestliu.scholar.princeton.edu/sites/g/files/toruqf4426/files/ernestliu/files/qjz024.pdf
DOI https://doi.org/10.1093/qje/qjz024.

There is **ONE** representative government and ONE representative consumer; not competing territorial governments. For sector i, gross production Q_i=z_i F_i(L_i,(M_ij)_j), with CRS, factor L and input purchases M_ij; final consumption-good aggregate Y^G=F(Y_1,...,Y_N). Friction chi_ij >=0 is an intermediate-purchase wedge with dissipative quasi-rents. Production-policy subsidy tau_ij / tau_iL is **positive for a subsidy** (important opposite sign to Poirier 2025). Per-sector spending S_i=sum_j tau_ij P_j M_ij + tau_iL W L_i. Balanced budget T=G+sum_i S_i; consumer spending C=WL-T. Resource accounting Y=Y^G-Pi_deadweight=C+G=WL-sum_i S_i. This is a real national net output benchmark and C+G, NOT unweighted sum of regional nominal production or subsidy cash flows. Original eqs (1)–(10), printed pp.1889–1892.

Let Sigma=[sigma_ij] denote *equilibrium input-production elasticity* matrix, Omega=[omega_ij]=[P_j M_ij/(P_i Q_i)] the intermediate EXPENDITURE share matrix; beta sector final-demand share vector. Sectoral influence mu^T=beta^T (I-Sigma)^(-1), Domar weights gamma_i=P_i Q_i/(WL), and distortion centrality xi_i=mu_i/gamma_i. Definition 2, printed p.1894 (PDF p.11). IMPORTANT no general policy invariance of mu, gamma or xi.

**Lemma 2, original eq (11), printed p.1896 (PDF p.13):**
d ln Y / d tau_ij at tau=0 = omega_ij (mu_i-gamma_i).
**Proposition 1, printed p.1899 (PDF p.16):**
SV_ij := -[dC/dtau_ij]/[dG/dtau_ij] at tau=0 with total lump-sum tax T fixed = xi_i.
**Corollary 1:** at fixed public good G, net aggregate output marginal return per extra public subsidy dollar = xi_i-1.
**Proposition 2, printed p.1900 (PDF p.17):** E[ xi ]=1 under sector wage/income shares in no-policy equilibrium; first-order aggregate changes approximately Cov(xi,s_i), weighted by sector value added.

The budget derivative is the decisive boundary:
d/dtau_ij[sum_{k,n} tau_kn P_n M_kn + sum_k tau_kL W L_k] =
P_j M_ij + terms proportional to pre-existing tau times endogenous d(P_nM_kn)/dtau and d(WL_k)/dtau.
At **tau=0**, these latter network-response fiscal effects vanish TO FIRST ORDER; **NOT TRUE at a positive existing subsidy vector**. Thus neither nonlinear policy changes nor endogenous network response invalidate Proposition 1, and mere nonmarginal endogenous network change is old.
Additional **Proposition 3**, printed p.1905 (PDF p.22) actually characterizes nonmarginal constrained optimal labor-input subsidies under Cobb–Douglas, so do **not** inaccurately claim Liu only solves marginal interventions. Position new question at *strategic local authorities plus supplier selection*, not simply "nonmarginal/changed network".

**SymPy reconstruction** (verification code alongside this report, not a full original proof): vertical 2-sector Cobb–Douglas chain where final-good downstream sector 2 uses share b∈(0,1) of upstream 1 and faces input wedge chi>0. Normalize downstream revenue to 1. Upstream sales q=b/(1+chi), aggregate real factor income W=(1-b)+q; influence vector (b,1); Domar weights (q/W,1/W); centralities xi_U=(1+chi)W=1+chi(1-b), xi_D=W. Hence xi_U/xi_D=1+chi>1, and factor-income-weighted average xi is 1. This verifies the original sufficient-statistic intuition, not a new result. Formal derivatives and exact example checked independently by Python/SymPy on 2026-10-10.

## 2. Primary-parent B: Poirier (January 8, 2025 AUTHOR edition): exact model, discontinuities, national decision maker

Author's PUBLIC FULL original PDF, Jan 8 2025, text extracted/read:
https://drive.google.com/file/d/1lg_r1qzrIS9hjvUqf-HbhJot9Lt_1G0r/view?usp=sharing
An earlier Dec 12 2024 SSRN 60-page version at https://ssrn.com/abstract=5052853 is NOT silently treated as identical to 2025 revised PDF.

Timeline, p.6: **one** fiscal authority chooses vector tau_i of sector-specific ad valorem taxes/subsidies; firms select subsets S_i of suppliers, then intermediate/labor inputs; a single representative consumer's budget/utility clears. Firms' sector production Y_i=F_i(S_i,A_i(S_i),L_i,X_i) [eq (1)]. Firm chooses supplier set to minimize unit cost [eq (3)].

All firms have contestable prices P_i=(1+tau_i+m_i)*K_i(S_i,A_i(S_i),P) [eq (4)], where m_i>=0 is dissipative market-imperfection rate (called mu in Poirier's paper, distinct from **influence mu** in Liu). In Poirier **positive tau_i is a TAX**, negative is a subsidy: **exact opposite sign convention from Liu**. Fiscal revenue Lambda_i=tau_i/(1+tau_i+m_i)*P_iY_i [eq (5)] rebated to single national household. Household total consumption budget 1+sum_i Lambda_i [eq (8)], wages normalized W=1. Government welfare is solely this national household's u. No region-specific taxes, no locally elected governments, no multi-authority strategic Nash in verified model.

With Cobb–Douglas and multiplicative network productivity: firm i adopts supplier j iff b_ij>=a_ij p_j, where p_j=log(P_j), b_ij=log(B_ij) and a_ij is input-expenditure share, eq (19), printed p.13. Sectoral linkage decisions alter log equilibrium prices via Leontief inverse [eq (20)] and real welfare [eq (23)]. As taxa/subsidies cross supplier-link thresholds, networks and aggregate welfare are discontinuous; **Proposition 1** gives an interior local tax derivative and a one-sided edge *jump* [eqs (24),(25)]. A government can thus change the active network by a finite or arbitrarily small sector tax adjustment. **This IS ALREADY PROVED BY POIRIER, not our candidate novelty.**

**Theorem 1** (printed p.20): if no imperfections and under Assumptions 1–2, laissez-faire tau=0 is optimal; not a general theorem that no other policy has equal welfare. **Proposition 2** for horizontal network: any symmetric industrial policy is optimal under stated conditions. **Proposition 3** (printed p.23): increasing market imperfection vector weakly decreases maximized welfare. The full published-parent model allows discontinuous welfare and solves central targeting (analytic and numerical). It does NOT prove a multi-jurisdiction fiscal policy Nash, at least under inspected source definition: this is a verified **missing endogenous decision-maker** in Poirier's chosen architecture, but NOT independently confirmed global scholarly gap.

**Critical microfoundation warning:** merely attach region labels to firm sectors does NOT define local residents, ownership or their real consumption; to make regional local utilities, one must choose local labor endowments, capital ownership, wages, local tax responsibility and interregional firm profits, accounting for global goods prices. Adding arbitrary alpha*A income split repeats the original rejected paper's incidence weakness.

## 3. High-threat benchmark C: Ogawa & Wildasin (2007 WP -> 2009 AER)

ORIGINAL 31-page publicly available CESifo 2007 WP (journal-final 2009 differs possibly):
https://www.ifo.de/DocDL/cesifo1_wp2142.pdf
Published version: https://doi.org/10.1257/aer.99.4.1206

N heterogeneous jurisdictions, competitive production f_i(k_i), and perfectly mobile fixed-sum capital. Tax ti on capital, local public good gi, homogeneous transboundary physical externality coefficient beta. Local quality e_i=a*k_i+beta*sum_{j !=i} a*k_j [eq (1)]. Local government solves own resident u_i(x_i,g_i,e_i), under atomistic factor return rho and lump-sum public finance. Its optimal policy local conditions [eqs (9),(10)]:
u_ig/u_ix=1,
t_i=-a(1-beta)*(u_ie/u_ix).
Constrained planner conditions [eqs (13),(14)] are equivalent to those local first-order conditions because a *common* term beta*sum_l a u_le/u_lx drops out of every cross-jurisdiction marginal-capital difference. WP **Proposition 1, p.10 (PDF p.11)** concludes decentralized allocation first-best Pareto efficient under the maintained neoclassical/global-capital-market assumptions; footnote explicitly warns FOC correspondence alone does not imply global efficiency absent additional concavity/regularity.

**Equation-level boundary**: region-specific beta_ij, heterogeneous emissions factors a_i, alternative public input spillovers break the exact theorem proof; see original WP p.11. This does NOT authorize claiming any such relaxation is globally novel—the authors discuss it and subsequent fiscal-federalism literature is extensive. Sign-robust hypothesis MUST include the possibility that full-price/factor reallocation creates efficient policy even with externalities. Prior failed original post-JRS Stage-2 market-price Model A reinforces this.

## 4. Adjacent parents and source-depth blockers

**Armbruster & Hintermann (2020)**, "Decentralization with porous borders: Public production in a federation with tax competition and spillovers", *International Tax and Public Finance*, DOI https://doi.org/10.1007/s10797-019-09572-7. Publisher metadata, original author-university repository and Springer author preview inspected; **full published theorem and equations NOT obtained**. Abstract establishes strategic regional/federal sequencing, public input spillovers, transfers and financed matching grants; kills novelty based only on grants or bargaining/timing. Technical equation-level distinctness of possible network-formation subgame **unresolved**.

**Suga, Yanase & Tawada (2026)**, "Endogenous comparative advantage via symmetry-breaking policy equilibrium", *Scandinavian Journal of Economics* 128(3), 748–786, DOI https://doi.org/10.1111/sjoe.70007. Published original abstract confirms two-country Ricardian policy Nash, trade costs, multi-good, AND upstream-market input-output linkage/entry-regulation application. Related **different** full 2025 Hokkaido WP https://eprints.lib.hokudai.ac.jp/dspace/bitstream/2115/95136/1/DPA382.pdf read previously (policy-restricted PPF Q2=Gamma(Q1,R), envelope Lambda''=Gamma_11-Gamma_1R^2/Gamma_RR and symmetry-breaking theorem). Do NOT transfer companion WP propositions automatically to final 2026 journal article. **Full published theorem for upstream IO application unavailable.**

**Keen & Marchand (1997)** and **Kikuchi, Kuzawa & Tamai (2026)** already analyze fiscal-spending composition; no novelty from x_i+other spending=B alone. **Acemoglu & Azar (2020)** underpins Poirier's endogenous supplier network existence. No claim of exhaustive discovery.

## 5. Theorem-to-theorem whole-game map at Stage 1 (not Stage 2 novelty certificate)

| Paper | Policymaking agents | Business links | Public money / local incidence | Exact verified theorem or result | Potential missing margin |
|---|---|---|---|---|---|
| Liu 2019 QJE | 1 benevolent national authority | Nonparametric input-demand response; not binary supplier Nash | 1 household, national lump-sum fiscal balance | Lemma2, P1, P2, P3: xi and finite CD optimal policy | Rival LOCAL govt Nash absent |
| Poirier 2025 revised WP | 1 national gov | YES binary supplier choice & discontinuous link switches | Taxes and subsidies rebated through ONE household | Link adoption condition eq19, P1 jumps, Thm1, P2/P3 | Rival LOCAL govt Nash absent |
| Ogawa–Wildasin 2007/2009 | N atomistic local governments | Mobile CAPITAL and spillback, NOT supplier choice | Local tax/public goods, local preferences | WP P1 first-best decentralized efficiency under homogeneous beta | Firm supplier network absent |
| Armbruster–Hintermann 2020 | Central + regions, alternating leadership | Local capital/tax-base competition, spillovers; endogenous supplier links not confirmed | Transfers/matching grants with fiscal feedback | Abstract: sequencing-dependent efficiency and funding rules; full math unresolved | Supplier switching not confirmed, no novelty assertion |
| Suga et al. 2026 | 2 national governments/countries | IO upstream-entry example and comparative advantage | Public-good policy; detailed appropriation unresolved | Abstract: symmetry-breaking Nash; IO example; final equations unresolved | Cross-region supplier-selection Nash not confirmed |
| Earlier original IPCRVC | 2 local governments | Exogenous bilinear cross-regional matches | Arbitrary fixed alpha capture; no microfounded GE | Old two-region Nash/planner wedge | NOT a valid parent to simply patch |

**Nuance:** "No single paper in this table has verified ALL ingredients" does NOT imply originality. Full-game strategic feedback needs an independent result unavailable by standard direct combination, with market incomes correctly accounted for.

## 6. Exact scope of next admissible hypothesis — not a new game
The only defensible theory question surviving source reconstruction is:

"Does strategic choice of industry-specific budgets by separate local welfare-maximizing governments, **with verifiable local tax/ownership incidence**, alter the existence, selection and constrained efficiency of firm supplier-link networks in a way that a sole benevolent national planner (Liu/Poirier) and smooth mobile-factor decentralized policymaking (Ogawa–Wildasin) do NOT already imply?"

At Stage 2, prove/kill novelty BEFORE any newly parameterized Stage-3 game by testing:
(a) whether Poirier's one-household Ramsey game plus regional weights becomes a simple weighted welfare decomposition rather than a genuinely strategic equilibrium;
(b) whether local income is priced and fully internalized, as in Ogawa–Wildasin, causing no decentralized distortion;
(c) whether network switches merely repeat Poirier's original local jumps after relabeling;
(d) whether central grants/leadership repeat Armbruster–Hintermann;
(e) whether Suga's IO/entry game already embeds the chosen regional policy Nash;
(f) what is a bona fide nontrivial theorem in which LOCAL policy changes induce DIFFERENT firm link/budget responses with a globally verified equilibrium, not just a named interaction.

One-sided finite-deviation and off-path firm response checks are mandatory if Stage 2 ever authorizes Stage 3; a phase diagram with no complete government best responses is insufficient.

## 7. Explicit assumptions/limits and governance

- No new equilibrium/game solved. No novelty certified, journal target chosen or new Theory Freeze.
- Liu's full main paper consulted; Online Appendix B original proofs not exhaustively re-derived. Poirier January 2025 author manuscript read at model/inequality/proposition-level; full appendix original proofs not independently reproduced. Ogawa working-paper model/proposition checked, not assumed identical to published 2009 12-page version.
- Suga published final and Armbruster published full theorem are **one consolidated outstanding adjacent-parent source-depth blocker**. Resolve that before claiming a completed theorem-to-theorem frontier audit, then enter Stage 2 novelty kill only if they do not absorb the mechanism.
- AI-assisted literature/mathematical audit by GPT-6, 2026-10-10; independent symbolic regression by SymPy; HUMAN AUTHOR, FORMAL, EXTERNAL HUMAN verification still pending.
- No input data, econometrics, industry panel or calibration/estimation; no edit to historical JRS material.
