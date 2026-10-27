# Releasing

Each version is published as a GitHub Release with a ZIP attached, so
downloads are counted. A workflow (`.github/workflows/release.yml`) does the
work when a tag is pushed.

## Cut a release

1. Bump `"version"` in `manifest.json` and commit it.
2. Tag the commit `v<version>` and push the tag:

   ```bash
   git tag v1.0.1
   git push origin v1.0.1
   ```

   The tag's version must match the manifest, or the workflow stops.
3. A minute later the release appears at
   <https://github.com/Lwolf12/Youtube-comments-below/releases> with
   `youtube-comments-below-v1.0.1.zip` attached, holding the extension files
   plus the README and LICENSE.
4. Add a short "What's new" to that release's notes, above the install
   text the workflow wrote: a few bullets covering this release only, never
   a running history (older notes stay on older releases).

   ```bash
   gh release edit v1.0.1 --notes-file notes.md
   ```

   where `notes.md` holds the What's new bullets followed by the existing
   install text (`gh release view v1.0.1 --json body`).

## Download counts

```bash
gh api repos/Lwolf12/Youtube-comments-below/releases --paginate \
  --jq '.[] | "\(.tag_name)\t\([.assets[].download_count] | add // 0)"'
```

Views, unique visitors and clones are under **Insights → Traffic** on GitHub
(last 14 days only).
