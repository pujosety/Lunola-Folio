# Contributors in the About window

**About ▸ Contributors** credits the people who contributed **to Lunola Folio**, and
**About ▸ Models** credits the AI models named in `Co-Authored-By` trailers.

Lunola Folio was rebranded from an upstream open-source PDF project. That upstream's commit history
is **not** carried into this list: its authors wrote a different product and never worked on Lunola
Folio, so crediting them here would misattribute this project's authorship. Their copyright and
licence notices remain where the licence requires them (see `NOTICE` and `ATTRIBUTION.md`); this
page concerns the About window only.

## Decision

- Two files, both **compiled into the binary** by the UI crate's `build.rs` (nothing is read from
  disk or the network at run time; the web build has them too):
  - [`contributors/contributors.json`](../contributors/contributors.json): commit stats per GitHub
    username. **Generated** by `craftrules/scripts/contributors.py`; never hand-edit.
  - [`contributors/people.toml`](../contributors/people.toml): the names people chose for
    themselves. **Each contributor adds only their own entry**, in their own PR.
- Each contributor gets one line: GitHub username (always), display name (opt-in, or their synced
  GitHub profile name), real name (only if they told us), merged PRs, commits, lines added, lines
  deleted, binary assets added, binary assets removed, first and last commit date.
- The list is shown as a **grab bag** (names flowing as text) or a **table**, in the same order. It
  sorts by name, PRs, commits, lines added, lines deleted, line delta, binary assets added/removed,
  first or last commit date. The name toggle cycles **Username → Display name → Real name**; a
  missing name falls back to `@username`. Alphabetical sorting is case-insensitive and ignores the `@`.

## In Lunola Folio

- The About window is the `Dialog::About` arm in `crates/ui-egui/src/dialogs.rs` (Help ▸ About, `help.about`).

## Credit yourself

Add your entry to `contributors/people.toml` in a PR you commit yourself (every field optional):

```toml
[people.your-github-username]
real_name = "Your Name"
display_name = "Nickname"
sync_github_name = true   # use the name on your public GitHub profile as display name
```

or, with craftrules checked out next to `craft-apps/`:

```sh
python3 ../../craftrules/scripts/contributors.py --add-me . --real-name "Your Name" --sync-github-name
```

Names show after the next refresh: the script checks that each entry was committed by its own
user (or by a maintainer with a `consent_source`). Delete your entry to remove your names.

## Refreshing (maintainers)

`contributors.json` lists the maintainers of this repository, with stats taken from this repository's
own history (`git log --author=… --numstat`). Regenerate it the same way when the list changes;
never copy stats from another project's history. `people.toml` holds the names a contributor chose
for themselves. Git author names and emails are never recorded.
