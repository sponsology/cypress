exports['e2e screenshots passes 1'] = `
====================================================================================================

  (Run Starting)

  ┌────────────────────────────────────────────────────────────────────────────────────────────────┐
  │ Cypress:    1.2.3                                                                              │
  │ Browser:    FooBrowser 88                                                                      │
  │ Specs:      1 found (screenshots_spec.coffee)                                                  │
  │ Searched:   cypress/integration/screenshots_spec.coffee                                        │
  └────────────────────────────────────────────────────────────────────────────────────────────────┘


────────────────────────────────────────────────────────────────────────────────────────────────────
                                                                                                    
  Running: screenshots_spec.coffee...                                                      (1 of 1) 


  taking screenshots
    ✓ manually generates pngs
    ✓ can nest screenshots in folders
    1) generates pngs on failure
    ✓ handles devicePixelRatio correctly on headless electron
    ✓ crops app captures to just app size
    ✓ can capture fullPage screenshots
    ✓ accepts subsequent same captures after multiple tries
    ✓ accepts screenshot after multiple tries if somehow app has pixels that match helper pixels
    ✓ can capture element screenshots
    ✓ retries each screenshot for up to  XX:XX
    ✓ ensures unique paths for non-named screenshots
    2) ensures unique paths when there's a non-named screenshot and a failure
    clipping
      ✓ can clip app screenshots
      ✓ can clip runner screenshots
      ✓ can clip fullPage screenshots
      ✓ can clip element screenshots
    before hooks
      3) "before all" hook for "empty test 1"
    each hooks
      4) "before each" hook for "empty test 2"
      5) "after each" hook for "empty test 2"


  14 passing (2m)
  5 failing

  1) taking screenshots generates pngs on failure:
     Error: fail whale
      at stack trace line

  2) taking screenshots ensures unique paths when there's a non-named screenshot and a failure:
     Error: failing on purpose
      at stack trace line

  3) taking screenshots before hooks "before all" hook for "empty test 1":
     Error: before hook failing

Because this error occurred during a 'before all' hook we are skipping the remaining tests in the current suite: 'before hooks'
      at stack trace line

  4) taking screenshots each hooks "before each" hook for "empty test 2":
     Error: before each hook failed

Because this error occurred during a 'before each' hook we are skipping the remaining tests in the current suite: 'each hooks'
      at stack trace line

  5) taking screenshots each hooks "after each" hook for "empty test 2":
     Error: after each hook failed

Because this error occurred during a 'after each' hook we are skipping the remaining tests in the current suite: 'each hooks'
      at stack trace line




  (Results)

  ┌───────────────────────────────────────┐
  │ Tests:        18                      │
  │ Passing:      14                      │
  │ Failing:      4                       │
  │ Pending:      0                       │
  │ Skipped:      0                       │
  │ Screenshots:  23                      │
  │ Video:        true                    │
  │ Duration:     X seconds               │
  │ Spec Ran:     screenshots_spec.coffee │
  └───────────────────────────────────────┘


  (Screenshots)

  - /foo/bar/.projects/e2e/cypress/screenshots/black.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/red.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/foo/bar/baz.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- generates pngs on failure.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/color-check.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/crop-check.png (600x400)
  - /foo/bar/.projects/e2e/cypress/screenshots/fullPage.png (600x500)
  - /foo/bar/.projects/e2e/cypress/screenshots/fullPage-same.png (600x500)
  - /foo/bar/.projects/e2e/cypress/screenshots/pathological.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/element.png (400x300)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- retries each screenshot for up to  XX:XX.png (400x1316)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- ensures unique paths for non-named screenshots.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- ensures unique paths for non-named screenshots (1).png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- ensures unique paths for non-named screenshots (2).png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- ensures unique paths when theres a non-named screenshot and a failure.png (1000x660)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- ensures unique paths when theres a non-named screenshot and a failure (1).png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/app-clip.png (100x50)
  - /foo/bar/.projects/e2e/cypress/screenshots/runner-clip.png (120x60)
  - /foo/bar/.projects/e2e/cypress/screenshots/fullPage-clip.png (140x70)
  - /foo/bar/.projects/e2e/cypress/screenshots/element-clip.png (160x80)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- before hooks -- empty test 1 -- before all hook.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- each hooks -- empty test 2 -- before each hook.png (1280x720)
  - /foo/bar/.projects/e2e/cypress/screenshots/taking screenshots -- each hooks -- empty test 2 -- after each hook.png (1280x720)


  (Video)

  - Started processing:   Compressing to 32 CRF
  - Finished processing:  /foo/bar/.projects/e2e/cypress/videos/abc123.mp4 (X seconds)


====================================================================================================

  (Run Finished)


      Spec                                                Tests  Passing  Failing  Pending  Skipped 
  ┌────────────────────────────────────────────────────────────────────────────────────────────────┐
  │ ✖ screenshots_spec.coffee                   XX:XX       18       14        4        -        - │
  └────────────────────────────────────────────────────────────────────────────────────────────────┘
    1 of 1 failed (100%)                        XX:XX       18       14        4        -        -  

`

