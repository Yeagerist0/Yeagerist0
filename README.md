<div align="center">
  <img src="assets/hitarth-noir-v2.gif" alt="Dark security thriller title sequence with surveillance cuts: Hitarth Jain, Security Engineering and AI Security Research" width="100%">
  <p><strong>I build tools that prove their findings, and experiments that show their limits.</strong></p>
  <p>Bengaluru · CS '27 · Open to security engineering and AI security research internships</p>
  <p><a href="assets/hitarth-noir-v2.mp4">Play full-motion title sequence</a> · <a href="https://yeagerist0.github.io">Portfolio</a> · <a href="https://www.linkedin.com/in/hitarthjain-security/">LinkedIn</a> · <a href="mailto:jainhitarth963@gmail.com">Email</a></p>
</div>

## 01 / Built and tested

<table>
  <tr>
    <td width="50%" valign="top">
      <h3><a href="https://github.com/Yeagerist0/warrant">Warrant</a> · AppSec</h3>
      Go web testing agent that checks scope at DNS, dial and redirect time. Its evidence gate refuses unsupported impact claims.
      <br><br><a href="https://github.com/Yeagerist0/warrant#status">Design + tests →</a>
    </td>
    <td width="50%" valign="top">
      <h3><a href="https://github.com/Yeagerist0/sentinelx">SentinelX</a> · Detection</h3>
      Linux eBPF telemetry flows through a Go backend into linked investigations.
      <br><br><a href="https://github.com/Yeagerist0/sentinelx#verified-live-this-build">Live agent validation →</a>
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      <h3><a href="https://github.com/Yeagerist0/theknight">TheKnight</a> · Cloud</h3>
      AWS misconfiguration scanner that produces reviewable Terraform fixes.
      <br><br><a href="https://github.com/Yeagerist0/theknight-pr-test/pull/1">PR opened by the tool →</a>
    </td>
    <td width="50%" valign="top">
      <h3><a href="https://github.com/Yeagerist0/prompt-injection-soc-telemetry">SOC telemetry</a> · AI security</h3>
      A 66-payload evaluation across three narrator designs, with confidence intervals and a corrected scoring mistake.
      <br><br><a href="https://github.com/Yeagerist0/prompt-injection-soc-telemetry#results">Results + limitations →</a>
    </td>
  </tr>
</table>

<details>
<summary>What evidence-first means in Warrant</summary>

The tool's reviewer can reject a finding when the claimed impact outruns the proof:

```text
$ warrant review examples/finding.reachability-gap.json
Unauthenticated write on the pairing channel

not reportable
  blocked: primitive operates on a victim-scoped identifier, but no observed claim
           shows where an attacker obtains that identifier from an internet position;
           find the disclosure and make that the finding, or do not file
  reduced: claimed high, but observed evidence supports medium
```

[Full example and design notes](https://github.com/Yeagerist0/warrant#why-it-works-this-way)

</details>

## 02 / Patches that landed

As of 25 November 2026, 39 of my PRs have merged, including 32 in repositories
outside my own account. I submit small fixes with reproductions and regression
tests. A few security-focused examples:

- [Metasploit: accept string-key JSON-RPC responses](https://github.com/rapid7/metasploit-framework/pull/22142)
- [Metasploit: deduplicate Windows application inventory](https://github.com/rapid7/metasploit-framework/pull/22160) and [update Recog to fix a Ruby regex warning](https://github.com/rapid7/metasploit-framework/pull/22167)
- [Metasploit: fix ColdFusion fingerprint handling](https://github.com/rapid7/metasploit-framework/pull/22078) and [reject invalid binary-encoding bytes](https://github.com/rapid7/metasploit-framework/pull/22087)
- [OWASP WSTG: add SSTI directive-syntax probes](https://github.com/OWASP/wstg/pull/1506)
- [OWASP Core Rule Set: detect Velocity and FreeMarker directive syntax](https://github.com/coreruleset/coreruleset/pull/4774)
- [OWASP Agent Memory Guard: emit events for swallowed detector errors](https://github.com/OWASP/www-project-agent-memory-guard/pull/138)
- [NVIDIA garak: fix detector category loading](https://github.com/NVIDIA/garak/pull/2146)
- [ProjectDiscovery httpx: avoid retrying absolute favicon URLs as target paths](https://github.com/projectdiscovery/httpx/pull/2681)

[Browse all merged pull requests](https://github.com/pulls?q=is%3Apr+author%3AYeagerist0+is%3Amerged) · [OWASP security advisories](https://github.com/OWASP/www-project-agent-memory-guard/security/advisories?state=published)

## 03 / Research notes

[Instruction provenance probe](https://github.com/Yeagerist0/instruction-provenance-probe) documents a length confound and a corrected null result. I leave failed hypotheses visible so the next experiment starts from what the evidence actually shows.

<p align="center"><strong>Go · Python · eBPF · Linux · AWS · Terraform · PyTorch · Burp Suite</strong></p>
