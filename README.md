# Hitarth Jain

**Security engineering · AI security research**

CS undergraduate in Bengaluru, graduating in 2027. I build security tools, test their failure modes, and publish the evidence behind my claims. Open to internships in both security engineering and AI security research.

[Portfolio](https://yeagerist0.github.io) · [LinkedIn](https://www.linkedin.com/in/hitarthjain-security/) · [Email](mailto:jainhitarth963@gmail.com)

## Work to start with

| Project | What you can verify |
| --- | --- |
| [Warrant](https://github.com/Yeagerist0/warrant) | Go web testing agent that checks scope at DNS, dial and redirect time, then refuses to report findings whose evidence does not support the claimed impact. [Design and tests](https://github.com/Yeagerist0/warrant#status). |
| [SentinelX](https://github.com/Yeagerist0/sentinelx) | Linux eBPF telemetry flows through a Go backend into linked investigations. The README includes [live agent validation](https://github.com/Yeagerist0/sentinelx#verified-live-this-build), replay commands and tests. |
| [TheKnight](https://github.com/Yeagerist0/theknight) | AWS misconfiguration scanner that produces reviewable Terraform fixes. The compiled tool [opened this test PR](https://github.com/Yeagerist0/theknight-pr-test/pull/1). |
| [Prompt injection in SOC telemetry](https://github.com/Yeagerist0/prompt-injection-soc-telemetry) | A 66-payload evaluation of attacker-controlled security telemetry across three narrator designs. The [results](https://github.com/Yeagerist0/prompt-injection-soc-telemetry#results) include confidence intervals and a scoring mistake I corrected. |

## Open-source work

I submit small fixes with reproductions and regression tests. A few merged examples:

- [Metasploit: fix ColdFusion fingerprint handling](https://github.com/rapid7/metasploit-framework/pull/22078) and [reject invalid binary-encoding bytes](https://github.com/rapid7/metasploit-framework/pull/22087)
- [OWASP WSTG: add SSTI directive-syntax probes](https://github.com/OWASP/wstg/pull/1506)
- [OWASP Agent Memory Guard: emit events for swallowed detector errors](https://github.com/OWASP/www-project-agent-memory-guard/pull/138)
- [ProjectDiscovery httpx: avoid retrying absolute favicon URLs as target paths](https://github.com/projectdiscovery/httpx/pull/2681)

[Browse all merged pull requests](https://github.com/pulls?q=is%3Apr+author%3AYeagerist0+is%3Amerged) · [OWASP security advisories](https://github.com/OWASP/www-project-agent-memory-guard/security/advisories?state=published)

## Research notes

[Instruction provenance probe](https://github.com/Yeagerist0/instruction-provenance-probe) documents a length confound and a corrected null result. I leave failed hypotheses visible so the next experiment starts from what the evidence actually shows.

**Tools I use:** Go, Python, eBPF, Linux, AWS, Terraform, PyTorch, Burp Suite.
