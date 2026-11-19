# Brück's conjecture in Lean 4

**Provisional authors:** Yixin He, Tao Hu, Quanyu Tang

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

The public declaration is `Bruck.bruck_conjecture`. [Challenge.lean](Challenge.lean)
gives its independent statement and [Solution.lean](Solution.lean) exports the
proof. The project pins Lean and Mathlib, and GitHub Actions checks the build,
the axiom whitelist, and the Palomar Comparator.

```sh
lake exe cache get
lake build
```
