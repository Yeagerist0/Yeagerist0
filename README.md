### Hitarth Jain

Computer Science student focused on security engineering — building tools that detect, correlate, and fix real vulnerabilities instead of just reporting them. Active in bug bounty hunting.

**Currently building**

**SentinelX** — self-hosted EDR + lightweight SIEM that correlates endpoint telemetry into investigations via a per-host provenance graph. No LLM in the detection path (Go, C, eBPF)

**TheKnight** — AWS misconfiguration scanner that opens the fix as a pull request instead of just a dashboard (Go, Terraform)

**prompt-injection-soc-telemetry** — measures how well LLM-narrated security telemetry resists indirect prompt injection. 66 payloads across three defense tiers: naive 23% bypass → prompt-hardened 6% → structurally grounded 8%, with the structural tier never downgrading severity in its own voice (0/31). On a second model the structural tier's advantage replicates and the prompt-hardened tier's does not

**instruction-provenance-probe** — the mechanistic version of the same question: is "operator instruction" vs "instruction embedded in retrieved data" linearly decodable from GPT-2's residual stream? A length confound found in my own design, then a null result (PyTorch, linear probes, activation steering)

**Connect**

LinkedIn: [linkedin.com/in/hitarthjain-security](https://www.linkedin.com/in/hitarthjain-security)
