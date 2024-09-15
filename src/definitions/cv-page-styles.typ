#import "../my-config.typ": *

#let _page(cvFooter, body) = {
  let roles = userInfo.roles.join(", ")
  set document(
    title: "CV | " + userInfo.fullName + " | " + roles,
    author: userInfo.fullName,
  )
  set text(
    font: main-font,
    lang: "en",
    size: main-font-size,
    fill: pal.regular-color,
    fallback: true,
  )
  set page(
    paper: "a4",
    margin: page-margin,
    footer: cvFooter,
    footer-descent: 0pt,
  )
  body
}

#let _modernHeading(body) = {
  show heading.where(level: 1): it => [
    #align(left)[
      #box(inset: (top: -5pt))[
        #strong[#it.body.text<accent>]
        #box(
          width: 1fr,
          line(
            length: 100%,
            stroke: (paint: pal.regular-color, thickness: 1pt),
          ),
        )
      ]
    ]
  ]
  body
}

#let _modernBlock(body) = {
  show <keyValueBlock>: it => (
    grid(
      columns: (3pt, auto),
      rows: (1),
      line(
        end: none,
        length: (main-font-size + main-font-size / 5) * it.children.len() / 2,
        angle: 90deg,
        stroke: (paint: pal.accent-color, thickness: 1pt),
      ),
      it,
    )
  )

  body
}

#let _textStyles(body) = {
  context {
    show <accent>: it => [
      #set text(fill: pal.accent-color)
      #text[#it]
    ]
    show <bold>: it => [
      #set text(weight: "bold")
      #text[#it]
    ]
    show <desat>: it => [
      #set text(fill: pal.regular-color-desat)
      #text[#it]
    ]
    show <bold-desat>: it => [
      #set text(weight: "bold", fill: pal.regular-color-desat)
      #text[#it]
    ]
    body
  }
}

#let cvStyle = (
  modernHeading: _modernHeading,
  modernBlock: _modernBlock,
  textStyles: _textStyles,
  page: _page,
)