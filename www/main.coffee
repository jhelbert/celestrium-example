requirejs.config
  baseUrl: "/celestrium/core/"
  paths:
    local: "../../"

require ["Celestrium"], (Celestrium) ->
  plugins =
    Layout:
      el: document.querySelector("body")
    KeyListener:
      document.querySelector("body")
    GraphModel:
      nodeHash: (node) -> node.text
      linkHash: (link) -> link.source.text + link.target.text
    GraphView: {}
    NodeSelection: {}
    "local/SampleDataProvider": {}

  Celestrium.init plugins, (instances) ->
    instances["GraphModel"].putNode text: "B"
    instances["GraphView"].getLinkFilter().set("threshold", 0)
