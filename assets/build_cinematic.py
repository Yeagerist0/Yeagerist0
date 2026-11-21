"""Build the GitHub profile banner from editable SVG frames.

The code pane is an illustrative design sketch, not a snippet from a project.
Requires ImageMagick (`magick`) for SVG rendering and GIF assembly.
"""

from html import escape
from pathlib import Path
import subprocess
import tempfile


HERE = Path(__file__).resolve().parent
OUTPUT = HERE / "hitarth-security.gif"
CODE = [
    ("01", "// design sketch: verify before report", "#7f98a9"),
    ("02", "if !scope.Allows(target) {", "#75e8e1"),
    ("03", "    return deny", "#f1a96a"),
    ("04", "}", "#75e8e1"),
    ("05", "trace := ebpf.Observe(host)", "#bdd7e2"),
    ("06", "if !evidence.Proves(claim, trace) {", "#75e8e1"),
    ("07", "    return investigate", "#f1a96a"),
    ("08", "}", "#75e8e1"),
    ("09", "return report.Verified(claim)", "#63f5ad"),
]


def frame(index: int) -> str:
    visible = min(len(CODE), max(3, index + 3))
    scan_y = 118 + (index * 21) % 245
    glitch = index in (3, 9)
    ghost_x = 7 if glitch else 2
    ghost_opacity = ".45" if glitch else ".18"
    cursor = "▌" if index % 2 == 0 else " "

    code_lines = []
    for row, (number, code, color) in enumerate(CODE[:visible]):
        y = 143 + row * 28
        code_lines.append(
            f'<text x="824" y="{y}" fill="#486270" font-size="20">{number}</text>'
            f'<text x="876" y="{y}" fill="{color}" font-size="20">{escape(code)}</text>'
        )
    if visible < len(CODE):
        code_lines.append(
            f'<text x="876" y="{143 + visible * 28}" fill="#63f5ad" font-size="20">{cursor}</text>'
        )

    return f'''<svg xmlns="http://www.w3.org/2000/svg" width="1600" height="500" viewBox="0 0 1600 500">
<defs>
  <linearGradient id="bg" x2="1" y2="1"><stop stop-color="#05090f"/><stop offset="1" stop-color="#0d1b29"/></linearGradient>
  <pattern id="grid" width="36" height="36" patternUnits="userSpaceOnUse"><path d="M36 0H0V36" fill="none" stroke="#163044" opacity=".5"/></pattern>
</defs>
<rect width="1600" height="500" fill="url(#bg)"/>
<rect width="1600" height="500" fill="url(#grid)"/>
<path d="M0 0H1600" stroke="#53f3c2" stroke-width="5"/>
<path d="M38 83H720" stroke="#2d635f"/>
<path d="M38 400H720" stroke="#2d635f"/>
<g font-family="DejaVu Sans Mono, monospace">
  <text x="49" y="57" fill="#53f3c2" font-size="18" letter-spacing="2">APPSEC   /   EDR   /   AI SECURITY</text>
  <text x="{49 + ghost_x}" y="196" fill="#ff5e9a" opacity="{ghost_opacity}" font-size="100" font-weight="700">HITARTH</text>
  <text x="49" y="196" fill="#f2f7fb" font-size="100" font-weight="700">HITARTH</text>
  <text x="{49 + ghost_x}" y="320" fill="#42dff6" opacity="{ghost_opacity}" font-size="124" font-weight="700">JAIN</text>
  <text x="49" y="320" fill="#f2f7fb" font-size="124" font-weight="700">JAIN</text>
  <text x="51" y="366" fill="#a4bfca" font-size="21">security engineering × AI security research</text>
  <text x="51" y="441" fill="#758f9d" font-size="16">BENGALURU  ·  CS '27  ·  OPEN TO INTERNSHIPS</text>
  <rect x="778" y="38" width="773" height="422" rx="14" fill="#08121d" stroke="#2a5360" stroke-width="2"/>
  <path d="M778 90H1551" stroke="#2a5360" stroke-width="2"/>
  <circle cx="810" cy="64" r="7" fill="#fa7185"/><circle cx="834" cy="64" r="7" fill="#f9c264"/><circle cx="858" cy="64" r="7" fill="#53f3c2"/>
  <text x="894" y="71" fill="#a4bfca" font-size="18">evidence.go  —  security design sketch</text>
  <rect x="802" y="108" width="724" height="318" rx="6" fill="#0b1a27"/>
  <path d="M804 {scan_y}H1524" stroke="#53f3c2" stroke-width="3" opacity=".10"/>
  {''.join(code_lines)}
  <text x="824" y="400" fill="#5c7b87" font-size="15">scope → trace → verify → report</text>
</g>
</svg>'''


def main() -> None:
    with tempfile.TemporaryDirectory(prefix="profile-banner-") as temp:
        directory = Path(temp)
        frames = []
        for index in range(12):
            svg = directory / f"{index:02d}.svg"
            png = directory / f"{index:02d}.png"
            svg.write_text(frame(index), encoding="utf-8")
            subprocess.run(
                ["magick", "-background", "#05090f", str(svg), "-alpha", "off", "-depth", "8", str(png)],
                check=True,
            )
            frames.append(png)

        command = ["magick", "-loop", "0"]
        for index, png in enumerate(frames):
            command.extend(["-delay", "230" if index == 11 else "13", str(png)])
        command.extend(["-layers", "Optimize", str(OUTPUT)])
        subprocess.run(command, check=True)


if __name__ == "__main__":
    main()
