describe "ensuring keywords filter", ->
  filter = null

  beforeEach ->
    module 'ofn.admin'
    inject ($filter) ->
      filter = $filter 'keywords'

  it "returns null when no array given", ->
    expect(filter(null, "")).toBeNull()

  it "returns everything if no keywords are given", ->
    things = ['a', 'b', 'c']
    expect(filter(things, "")).toBe things

  it "returns nothing if no keywords match", ->
    things = ['a', 'b', 'c']
    expect(filter(things, "z")).toEqual []

  it "returns elements matching a keyword", ->
    things = ['apple', 'cab', 'boo']
    expect(filter(things, "a")).toEqual ['apple', 'cab']

  it "returns elements matching two keywords", ->
    things = ['good apple pie', 'good other pie', 'dream pie']
    expect(filter(things, "good pie")).toEqual ['good apple pie', 'good other pie']
