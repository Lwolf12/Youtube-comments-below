# Comments Below for YouTube

Brings back the classic YouTube watch page: recommended videos in the
right-hand column, comments underneath the video.

In October 2026 YouTube started switching people to a new arrangement with
comments on the right and recommendations in a grid under the video. This
extension turns the experiment off for you, so YouTube renders the page the
way it always did. It is not a restyle: the result is YouTube's own old
layout, including theater mode.

## Install

- **Chrome:** [Chrome Web Store](https://chromewebstore.google.com/detail/comments-below-for-youtub/poejpcjlkaaanjenanjlmgfiknaehlbf)
- **Firefox:** [Firefox Add-ons](https://addons.mozilla.org/firefox/addon/comments-below-for-youtube/)
  (Firefox 140 or later)

Install from the store, then open any YouTube video and reload it. There's
no popup or settings page. To get the new layout back, switch the extension
off on `chrome://extensions` or in Firefox's Add-ons Manager.

If you also use uBlock Origin with the custom filters for this layout, you
only need one of the two. They don't conflict, but there's no point running
both.

### Without the store

In Chrome, download the latest ZIP from the
[Releases page](https://github.com/Lwolf12/Youtube-comments-below/releases),
extract it somewhere permanent, open `chrome://extensions`, turn on
**Developer mode** and click **Load unpacked** on the
`youtube-comments-below` folder. Chrome loads the extension from that folder
every time it starts.

In Firefox, build the Firefox ZIP with `store/build-zip.ps1` (it needs Node
for the manifest, which `store/firefox-manifest.mjs` generates from
Chrome's), then open `about:debugging`, choose **This Firefox → Load
Temporary Add-on…** and pick `dist/youtube-comments-below-v<version>-firefox.zip`.
It stays until Firefox is closed.

## How it works

YouTube ships both the old and the new watch-page code and picks one based on
experiment flags in the page's config (`yt.config_.EXPERIMENT_FLAGS`). This
extension has two layers:

1. **`flags.js`** runs in the page's own JavaScript world before any YouTube
   script. It intercepts the config object as YouTube fills it in and pins
   the layout flags to `false`. YouTube then behaves as if your account were
   never in the experiment. The flag list is the same one used by the uBlock
   Origin filters that circulated when the change rolled out.

2. **`fallback.js`** runs after the page settles. If the flag override ever
   stops working, it moves the recommendations back into the right column
   and the comments back under the video, and re-runs after YouTube's
   in-page navigation. This is an approximation and only kicks in when
   needed.

`style.css` hides the new layout's side-rail container as a precaution.

## Will it keep working?

For as long as YouTube keeps the old layout code in the page. Experiments
usually run for weeks or months before the losing version is deleted. Once
that happens, the flags do nothing and only the fallback remains, which will
look close but not identical. If a flag is simply renamed first, adding the
new name to the `FLAGS` table in `flags.js` fixes it.

To see the current flag names, open a watch page, press F12, and run:

```js
Object.keys(ytcfg.get('EXPERIMENT_FLAGS')).filter(k => /watch|rail|grid/.test(k))
```

Or point Claude Code at this folder and say "YouTube moved things again."

## Permissions

The extension asks for nothing beyond running on `www.youtube.com`. It makes
no network requests and stores no data.

## Credits

Built with Claude Code (Anthropic's AI coding assistant), which wrote the
code; I designed, tested and published the extension.

## License

MIT, see [LICENSE](LICENSE).
