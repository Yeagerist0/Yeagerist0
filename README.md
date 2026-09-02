## Hitarth Jain

The two results I'd show you first are the ones that killed my own hypothesis.

My prompt-injection work looked like a clean win — 6.1% bypass for one defense tier, 7.6% for the other — until I computed the interval and found the two don't separate at all. My GPT-2 probe looked like it decoded instruction provenance until I found the length confound I'd built into my own design; that one ended in a null. Both are published here with the numbers that make them look worse.

I build security tooling in Go and eBPF, hunt bugs on HackerOne and Intigriti, and report what the measurement actually says. CS undergrad at Scaler School of Technology in Bengaluru, graduating 2027.

### Start here

**[sentinelx](https://github.com/Yeagerist0/sentinelx)** — self-hosted EDR plus a lightweight SIEM, in Go, C and eBPF. Endpoint telemetry gets correlated into a per-host provenance graph, so an investigation is a subgraph you can walk instead of a pile of alerts to sort. No LLM anywhere in the detection path, on purpose.

**[theknight](https://github.com/Yeagerist0/theknight)** — AWS misconfiguration scanner that opens the fix as a pull request. Every scanner will tell you the bucket is public. This one sends the Terraform diff that closes it.

**[prompt-injection-soc-telemetry](https://github.com/Yeagerist0/prompt-injection-soc-telemetry)** — the corpus and harness behind the result above. 66 payloads, three narrator defense tiers, an LLM judge I had to rebuild mid-run after finding a confound in it. Where the tiers do separate is severity: the structurally grounded one never downgraded a severity in its own voice, 0 out of 31, and that held on a second model when the prompt-hardened tier's advantage didn't.

**[instruction-provenance-probe](https://github.com/Yeagerist0/instruction-provenance-probe)** — the mechanistic version of the same question. Is "this instruction came from the operator" versus "this one came from retrieved data" linearly decodable from GPT-2's residual stream? Linear probes and activation steering in PyTorch, and a null result I wrote up anyway.

### Also here

- **[CyberML](https://github.com/Yeagerist0/CyberML)** — forecasts next-week attack risk for public-facing services from honeypot telemetry, Shodan exposure, CVE feeds and PoC-exploit tracking.
- **[JobBoard](https://github.com/Yeagerist0/JobBoard)** — React, TypeScript and Supabase, with separate employer and candidate flows. [Live](https://job-board-alpha-fawn.vercel.app).
- **[RAG](https://github.com/Yeagerist0/RAG)** — corrective-RAG document Q&A. When the grader says the retrieved chunks don't answer the question, it re-retrieves rather than guessing.
- **[SpringBootFinalProject](https://github.com/Yeagerist0/SpringBootFinalProject)** and **[rideshare](https://github.com/Yeagerist0/rideshare)** — Spring Boot backends with JWT auth, role-based access and Docker Compose.
- Java low-level design: [movieticketlld](https://github.com/Yeagerist0/movieticketlld) (concurrency-safe seat locking, with the race-condition tests), [elevatorlld](https://github.com/Yeagerist0/elevatorlld), [parkinglotlld](https://github.com/Yeagerist0/parkinglotlld).

### Bug bounty

HackerOne and Intigriti. The findings that get paid are almost always the same shape: an unauthenticated path into a function that assumed nobody could reach it from outside.

### Contact

[Site](https://yeagerist0.github.io) · [LinkedIn](https://www.linkedin.com/in/hitarthjain-security) · jainhitarth963@gmail.com
