#import "template/ttt.typ": ttt, customquote

#show: ttt.with(
  uni:[Universal University], // name of the institution / uni
  fac:[ Le Fac ],
  dept:[ Department of departures],
  subname:[Bachelor thesis], // for instance course/assignment name
  title:[ One line of title \ second line of title ],
  subtitle:[ English title or subtitle ],
  author:[Stud Ent],
  abstract_title:[Abstraktum],
  abstract:[ #lorem(80) ],
  language: "en", // if not specified, then en will be used, possible: "en", "fr", "cs", "sk", ...
  abstract_title_2:[Abstract],
  abstract_2:[ #lorem(80) ],
  city: "Prague",
  advisor_title: [Advisor],
  advisor: "prof. PhDr. Prof Essor, Ph.D."
  //date:[] // if not specified, then current date will be used, use blank to blank out
)

#set text(
  font: "Latin Modern Roman",
  lang: "en",
)


= Introduction
#lorem(80)

== Introduction Sub
#lorem(20)

=== Introduction Sub Sub
#lorem(20)

= Blablah
#lorem(40)

== Blablah Sub1
#lorem(20)

=== Blablah Sub2
#lorem(20)

==== Blablah Sub3
#lorem(20)

= Conclusion
#lorem(80)


#pagebreak()


#bibliography("lib.bib", title:"Bibliography", style: "chicago-notes")
