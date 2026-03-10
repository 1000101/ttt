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
  city: "Fiesole",
  advisor_title: [Advisor],
  advisor: [prof. PhDr. Prof Essor, Ph.D.],
  thanks:[Thanks everyone.],
  declaration:[I hereby declare that I have written this thesis independently, that I have properly   cited all sources and literature used, and that this thesis has not been used in any other university studies or to obtain another or the same degree.],
  //date:[], // if not specified, then current date will be used, use blank to blank out
  //date_year:[], // if not specified, then current year will be used, use blank to blank out

)

#set text(
  font: "Latin Modern Roman",
  lang: "en",
)


= Introduction
#lorem(20)

== Introduction Sub Quote
#lorem(10)

=== Introduction Sub Sub Foot
#lorem(10)

Nonclear#footnote[Something footnote-y] idea. Attribution example.@book1[p. 45-55]

= Blablah
#lorem(5)

== Blablah Mathematica
#lorem(20)

Block article citation example:

#quote(block:true)["this is interesting and not my idea"@article1[p. 69]]

Another block quote inline attributed:

#quote(block:true, attribution:[Int Erresant Author])["this is interesting and not my idea"]


\

Braces:
$ underbrace(0 + 1 + dots.c + n, n + 1 "numbers") $

Binoms:
$ binom(n, k_1, k_2, k_3, ..., k_m) $

Sums:
$ sum_(i=0)^n a_i = 2^(1+i) $

$sum_i x_i/2 = display(sum_i x_i/2)$


#lorem(10)

$ attach(
  Pi, t: alpha, b: beta,
  tl: 1, tr: 2+3, bl: 4+5, br: 6,
) $

Sets:

$ { (a / b), a, b in (0; 1/2] } $

For more examples see footnote.#footnote[https://typst.app/docs/reference/math]

=== Blablah Sub2
#lorem(20)

==== Blablah Sub3
#lorem(20)

#pagebreak()

= Conclusion
#lorem(80)


#pagebreak()


#bibliography("library.bib", title:"Bibliography", style: "chicago-notes")
