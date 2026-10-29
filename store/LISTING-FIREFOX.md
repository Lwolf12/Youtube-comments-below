# Firefox Add-ons listing: Comments Below for YouTube

Everything to paste into the Firefox add-on developer hub
(<https://addons.mozilla.org/developers/>). The upload ZIP is
`dist/youtube-comments-below-v<version>-firefox.zip`, built with
`store/build-zip.ps1` (needs Node for the Firefox manifest).
The Chrome listing is in `LISTING.md`.

## Submitting

1. **Submit a New Add-on → On this site** (listed on addons.mozilla.org).
2. Upload the Firefox ZIP. The validator should show no errors; it warns
   that `strict_min_version` 140 predates Firefox for Android's support for
   the data-collection key, which does not matter for a desktop-only listing.
3. Platforms: **Firefox** only. Not Firefox for Android: the mobile site
   has a different watch page and the layout experiment is desktop-only.
4. **Do you use code generators, minifiers or similar?** No. Only the
   manifest is assembled by a script; see the reviewer notes. (Answering
   No means no source-code upload is needed.)

## Listing

**Name:** Comments Below for YouTube

**Add-on URL:** `comments-below-for-youtube` (record the slug AMO
accepts; the limit is 30 characters)

**Summary** (250 characters max):

> Restores the classic YouTube watch page: recommendations on the right,
> comments below the video. Opts you out of the side-panel experiment, with
> no settings, no data and no network requests.

**Description:**

> Brings back the classic YouTube watch page: recommended videos in the
> right-hand column, comments underneath the video.
>
> In October 2026 YouTube began moving comments into a side panel and
> spreading recommendations in a grid under the video. This extension opts
> you out of that experiment, so the page renders the way it always did,
> theater mode included. It is not a restyle: nothing is drawn over the
> page, the site simply uses its own original layout.
>
> HOW IT WORKS
> The page decides between the two layouts from a set of experiment flags.
> The extension pins those flags to the classic values before the page's
> scripts run. If the flags ever stop working, a small fallback moves the
> comments and recommendations back to their usual places.
>
> There is nothing to set up: install it, reload any video, and the old
> layout is back. To return to the new layout, disable the extension in
> the Add-ons Manager.
>
> PRIVACY
> Runs only on www.youtube.com. No permissions beyond that, no network
> requests, no stored data, no accounts, no analytics.
>
> OPEN SOURCE
> https://github.com/Lwolf12/Youtube-comments-below
>
> Independent project, not affiliated with or endorsed by YouTube or Google.

**Categories:** Photos, Music & Videos (and, if a second is allowed,
Appearance).

**Tags:** fixed list on AMO; `youtube` if offered, otherwise none.

**Support website:** https://github.com/Lwolf12/Youtube-comments-below/issues

**Homepage:** https://github.com/Lwolf12/Youtube-comments-below

**License:** MIT (the repository's LICENSE file).

**Privacy policy:** none needed; the data-collection declaration in the
manifest is "none". If the form insists on text, paste the PRIVACY
paragraph above.

**Screenshots:** the Chrome ones in `store/screenshots/` (YouTube looks
the same in Firefox); 1280×800 PNG.

## Notes to reviewer

> Two content scripts on https://www.youtube.com/* only. flags.js runs in
> the page's main world at document start and defines property traps on
> window.yt / window.ytcfg so that, when YouTube fills in its
> EXPERIMENT_FLAGS object, the watch-page layout flags listed at the top of
> the file read false; that makes YouTube render its own classic layout.
> fallback.js runs at document idle and, on a watch page in two-column
> mode, moves ytd-comments#comments under the video and #related into the
> right column if they are elsewhere. style.css hides the side-rail
> container. No storage, no network requests, no other hosts.
>
> No code is minified or transpiled. The manifest is generated from the
> Chrome manifest by store/firefox-manifest.mjs in the public repository
> (https://github.com/Lwolf12/Youtube-comments-below); all other files are
> exactly as in the repository.
>
> To test: install, open any https://www.youtube.com/watch?v=... page in a
> window wider than about 1000 px, and reload. Comments appear under the
> video and recommendations in the right column. Profiles that YouTube has
> not put in the side-panel experiment already look like this, so the
> visible change depends on the test profile; the flag override can be
> confirmed in the console: ytcfg.get('EXPERIMENT_FLAGS').web_watch_eligible_to_switch_to_grid is false.
