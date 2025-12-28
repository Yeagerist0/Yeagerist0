## Hitarth Jain

CS undergrad at Scaler School of Technology, graduating 2027. I build security tooling and hunt bug bounties. Most of what's here exists because I wanted to know whether something actually worked, not because someone assigned it.

### Start here

**[sentinelx](https://github.com/Yeagerist0/sentinelx)** — self-hosted EDR plus a lightweight SIEM, in Go, C and eBPF. Endpoint telemetry gets correlated into a per-host provenance graph, so an investigation is a subgraph you can walk instead of a pile of alerts to sort. No LLM anywhere in the detection path, on purpose.

**[theknight](https://github.com/Yeagerist0/theknight)** — AWS misconfiguration scanner that opens the fix as a pull request. Every scanner will tell you the bucket is public. This one sends the Terraform diff that closes it.

**[prompt-injection-soc-telemetry](https://github.com/Yeagerist0/prompt-injection-soc-telemetry)** — can an LLM writing up your security alerts be talked into lying by text sitting inside those alerts? 66 payloads across three narrator defense tiers: naive got bypassed 23% of the time, prompt-hardened 6%, structurally grounded 8%. The bypass rate turned out to be the boring number. The structural tier never downgraded a severity in its own voice (0/31), and on a second model that advantage replicated while the prompt-hardened tier's didn't. Partway through I found a confound in my own judge and had to rerun the whole thing.

**[instruction-provenance-probe](https://github.com/Yeagerist0/instruction-provenance-probe)** — the same question one level down: is "this instruction came from the operator" versus "this one came from retrieved data" linearly decodable from GPT-2's residual stream? Linear probes and activation steering in PyTorch. I caught a length confound in my own design, fixed it, and got a clean null. Writing up a null is less fun than the alternative.

### Also here

- **[CyberML](https://github.com/Yeagerist0/CyberML)** — forecasts next-week attack risk for public-facing services from honeypot telemetry, Shodan exposure, CVE feeds and PoC-exploit tracking.
- **[JobBoard](https://github.com/Yeagerist0/JobBoard)** — React, TypeScript and Supabase, with separate employer and candidate flows. [Live](https://job-board-alpha-fawn.vercel.app).
- **[RAG](https://github.com/Yeagerist0/RAG)** — corrective-RAG document Q&A. When the grader says the retrieved chunks don't answer the question, it re-retrieves rather than guessing.
- **[SpringBootFinalProject](https://github.com/Yeagerist0/SpringBootFinalProject)** and **[rideshare](https://github.com/Yeagerist0/rideshare)** — Spring Boot backends with JWT auth, role-based access and Docker Compose.
- Java low-level design: [movieticketlld](https://github.com/Yeagerist0/movieticketlld) (concurrency-safe seat locking, with the race-condition tests), [elevatorlld](https://github.com/Yeagerist0/elevatorlld), [parkinglotlld](https://github.com/Yeagerist0/parkinglotlld).

### Bug bounty

HackerOne and Intigriti. The findings that get paid are almost always the same shape: an unauthenticated path into a function that assumed nobody could reach it from outside.

### Contact

[LinkedIn](https://www.linkedin.com/in/hitarthjain-security)
