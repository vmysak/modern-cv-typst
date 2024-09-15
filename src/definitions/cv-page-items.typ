#import "../my-config.typ": *

#let _defaultSize = (left: 1fr, right: 1fr);

#let _textBlock(items, body) = {
  grid(
    columns: (1fr),
    rows: (auto),
    ..items.enumerate().map(((i, item)) => {
      return grid.cell(inset: inset-row(i), align(left)[#item])
    })
  )
  body
}

#let _keyValueBlock(items, body) = {
  let size = items.at("size", default: _defaultSize)
  let align-to = items.at("align-to", default: left)
  let inset-row(i) = {
    (
      top: if i > 1 {
        5pt
      } else {
        0pt
      },
    )
  }
  [#grid(
      columns: (size.left, size.right),
      rows: (auto),
      ..items.data.enumerate().map(((i, item)) => {
        if calc.even(i) {
          return grid.cell(inset: inset-row(i), align(left)[#item])
        } else {
          return grid.cell(inset: inset-row(i), align(align-to)[#item])
        }
      })
    )<keyValueBlock>]
  body
}

#let _experienceBlock(project, body) = {
  let position = project.at("position", default: "")
  let name = project.at("name", default: "")
  let company = project.at("company", default: "")
  let dates = project.at("dates", default: "")
  let description = project.at("description", default: ([],))
  show: _keyValueBlock.with((
    size: size50x50,
    align-to: right,
    data: (
      [=== #position],
      [#company<bold-desat>],
      [#name<bold-desat>],
      [#dates],
    ),
  ))
  show: _textBlock.with(description)
  body
}

#let cvItem = (
  keyValueBlock: _keyValueBlock,
  textBlock: _textBlock,
  experienceBlock: _experienceBlock,
)