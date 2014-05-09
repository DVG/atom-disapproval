module.exports =
  activate: ->
    atom.workspaceView.command "atom-disapproval:ಠ_ಠ",
      => @insertLookOfDisapproval()

  insertLookOfDisapproval: ->
    editor = atom.workspace.activePaneItem
    editor.insertText('ಠ_ಠ')
