{WorkspaceView} = require 'atom'
AtomDisapproval = require '../lib/atom-disapproval'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomDisapproval", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('atom-disapproval')

  describe "when the atom-disapproval:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.atom-disapproval')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'atom-disapproval:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.atom-disapproval')).toExist()
        atom.workspaceView.trigger 'atom-disapproval:toggle'
        expect(atom.workspaceView.find('.atom-disapproval')).not.toExist()
