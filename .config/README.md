# SECURITY CONSIDERATIONS

It's fun and all to share one's dotfiles, but let's not be careless about this. No secrets should ever appear in any repository. Since some applications store secrets in their config files and host those under the `.config` directory, strong precautions must be taken to avoid leaks.

Precautions:
- **NO/DENY BY DEFAULT:** Apply the general principle of "no" by default. This means we exclude everything from the `.config` folder by default and permit exceptions where they make sense.
- **DO NOT SYMLINK TO .CONFIG/:** While symlinks to specific files and folders under `.config` may be acceptable, avoid any symlink that goes directly to `.config`. 

To put something in the `.config` folder, move that thing from `~/.config` to `thompson/dotfiles/.config/<thing>` and symbolicly link to that thing from the original path. Preview the thing for any secrets. Add an exception for the thing under `.config/.gitignore`. REMEMBER: When in doubt, leave it out.