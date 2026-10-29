// Prints the Firefox manifest for the extension, made from the Chrome one
// (manifest.json stays the single source). Used by
// build-zip.ps1:  node firefox-manifest.mjs > manifest.json
//
// What differs in Firefox: only browser_specific_settings, with the add-on
// ID, the minimum version and the data-collection declaration Mozilla
// requires of new submissions (none: the extension collects nothing).
// Firefox 140 covers everything the content scripts use; the main-world
// content script (flags.js, "world": "MAIN") needs Firefox 128 or later.
import { readFileSync } from 'node:fs';

const src = new URL('../manifest.json', import.meta.url);
const m = JSON.parse(readFileSync(src, 'utf8'));

m.browser_specific_settings = {
  gecko: {
    id: 'comments-below-for-youtube@lwolf12',
    strict_min_version: '140.0',
    data_collection_permissions: { required: ['none'] },
  },
};

process.stdout.write(JSON.stringify(m, null, 2) + '\n');
