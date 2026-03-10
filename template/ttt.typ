#let ttt(
  uni: [],
  fac: [],
  dept:[],
  subname: [],
  title: [],
  subtitle: [],
  author: [],
  abstract: [],
  abstract_title:[Abstract],
  abstract_title_2:[],
  abstract_2: [],
  language: "en",
  city: [],
  advisor_title: [Advisor],
  advisor: [],
  thanks: [],
  thanks_title: [],
  declaration: [],
  declaration_title: [],
  date: datetime.today().display("[day].[month].[year]"),
  date_year: datetime.today().display("[year]"),
  doc,
) = {
  let lang = language;

  let level = 4 // automatic numbering up to 4 level
  set heading(
    numbering: (..numbers) =>
      if numbers.pos().len() <= level {
        return numbering("1.1.", ..numbers)
      }
  )

  show heading.where(level: 1): set block(above: 2em, below: 1em)

  // headings below the first (e.g. 1. Introduction) level, e.g. : 1.1 2.2.1 3.2.3 ...
  show heading: it => {
    if it.level != 1 {
      set block(above: 2em, below: 1em)
      {it}
    } else {it}
  }

  set smartquote(enabled: true)

  set page(
    margin: 3.5cm,
    paper: "a4",
    footer: context [
        //#set align(right)
        #set text(10pt) // Doporučená velikost písma: cca 8–10 pt pro záhlaví, poznámkový aparát, popisky apod.
    ]
  )

  set text(
     font: "Latin Modern Roman", // Základní text by měl být napsán jedním typem písma (např. patkovým), pro data v tabulkách a grafech je případně možné použít i jiný druh písma.
     lang: lang,
     size: 12pt, // Doporučená velikost písma: cca 11–12 pt pro základní text,
  )

  set cite(
    style: "chicago-notes",
  )

  set footnote.entry(
    //indent: 2em
    indent: 0em, // no indent of footnotes - not standard, but I like it a lot - hotter than hot
  )


  place(
    top + left,
    float: true,
    scope: "parent",
    clearance: 2em,
    {
      block(below: 0em)
      text(size: 12pt, font: "Latin Modern Roman Caps", smallcaps(
        all: true,
      )[#uni])
      block(below: 4em)
      text(size: 12pt, font: "Latin Modern Roman Caps", smallcaps(
        all: true,
      )[#fac])
      block(below: 1em)
      text(size: 12pt, font: "Latin Modern Roman Caps", [#dept])

    },
  )

  place(
    top + left,
    float: true,
    {
      block()


      block(
        above: 10em,
        width: 32em,
        text(size: 18pt, weight: "extrabold", smallcaps(all: true)[#title]),
      )

      set text(size: 12pt, weight: "thin", style: "italic")

      block(
        width: 32em,
        above: 2em,
        par(justify: true)[#subtitle],
      )



      block(above: 2em)
    },
  )

  place(
    bottom + left,
    float: true,
    scope: "parent",
    {

      text(size: 12pt, style:"normal", font: "Latin Modern Roman Caps", smallcaps(
        all: true,
      )[#subname])

      block(
        //stroke: (left: 1.5pt),
        above: 6em,
        inset: 0em,
        text(
          size: 12pt,
          font: "Latin Modern Roman Caps",
          weight: "medium",
          smallcaps(all: true)[ #author \ \ #city, #date_year ])
      )

      block(
        //stroke: (left: 1.5pt),
        above: 2em,
        inset: 0em,
        text(
          size: 12pt,
          font: "Latin Modern Roman Caps",
          weight: "medium",
          smallcaps(all: true)[ #advisor_title: #advisor])
      )


    },
  )

  // place(
  //   bottom +
  //   right,
  //   float: true,
  //   scope: "parent",
  //   {

  //     block(
  //       //stroke: (left: 1.5pt),
  //       //
  //       text(
  //         size: 12pt,
  //         font: "Latin Modern Roman Caps",
  //         weight: "medium",
  //         smallcaps(all: true)[ Vedúci práce:  #advisor ] )
  //     )


  //   },
  // )


  // thank you

  pagebreak()

  place(
    bottom + left, //  top + center //
    float: true,
    scope: "parent",
    {
      block(below: 1.5em, par()[
        *#thanks_title*
      ])
      block( align(left, par(justify: true, leading: 0.75em,)[
        #thanks
      ]))
    },
  )



  pagebreak()

  place(
    bottom + left, //  top + center //
    {
      block(below: 1.5em, par()[
        *#declaration_title*
      ])

      block(below: 1.5em, par(justify: true, leading: 0.75em,)[
        #declaration
      ])

    grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [ #city, #date], [#author],
    )
    }
  )

  pagebreak()

  // abstract

  place(
    top + left, //  top + center //
    float: true,
    scope: "parent",
    {
      block(below: 1.5em, par()[
        *#abstract_title*
      ])
    },
  )

  block( align(left, par(justify: true, leading: 0.75em,)[
    #abstract
  ]))

  block(above:3.5em, below: 1.5em, par()[
    *#abstract_title_2*
  ])


  block( align(left, par(justify: true, leading: 0.75em,)[
    #abstract_2
  ]))

  pagebreak()

  set par(
    justify: true,
    first-line-indent: (all: true, amount: 2em),
    spacing: 0.8em,
    leading: 0.75em, // line height (0.75em ~ 1.5) // Doporučené řádkování 1,2–1,5.
  )

counter(page).update(1)
  set page(footer: context align(
    center,
    numbering(
     "1",
      ..counter(page).get()
    ),
  ))

  doc
}

// custom quotes are special quotes used for example at the beginning of a chapter, they are unindented
//
#let customquote(text) = {
  block(
    above: 24pt,
    below: 24pt,
    inset: (left: -1em, right: -1em),
    quote(
      block: true,
    )[#text], // alt [#emph[#text]] but that also emphasizes the citation numbering
  )
}
