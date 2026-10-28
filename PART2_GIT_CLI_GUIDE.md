# Part 2 — Git CLI evidence guide

The Part 2 evidence files must contain output from commands run against your own GitHub account and the course repository. Do not submit invented terminal output. Use this guide after you have forked the repository.

## 1. Fork and save evidence as `forked-repo`

Use the lab's authenticated GitHub CLI/API setup. Example using the GitHub REST API with `curl` (replace `YOUR_GITHUB_TOKEN` with a token in an environment variable; do not paste a token into a submitted file):

```bash
export GH_TOKEN="YOUR_GITHUB_TOKEN"
curl -sS -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  https://api.github.com/repos/ibm-developer-skills-network/mcino-Introduction-to-Git-and-GitHub/forks \
  | tee forked-repo
```

If the lab already provides a fork or has a prescribed command, follow the lab instructions instead. A fork request can return an error if a fork already exists; inspect your GitHub account before retrying.

## 2. Merge typo fix and save evidence as `merge_branches`

After cloning your fork, create the `bug-fix-typo` branch and make the exact typo correction requested in the lab. Then run:

```bash
git checkout main
git merge bug-fix-typo
```

Capture the real terminal output in `merge_branches`, for example:

```bash
{
  git checkout main
  git merge bug-fix-typo
} 2>&1 | tee merge_branches
```

The grading criterion expects the merge output to show one file changed. Do not fabricate the output; verify the correct file and typo before merging.

## 3. Revert typo and open PR; save evidence as `bug-fix-revert`

Create and push the `bug-fix-revert` branch containing the requested reversion, then open the pull request from your fork. To capture the actual PR details, replace `OWNER` with your GitHub username and `PR_NUMBER` with the created pull-request number:

```bash
curl -sS \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  https://api.github.com/repos/OWNER/mcino-Introduction-to-Git-and-GitHub/pulls/PR_NUMBER \
  | tee bug-fix-revert
```

The JSON should identify the PR and its `head.repo.full_name` should be your fork. If the course specifically requires a different endpoint/format, use the lab instructions.

## 4. Branch status evidence

Capture the actual branches page/API response. Replace `OWNER` with your GitHub username:

```bash
curl -sS \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  https://api.github.com/repos/OWNER/mcino-Introduction-to-Git-and-GitHub/branches \
  | tee branches-output
```

Ensure `main`, `bug-fix-typo`, and `bug-fix-revert` exist on the remote before capturing this output. The grader's requested filename for this task was not specified in the prompt; save it using the filename required by the submission UI or course lab.

## Important

- Never commit or submit your access token. If you store a token in an environment variable, do not include it in terminal logs.
- `forked-repo`, `merge_branches`, and `bug-fix-revert` are evidence files, not source files for Part 1.
- This guide does not create the fork, branches, merge, or pull request on your behalf. Those actions require your authenticated GitHub account and the actual course repository.
