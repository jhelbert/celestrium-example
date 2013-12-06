requirejs.config
  baseUrl: "/celestrium/core/"
  paths:
    local: "../../"

require ["Celestrium", "local/PhoneticAlphabet"],
(Celestrium, PhoneticAlphabet) ->

  plugins =
    "Layout":
      el: document.querySelector "body"
    "KeyListener":
      document.querySelector "body"
    "GraphModel":
      nodeHash: (node) -> node.text
      linkHash: (link) -> link.source.text + link.target.text
    "GraphView": {}
    "NodeSelection": {}
    "Sliders": {}
    "ContextMenu": {}
    "ForceSliders": {}
    "LinkDistribution": {}
    "NodeSearch":
      local: PhoneticAlphabet

    "local/RandomDataProvider": {}
    "ContextMenu": {}
  Celestrium.init plugins, (instances) ->

    # this prepopulates the graph with the "B" node


    # this allows all link strengths to be visible
    instances["GraphView"].getLinkFilter().set("threshold", 0)
    dataProvider = instances["local/RandomDataProvider"]
    ContextMenu = instances["ContextMenu"]
    #ContextMenu.addMenuOption "Nodes Selected", ContextMenu.TestOption, ContextMenu
    ContextMenu.addMenuOption "Expand Nodes", dataProvider.addRelatedNodes, dataProvider
    ContextMenu.renderMenu()
