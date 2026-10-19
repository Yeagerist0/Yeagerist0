<div align="center">

# Hitarth Jain

### Security engineering · AI evaluation · backend systems

**I build tools that stay honest about what they can prove.**

Bengaluru, India · CS undergraduate, graduating 2027

[Website](https://yeagerist0.github.io) · [LinkedIn](https://www.linkedin.com/in/hitarthjain-security) · [Kaggle](https://www.kaggle.com/hitarthjain0) · [Email](mailto:jainhitarth963@gmail.com)

</div>

I work on security tooling and AI evaluation, with a focus on evidence: what a scanner can demonstrate, what a model can safely infer, and what an experiment can actually support. I also do vulnerability research through HackerOne and Intigriti.

## Featured work

<table>
  <tr>
    <td width="50%" valign="top">
      <strong><a href="https://github.com/Yeagerist0/warrant">Warrant</a></strong><br>
      An authorization-scoped web pentest agent. It plans typed probes and reports a finding only when its evidence shows the impact. Go.
    </td>
    <td width="50%" valign="top">
      <strong><a href="https://github.com/Yeagerist0/sentinelx">SentinelX</a></strong><br>
      Self-hosted EDR and lightweight SIEM. Go, C and eBPF telemetry becomes investigations through a per-host provenance graph.
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      <strong><a href="https://github.com/Yeagerist0/theknight">TheKnight</a></strong><br>
      AWS misconfiguration scanner that can turn a finding into a reviewed Terraform pull request.
    </td>
    <td width="50%" valign="top">
      <strong><a href="https://github.com/Yeagerist0/CyberML">CyberML</a></strong><br>
      Forecasts near-term attack risk from exposure, honeypot telemetry, CVEs and exploit signals.
    </td>
  </tr>
</table>

## Research

- **[Prompt injection in SOC telemetry](https://github.com/Yeagerist0/prompt-injection-soc-telemetry)** — a 66-payload corpus and evaluation harness for testing how narrator defenses handle hostile endpoint data. The write-up includes a scoring confound I found and corrected, plus results that did not support my initial hypothesis.
- **[Instruction provenance probe](https://github.com/Yeagerist0/instruction-provenance-probe)** — tests whether GPT-2 representations distinguish operator instructions from retrieved text. A length confound led to a null result, which is documented with the experiment.

## Open source

Selected merged security contributions:

- [TensorFlow #128181](https://github.com/tensorflow/tensorflow/pull/128181) — fixed eager-mode validation for `tf.name_scope` while preserving names used by existing callers.
- [OWASP CRS #4774](https://github.com/coreruleset/coreruleset/pull/4774) — added SSTI detection coverage for Velocity and FreeMarker directive syntax.
- [OWASP WSTG #1506](https://github.com/OWASP/wstg/pull/1506) — added practical SSTI probes and guidance for template engines that evaluate directives.
- [NVIDIA garak #2146](https://github.com/NVIDIA/garak/pull/2146) — fixed a wordlist key that left a shipped detector empty and added a regression check.
- [OWASP Agent Memory Guard](https://github.com/OWASP/www-project-agent-memory-guard/security/advisories?state=published) — reported two published security advisories; fixes shipped in v0.3.3.

## Other projects

[Corrective RAG](https://github.com/Yeagerist0/RAG) · [JobBoard](https://github.com/Yeagerist0/JobBoard) · [Spring Boot expense tracker](https://github.com/Yeagerist0/SpringBootFinalProject) · [Ride-sharing backend](https://github.com/Yeagerist0/rideshare) · [Movie ticket booking](https://github.com/Yeagerist0/movieticketlld)

## Kaggle

I like experiments that report uncertainty and keep the failed ideas visible. Selected notebooks: [RSNA knee MRI](https://www.kaggle.com/code/hitarthjain0/rsna-knee-coatnet-convnext-mil-lb-0-950) · [Public vs. private leaderboard ranks](https://www.kaggle.com/code/hitarthjain0/how-much-does-the-public-leaderboard-lie) · [Store Sales: random CV vs. a real forecast](https://www.kaggle.com/code/hitarthjain0/store-sales-how-wrong-is-random-cv)

## Tools I use

**Languages:** Go, Python, C/C++, Rust, Java, TypeScript<br>
**Security & systems:** eBPF, AWS, Linux, web application security<br>
**ML & evaluation:** PyTorch, Transformers, adversarial testing, reproducible benchmarks

<div align="center">

*Build carefully. Measure honestly. Show the evidence.*

</div>
