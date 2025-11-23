#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/cetz:0.4.2"


#let font-normal = "Atkinson Hyperlegible"
#let font-cursive = "Satisfy"
#let font-print = "Libertinus Serif"
#let line-height = 6mm
#let text-size = 12pt


#set text(lang: "en")
#set document(title: "Clairo Charm Notebook Diplomatic Edition")


#set text(
  size: text-size,
  font: font-normal,
)

#let screen-reader-only(content) = [
  #place[
    #let size = 1pt;
    #let fill = rgb(0, 0, 0, 0);
    #let top-edge = size;
    #set text(size: size, fill: fill, top-edge: top-edge)
    #show text: set text(size: size, fill: fill, top-edge: top-edge)
    #show smartquote: set text(size: size, fill: fill, top-edge: top-edge)
    #content
  ]
]






// #show: it => context {
//   if target() == "html" { return it }
//   it
// }
#set page(width: 3.5in, height: 5.5in, margin: 0in, fill: rgb("#5e4e60"))


#let bubble(content, ..args) = {
  set text(weight: 1000, fill: rgb(0, 0, 0, 0), stroke: black, ..args)
  content
}

#let scribble(content, ..args) = {
  strike(stroke: 0.3em, content)
}

#let cursive(content, ..args) = {
  set text(font: font-cursive)
  content
}

#let print(content, ..args) = {
  set text(font: font-print, size: 9pt)
  content
}

#let circle-text(content, ..args) = {
  box(height: line-height)[
    #place(bottom, float: true, dy: 2pt)[
      #ellipse(height: 1em, inset: 0pt, ..args)[
        #align(bottom)[#content]
      ]
    ]
  ]
}


#page[
  #show heading: set text(size: 30pt)
  #place(dx: 1cm, dy: 1.5cm)[= CHARM]



  #place(dx: 2.875in)[
    #rect(height: 100%, width: 6mm, stroke: none, fill: rgb("#504152"))
  ]
]

#let margin-y = (100% - (22 * 6mm)) / 2
#let lines = {
  for i in range(23) {
    let y = i * line-height + margin-y
    place(
      line(
        start: (0%, y),
        end: (100%, y),
        stroke: 0.3pt + rgb("#a8957a"),
      ),
    )
  }
}
#set page(fill: rgb("#f9ead3"))

#page[
  #box(inset: 0.6in)[
    #print[
      In case of loss, please return to:
    ]

    #for i in range(4) {
      let y = i * line-height
      place(
        line(
          start: (0%, y),
          end: (100%, y),
          stroke: 0.3pt + rgb("#000000"),
        ),
      )
    }

    #place(dy: 2mm, dx: 10mm, [
      Claire Cottrill
    ])
    #box(height: 3 * line-height - 1mm)

    #grid(columns: (auto, 1fr), gutter: 3mm)[
      #print[As a reward: \$]
    ][
      #align(bottom)[

        #line(
          start: (0%, 0mm),
          end: (100%, 0mm),
          stroke: 0.3pt + rgb("#000000"),
        )
      ]
    ]
    #place(dy: -line-height + 3mm)[
      #box(width: 100%)[
        #align(right)[
          you get a book of\
          gibberish #h(2mm)\
          for free
        ]
      ]
    ]
  ]
]

#set text(top-edge: line-height)

#set page(background: lines, margin: (x: 0in, y: margin-y - 0.5mm))


#set par(spacing: 0em, leading: 0em)
#set block(spacing: 0em)
#set list(marker: "-")








#page[

  #set align(center)


  #cursive[
    #show heading: set text(size: 20pt)
    = Songbook \# 3
  ]
]

#page[
  #h(0.5cm) album about sex *?*

  #align(right)[more about sensuality / #h(0.5cm)]

  #h(1cm) discovery

  #h(0.25cm) \- writing to feel sexy to other people

  #h(0.25cm) #circle-text[lust], dreams about people

  #h(0.25cm) \- #underline[independence] through finding #underline[individuality]

  #align(right)[#underline[in sensuality] #h(0.5cm)]

  #let flourish(flip) = box(cetz.canvas({
    import cetz.draw: *
    if flip {
      scale(x: -100%)
    }
    scale(0.4)


    let s-height = 0.25
    hobby(
      (0, 0),
      (0.5, s-height),
      (1, 0),
      (1.5, -s-height),
      (2, 0),
      (2, s-height * 0.25),
    )

    let steps = 300
    let pts = range(steps).map(i => {
      let t = i / steps * (2 * calc.pi * 1.5)
      let r = 0.03 * t
      (r * calc.sin(t), r * calc.cos(t))
    })

    translate(x: 2 - 0.28, y: 0.083)
    rotate(84deg)
    line(..pts, smooth: true, stroke: 1pt)
  }))

  #pdf.artifact[#h(0.5cm) ★ #h(1fr) ★ #h(0.5cm)]


  #align(center)[
    #show linebreak: it => {
      it
      v(2mm)
      // hack to get line breaks to show
    }
    #let associations = (
      ((260deg, 30mm), box(height: 1em)[ease]),
      ((0deg, 30mm), [smiling, sweet]),
      ((10deg, 30mm), [admiration]),
      ((25deg, 30mm), [sex]),
      ((45deg, 25mm), [kisses]),
      ((90deg, 20mm), [lust]),
      ((135deg, 25mm), [attraction]),
      ((160deg, 28mm), [confidence]),
      ((200deg, 30mm), [desire/\ want]),
      ((230deg, 30mm), [fantasy/\ daydreams]),
      ((285deg, 20mm), box(height: 1em)[second\ #h(10pt) nature]),
      ((340deg, 40mm), box(height: 0.2em)[#underline[sexy\ without sex]]),
      ((350deg, 30mm), [polite]),
    )
    #pdf.artifact(diagram({
      node(
        (0deg, 0mm),
        box(inset: -1mm)[
          CHARM

          #flourish(false)
          #flourish(true)
        ],
        name: "center",
        stroke: 1pt,
        corner-radius: 20mm,
      )


      for (i, (pos, content)) in associations.enumerate() {
        node(pos, content, name: str(i))
      }

      for i in range(associations.len()) {
        edge(label(str(i)), label("center"), "-")
      }

      node((270deg, 40mm), box(height: 0.2em)[smooth], name: "smooth")

      edge(label("smooth"), label("0"), "-")
    }))
    #screen-reader-only[
      == Charm mind map
      Mind map with a central "Charm" node that is connected to other words/phrases.

      === Connected nodes
      #list(
        ..associations.map(((_, content)) => content),
      )

      Additionally, the word "smooth" is connected to the "ease" node.
    ]
  ]

  #pdf.artifact[
    #h(1fr) ★ #h(0.5cm)
  ]

  #pdf.artifact[
    #h(0.5cm) ★ #h(1fr)
  ]

]

#page[]

#page[
  #show heading.where(level: 2): it => {
    set text(size: text-size, weight: "regular")
    set block(below: 0pt)
    it
  }
  #[
    #set text(size: 14pt)
    #h(1cm)  #strike[Cha ] #h(1fr) #cursive[Charm ] #h(1fr) #cursive[CHARM] #h(1cm)
  ]

  \
  #box(inset: (x: 0.25cm))[
    == main influences -
    - blossom dearie
    - margo guryan
    - brazilian love songs
  ]

  \
  #box(inset: (x: 1cm), width: 100%)[
    #align(right)[#underline[== unlike sling because]]
    #align(left)[
      - short, simple writing
      - more forward about lust
      - #underline[pop]
    ]
  ]

  \

  #box(inset: (left: 2cm, right: 0.5cm), width: 100%)[
    #align(right)[#underline[== like sling because] #h(0.5cm)]
    #align(left)[
      #h(1cm) - weird chords
      - advanced harmonies &\ writing style, adult theme\ #h(1fr) -piano #h(0.5cm)
    ]
  ]


  #box(inset: (x: 0.25cm))[
    #underline[== unlike immunity because]
    - more refined pop
    - piano main instrument
    - less fluff, more about sex less\ #h(1fr) censored #h(2cm)

  ]
]


#page[
  #box(inset: (x: 0.25cm))[
    #underline[== like immunity b/c]
    - pop
    - songs may be short, commercial
    - still what #scribble[pin]i pining away @\ something → but more #underline[confidence]
  ]

  \ \
  #box(inset: (x: 0.25cm))[
    #grid(columns: (auto, 1fr), gutter: 0.2cm)[
      #set align(right)
      with #underline[Charm] ,
    ][
      #box[
        comes #underline[confidence]

        comes #underline[assurance]

        comes #underline[sexual awakening]

        comes #underline[liberation]
      ]
    ]

  ]
]

#let circle-lines(lines) = context {
  let pad-x = 0.25cm
  let pad-y = 0.1cm
  place(cetz.canvas({
    import cetz.draw: *
    let widths = lines.map(line => measure(line).width)
    let points = range(widths.len() + 1)
      .map(i => {
        let line-y = i * -line-height
        if i == 0 {
          (widths.at(0) + pad-x * 2, line-y + pad-y)
        } else if i == widths.len() {
          (widths.last() + pad-x * 2, line-y - pad-y)
        } else {
          let width = widths.at(i - 1)
          let next-width = widths.at(i)
          let pad-y-dir = if width < next-width { 1 } else { -1 }
          let y = line-y + pad-y-dir * pad-y
          (
            (width + pad-x * 2, y),
            (next-width + pad-x * 2, y),
          )
        }
      })
      .flatten()
      .chunks(2)
    let recess(val, toward, amount) = {
      if val > toward {
        calc.max((toward + val) / 2, val - amount)
      } else {
        calc.min((toward + val) / 2, val + amount)
      }
    }
    let recess-amount = 4mm
    let points = ((0mm, pad-y), ..points, (0mm, -lines.len() * line-height - pad-y))
    let round-points = range(points.len())
      .map(i => {
        (
          points.at(i),
          points.at(calc.rem(i + 1, points.len())),
          points.at(calc.rem(i + 2, points.len())),
        )
      })
      .map((((prev-x, prev-y), (x, y), (next-x, next-y))) => {
        if x == prev-x {
          (
            (x, recess(y, prev-y, recess-amount)),
            (x, y),
            (recess(x, next-x, recess-amount), y),
          )
        } else {
          (
            (recess(x, prev-x, recess-amount), y),
            (x, y),
            (x, recess(y, next-y, recess-amount)),
          )
        }
      })

    for i in range(round-points.len()) {
      let (_, _, p1) = round-points.at(i)
      let (p2, _, _) = round-points.at(calc.rem(i + 1, round-points.len()))
      line(p1, p2)
    }

    for (start, control, end) in round-points {
      bezier(start, end, control)
    }
  }))
  box(inset: (x: pad-x))[
    #for line in lines {
      line
      [\ ]
    }
  ]
}

#page[
  #box(inset: (x: 0.25cm))[
    #circle-lines((
      [so what? what's the point? why],
      [does this matter to anyone? why],
      [#underline[should] it?],
    ))

    \
    - the point is to highlight everyone's\ right to enjoy sex, to feel sexy, to\ feel desire, to have desire - guilt\ free
    - it's bits of my own story, with thoughts\ that feel widely universal when it\ comes to sex. “ sexy to someone ” sums\ this up
    - having charm #scribble[of] or someone charming\ you could be from anything at all
    - everyone should get the chance to\ explore sex in whatever way it feels\ for them. this liberation could even\ come from just finding confidence in\ one's self... #underline[charm doesn't have to\ #align(center)[lead to sex]]
  ]
]
#page[
  #box(inset: (x: 0.5cm))[
    & that's important to emphasize...\
    "Charm" is a wonderful title because\
    even through this record is about\
    sexual liberation for me, it could just\
    as easily be about one thing: finding\
    charm in other people & yourself.\
    #h(0.25cm) Charm is everything with & without\
    sex, it's the moments leading up to sex, or\
    the months of daydreams #scribble[behind]\
    instead.
  ]



  #place[
    #figure(alt: "Arrow curving from down to right")[
      #h(1fr) #diagram({
        node((0mm, 0mm), name: "0")

        node((20mm, -10mm), name: "1")

        edge(label("0"), label("1"), "->", bend: -30deg)
      }) #h(2cm)
    ]
  ]

  \
  #[
    #set align(center)
    (to me)

    at it's core, charm is #underline[wit]

    \
    #circle-text(outset: (x: 0pt, y: 10pt))[charm is sharp & sweet]

    \ \
    DON'T RELY TOO HEAVILY \ ON SYNOPSIS

    \
    It has d???? f????re without it


  ]
]

#page[
  #let charm-node = [
    #bubble(size: 20pt)[
      "CHARM"\
    ]

    can go\
    this way or\
    that
  ]
  #let sex-node = [
    crush\
    sexiness\
    ★ attraction\
    kissing\
    ★ lust\
    ★ blushing\
    ★ turned on\
  ]
  #let no-sex-node = [
    daydreams\
    fantasy\
    #scribble[attraction]\
    thrill\
    fun, a game\
    crush\
    a glance, one\ #h(3em) moment\
    treating someone\ well, admiration\
    humor
  ]
  #let negative-node = [
    there is a negative\
    aspect to charm,\
    but i dont want to\
    focus on that
  ]
  #let confidence-node = [
    self confidence\
    admiration\
    smiles #h(5pt) #underline[wit]\
    sweetness\
    #underline[humor]
  ]
  #screen-reader-only[
    == Charm flow chart
    Flow chart with a central "charm" node that is connected to other nodes with arrows. At the top, it says "★ - could go either way"

    === Charm node
    #charm-node

    === Right-side node, connected with arrow labeled "sex"
    #sex-node

    === Left-side node, connected with arrow labeled "no sex"
    #no-sex-node


    === Bottom-right node, connected with unlabeled arrow
    #negative-node

    === Bottom-center node, connected with unlabeled arrow
    #confidence-node
  ]
  #pdf.artifact[#rotate(-90deg, reflow: true)[
    #box(width: 100%, height: 100%, inset: 0.25cm)[
      #align(right)[
        #set text(size: 11pt, top-edge: "cap-height")
        ★ - could go either\ way
      ]
      #align(center + bottom)[
        #show linebreak: it => {
          it
          v(1mm)
        }

        #diagram({
          node((0, 0), charm-node, name: "charm", outset: -5mm)

          edge(label("charm"), label("sex"), "->", label: [sex])
          node((1, 0), align(left, sex-node), name: "sex")

          edge(label("charm"), (-1.6, 0), "->", label: [no sex])
          node((-1, 0.4), align(left, no-sex-node), name: "no-sex")

          edge(label("charm"), label("negative"), "->")
          node((1, 0.7), align(center, negative-node), name: "negative")

          edge(label("charm"), label("confidence"), "->")
          node((0, 0.7), align(center, confidence-node), name: "confidence", outset: -10mm)
        })
      ]
    ]

  ]]
]

#page[
  #box(inset: (x: 0.25cm))[
    Charm is:

    \
    #grid(columns: (auto, 1fr), gutter: 0.2cm)[
      Sharp -
    ][
      #circle-text(outset: 3pt)[wit] , humor, funny or brash\ lyrics, well packaged chords\ or phrases, someone confident\ while approachable
    ]

    \
    #grid(columns: (auto, 1fr), gutter: 0.2cm)[
      Sweet -
    ][
      soft chords, love songs, soft\ vocals, feminine, sensual,\ magnetic
    ]

    \
    #align(center)[
      #box[
        examples of both -
        #align(left)[
          - blossom dearie
          - margo guryan
          - feist
          - suzanne vega
        ]
      ]

      \
      _\~ tread the line between\ feminine & masculine \~_
    ]
  ]
]

#page[
  #[
    #set text(size: 20pt)

    #h(1cm) #bubble[CHARM]

    \
    #h(2cm) #cursive[Charm]

    #h(1fr) #cursive[Charm] #h(2cm)
    \
    #h(0.5cm) #cursive[Charm]
  ]

  #box(inset: (x: 0.25cm), width: 100%)[
    \- demo at home → bring to leon →\
    track at leons → track as full band\
    at Diamond Mine → vocals ELS

    #align(center)[
      #box(height: line-height * 4, align(left)[
        \
        #place(
          dy: -line-height * 1.2,
          math.equation($underbrace("                ")$, alt: "Underbrace"),
        )

        #v(line-height)
        #[
          #set text(top-edge: line-height * 0.7)
          to tape, then\ mixed to tape aswell
        ]
      ])
    ]

    #align(left)[
      #box[
        #align(center)[

          - mixing #box[#place(dy: -line-height * 2)[★]]- burying record underground\ for 3 months !!!
        ]
      ]
    ]
    \
    #align(right)[
      (we'll see how it\ goes)
    ]

  ]
]


