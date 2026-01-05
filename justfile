# SPDX-License-Identifier: EUPL-1.2
# SPDX-FileCopyrightText: OpenTalk Team <mail@opentalk.eu>
#
# This file can be used with the [`just`](https://just.systems) tool.

[no-exit-message]
_check_git_cliff:
    #!/usr/bin/env bash
    set -euo pipefail
    if ! git-cliff --help &>/dev/null; then
        echo 'git-cliff is not available, you can install it with `cargo install --git ssh://git@git.opentalk.dev:222/opentalk/tools/git-cliff.git`' >&2
        exit 1
    fi

# Update the changelog
update-changelog VERSION: _check_git_cliff
    # Update Changelog
    GITLAB_TOKEN=$(cat ~/.gitlab_token) \
    GITLAB_API_URL=https://git.opentalk.dev/api/v4 \
    GITLAB_REPO=opentalk/backend/libs/service-probe \
    git-cliff -vv \
        --config opentalk \
        --unreleased \
        --tag "v{{ VERSION }}" \
        --prepend CHANGELOG.md
