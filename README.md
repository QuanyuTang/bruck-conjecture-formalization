# Brück's conjecture in Lean 4

**Formalization authors:** Pengcheng Fang, Tao Hu, Yanyang Li, Quanyu Tang, Haiqi Zhang

The theorem proves that if a nonconstant entire function $f$ of finite
hyper-order different from every positive integer shares $a \in \mathbb C$
with its first derivative counting multiplicities, then there is a nonzero
constant $c \in \mathbb C$ such that
$f'(z)-a=c(f(z)-a)$ for every $z \in \mathbb C$. It includes $a=0$ and
all nonzero shared values. [Brück (1996)](https://doi.org/10.1007/BF03322176)

Codex produced the Lean formalization from the original informal proof in
*Value Sharing and a First-Order Complex Differential Equation*. The proof
uses equality of local analytic orders, an entire logarithm of the sharing
quotient, and the comparison between the Nevanlinna characteristic and
maximum modulus. For a nonzero shared value, the manuscript's contour
estimate and a radial upper bound control the growth of solutions to
$y'=e^h y+1$. A specialization of the maximum-modulus approximation is
proved using the Wiman–Valiron development from the
[three IM and one CM formalization](https://github.com/QuanyuTang/three-im-one-cm-formalization).
The growth argument for sharing zero uses the ordinary order of a zero-free
entire function. For related polynomial-exponent results, see
[Zhang](https://arxiv.org/abs/2407.00580).

## The statement and its definitions

```lean
import Bruck

#check Bruck.bruck_conjecture
```

Two Lean lemmas connect the definitions in the statement to their classical
formulations. For each point $z$ and each $n$, sharing $a$ with multiplicities
means that the first $n$ Taylor coefficients of $f-a$ vanish at $z$ exactly
when those of $f'-a$ do. This includes the case in which both functions omit
$a$. For a nonconstant entire function, the hyper-order equals
$\limsup_{r\to\infty} \log^+\log^+ T(r,f)/\log r$, where $T(r,f)$ is the
circle mean of $\log^+|f|$. The characteristic tends to infinity, so the two
positive logarithms agree with ordinary logarithms for all sufficiently large
radii. [Definition comparisons](Bruck/StatementChecks.lean)

For $a\ne 0$, the proof shows that if the entire exponent $h$ in
$y'=e^h y+1$ is a nonconstant polynomial, then the hyper-order of $y$ is
exactly its degree. A transcendental entire $h$ gives infinite hyper-order.
The hypotheses therefore force $h$ to be constant.
[Growth classification](Bruck/Classification.lean) · [Main proof](Bruck/Main.lean)

## Verification

Palomar compares the independent theorem in [Challenge.lean](Challenge.lean)
with the proof exported by [Solution.lean](Solution.lean). The Challenge
contains one intentional `sorry`. The build audits the public theorem and
the two definition comparisons for transitive axioms. The allowed axioms are
`propext`, `Classical.choice`, and `Quot.sound`.

```sh
lake exe cache get
lake build
lake env lean -j1 verification/Audit.lean
```

On Linux with bubblewrap and unprivileged user namespaces enabled, run
`bash scripts/verify-comparator.sh` to compare the declarations and replay
the exported proof with Lean, NanoDa, and con-ron. GitHub Actions runs these
checks on each push to `main`.
