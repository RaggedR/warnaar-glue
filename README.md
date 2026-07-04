# WarnaarGlue

Lean 4 / Mathlib formalization of the connecting arguments ("glue") in two
results on Warnaar's positivity conjectures for A₂ cylindric partitions:

1. **Conjecture 2 at k = 3, profile (3,3,2), d = 8 (modulus 11)** — the first
   proved case beyond k = 2, via a chain through Warnaar's finite form, a
   Kanade–Russell contiguous relation, and Uncu's modulus-11 theorem.
2. **Bounded refinement at d = 4 (modulus 7)** — the truncated generating
   functions satisfy H_{c,m} = Σ_{n≤m} [m,n]_q Q_{n,c} with explicit
   manifestly positive forms for Q_{n,c}, built on Corteel–Welsh's bounded
   fermionic forms; the two "wall" orbits are handled by exact absorption
   identities in ℤ[q].

## Contents

| File | What it proves |
|------|----------------|
| `WarnaarGlue/GaussBinomial.lean` | Gaussian (q-)binomials as polynomials — Mathlib has none. q-Pascal (both forms), symmetry, orthogonality/inversion both ways. Reusable. |
| `WarnaarGlue/PascalLadder.lean` | `pascal_ladder`: the A₂ Pascal ladder ferm(m,a,b,c) − ferm(m−1,a,b,c) = q^{m+a} ferm(m−1,a+1,b−1,c+2). |
| `WarnaarGlue/Inversion.lean` | `qbinom_inversion`, `Q_transform_of_H`, `H_of_Q_transform`: the exact Q ↔ H q-binomial transform pair. |
| `WarnaarGlue/D4Positive.lean` | `absorption_A`, `absorption_B` (exact ℤ[q] identities), `Qcw_nonneg` (all five d=4 orbit forms coefficientwise ≥ 0) — unconditional. `d4_Q_eq_Qcw`, `d4_positive`, `d4_BFF`, `d4_monotone` — conditional on named hypotheses (below), with a machine-checked non-vacuity witness. |
| `WarnaarGlue/Seed2Chain.lean` | `qpoch_split` and bridges (sorry-free); `seed2_assembly`/`seed2_chain`: assembly of the k=3 chain from its literature inputs as named hypotheses. |

## Named hypotheses

Published literature results are imported as **explicit named hypotheses**,
not proved here:

- `hCW` — Corteel–Welsh's bounded fermionic forms at d = 4
  (*The A₂ Rogers–Ramanujan identities revisited*), denominators cleared.
- `hQ` — the Q-transform (Euler-expansion step; the underlying q-binomial
  inversion **is** proved, in `Inversion.lean`).
- `hWarnaar`, `hBridge`, `hUncu` — Warnaar's finite form, the Kanade–Russell
  contiguous relation, and Uncu's modulus-11 theorem, for the k=3 chain.
- `hSplit` — one termwise series interchange inside a 6-fold sum (no Mathlib
  summability framework currently fits its shape; the cleared polynomial
  identity behind it, `qpoch_split`, is proved).

Everything else is sorry-free. Axiom footprint of every theorem:
`propext`, `Classical.choice`, `Quot.sound` only (the chain assembly needs
only `propext`). No `sorry`, `admit`, or `native_decide`.

## Building

Requires [elan](https://github.com/leanprover/elan); the toolchain
(Lean 4.30.0-rc2) and Mathlib pin are in `lean-toolchain` / `lake-manifest.json`.

```
lake exe cache get   # fetch Mathlib build cache
lake build
```

## License

Apache 2.0.
