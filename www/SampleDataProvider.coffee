define ["DataProvider"], (DataProvider) ->

  graph =
    "A":
      "B": 1
    "B":
      "A": 1
      "C": 0.1
    "C":
      "B": 0.1

  class SampleDataProvider extends DataProvider
    getLinks: (node, nodes, callback) ->
      callback _.map nodes, (otherNode, i) ->
        return "strength": graph[node.text][otherNode.text]
    getLinkedNodes: (nodes, callback) ->
      callback _.chain(nodes)
        .map (node) ->
          _.map graph[node.text], (strength, text) ->
            "text": text
        .flatten()
        .value()
