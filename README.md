# clairo charm notebook

A [diplomatic edition](https://chaucer.fas.harvard.edu/types-editions) of [Clairo](https://en.wikipedia.org/wiki/Clairo)'s [Charm](<https://en.wikipedia.org/wiki/Charm_(Clairo_album)>) notebook that was shown in [this tiktok](https://www.tiktok.com/@xxclairoxx/video/7573392753493626126), created with [Typst](https://typst.app/).[^diplomatic]

The PDF, located in `target/book.pdf`, contains the notebook's text and drawings recreated with standardized fonts and symbols while preserving each element's location on the page. You can also view images of each page in `target/book01.png`, `target/book02.png`, etc.

## why

1. Better understanding Typst. The interesting layouts of this notebook's many diagrams provided a good way to teach myself how to deal with formatting edge cases.
2. Making the notebook easier to read, by allowing readers to go through the notebook at their own pace without having to pause a video every few seconds, and making it easier to read the text on pages that were only shown for a few frames in the video.
3. Making the notebook more accessible, because the text information in the PDF is easier to process for screen readers. I have written accessible descriptions of the notebook's diagrams, and have used semantic elements for the text markup, but definitely make a PR if there's something I can improve!

## notes

- Based on some basic research, the notebook used seems to be a 3.5" x 5.5" moleskine pocket size. I've tried to recreate the formatting of this kind of notebook, including a "In case of loss, please return to..." page at the start, and adding 23 text lines spaced 6 mm apart to each page. The PDF's colors are based on color samples taken from the video.
- Throughout the notebook, Clairo uses two writing styles in addition to normal handwriting to test out different writing styles for the word "Charm": a cursive script and bubble letters. I represent these different writing styles with different fonts.
- The text on the bottom of page 9 (in the PDF) was impossible to decipher, in large part due to Clairo's thumb, so I replaced ambiguous letters with question marks. This page was difficult in general because Clairo never centered it in the video, so all the information for this page comes from:
  - Parts of the video focusing on page 10 that have page 9 partially in view
  - Blurry frames when stray camera movements reveal more parts of the page
  - page 9's text ink bleeding through to page 8

## building

First, install [Typst](https://typst.app/open-source/#download). Then, make sure you have the fonts `Atkinson Hyperlegible` and `Satisfy` installed in your system.

To build, run

```bash
typst compile book.typ target/book.pdf # pdf
typst compile book.typ target/book{0p}.png --ppi 600 # png
```

[^diplomatic]: I'm not sure if "diplomatic edition" is the correct description for this project. My goal is to create a PDF that uses a standard font to represent the text and standard symbols for any diagrams or other markings, while trying to match the original placement and spacing of all the elements on the page.
