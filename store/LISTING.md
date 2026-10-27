# Chrome Web Store listing: Comments Below for YouTube

Everything to paste into the developer dashboard
(<https://chrome.google.com/webstore/devconsole>). The upload ZIP is built
with `store/build-zip.ps1` and lands in `dist/`.

## Store listing tab

**Name** (from the manifest): Comments Below for YouTube

**Summary** (from the manifest's `description`, 132 characters max; needs a
new package to change):

> Restores the classic YouTube watch page: recommendations on the right, comments below the video.

**Category:** Social & Communication (or Entertainment) · **Language:** English

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
> layout is back. To return to the new layout, switch the extension off on
> chrome://extensions.
>
> PRIVACY
> Runs only on www.youtube.com. No permissions beyond that, no network
> requests, no stored data, no accounts, no analytics.
>
> OPEN SOURCE
> https://github.com/Lwolf12/Youtube-comments-below
>
> Independent project, not affiliated with or endorsed by YouTube or Google.

Keep brand names sparse: the IMDb listing was rejected twice for "Keyword
Spam" when the summary or description listed many names in a row. Here
"YouTube" appears in the name, the summary and a few times in the
description, which is the same density that passed.

**Icon:** `icons/icon128.png` (taken from the ZIP automatically).

**Screenshots** (required, at least one; 1280×800 or 640×400 PNG/JPEG, no
alpha): take them yourself with the extension loaded, since they must show
the real thing. Suggested set:

1. A watch page with the extension on: video, comments below it,
   recommendations on the right. This is the one that matters.
2. The same page with the extension off (comments in the side panel), so
   the listing shows the difference.
3. Theater mode with the extension on, if it looks good.

Size a Chrome window to 1280×800 (DevTools → device toolbar → Responsive →
1280×800 and take the capture from there, or Win+Shift+S and crop) and avoid
anything personal in the frame (account avatar, history, subscriptions).

**Small promo tile** (440×280, optional): skip for the first submission.

**Official URL / Homepage:** https://github.com/Lwolf12/Youtube-comments-below
**Support URL:** https://github.com/Lwolf12/Youtube-comments-below/issues

## Privacy practices tab

**Single purpose description:**

> Restores the classic YouTube watch-page layout (recommendations on the
> right, comments below the video) by opting the page out of the new-layout
> experiment.

**Permission justifications.** The manifest requests no permissions. The
dashboard still asks about the host the content scripts match:

| Permission | Justification |
| --- | --- |
| Content scripts on `https://www.youtube.com/*` | Sets the watch-page layout flags before the page's own scripts read them, and moves the comments and recommendations back to their classic positions if needed. Nothing is read from the page beyond the layout elements, and nothing is sent anywhere. |

**Are you using remote code?** No. All code is in the package.

**Data usage:** tick nothing in the list (no personal info, health,
financial, authentication, communications, location, web history, user
activity or website content is collected). Tick all three certifications:
not sold to third parties; not used for purposes unrelated to the single
purpose; not used to determine creditworthiness or for lending.

**Privacy policy URL:** not required when nothing is collected. If the form
insists, use the README's Permissions section:
https://github.com/Lwolf12/Youtube-comments-below#permissions

## Distribution tab

Visibility **Public**, all regions, free.

## Things the reviewer may raise

- **Trademark in the name.** "YouTube" is Google's mark. The name uses the
  "X for YouTube" form the store's branding guidelines ask for, and the
  description ends with a non-affiliation notice.
- **Main-world content script.** `flags.js` runs with `"world": "MAIN"` so
  it can reach the page's config object. That is a standard Manifest V3
  feature (Chrome 111+), the script is in the package, and it touches
  nothing but the layout flags.
- **Minimum functionality.** The extension is small. The screenshots are
  the defence: a before/after pair makes the effect obvious.
