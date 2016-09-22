# Questions

## Unanswered

- **What is a git submodule, and why use them?**
- **What are the SOLID principles?**
- **What is a finite state machine?**

## Answered

- **How do I set up a cron job, to update and upgrade my brew, for instance?**

  _Answered by @passcod_

  Setting up and tearing down cron jobs are done with crontab.

  Crontab is a dedicated editing tool for your own cron file. ("your own" is
  important here. Every user has their own cron file, so you might be surprised
  that your cron jobs have "disappeared" if using `crontab` from a different user.
  This is oft happenstance when using `sudo crontab` to edit root's cron jobs,
  then coming back later and forgetting the `sudo`.)

  Running `crontab -l` will print the existing cron file, useful for confirming
  what's there.

  Running `crontab -e` will launch your `$EDITOR` with _a copy_ the existing cron
  file, allowing you to edit it. If you save a cron file with syntax errors, it
  will tell you so. If you don't and everything looks fine, it will overwrite the
  actual cron file with your changes. This makes it significantly safer than editing
  the cron file directly.

  The cron file format is a bit cryptic:

  ```
  <minute> <hour> <day> <month> <weekday> <command...>
  ```

  with `*` meaning "every [unit of time]", and `*/N` means "every Nth [unit of time]".
  For example:

  ```cron
  # every weekday morning at 3:15 am
  15 3 * * 1-5 command...

  # 14th February at noon
  0 12 14 2 * command...

  # midnight on the first and fifteenth of each month, as well as on every Monday
  0 0 1,15 * 1 command...

  # every monday at midnight
  0 0 * * 1 command...

  # every five minutes
  */5 * * * * command...
  ```

  Now, for the second part of your question, you do _not_ want to auto-upgrade
  your brew (or using any package manager) with cron. This is more important on
  Linux systems where the entire system is handled with the package manager. You
  _can_ update the definitions, that's safe, but if you have your system upgrading
  automatically, consider what happens if there is an error in the upgrade process.
  Programs can stop working for no apparent reason, or may end up in an inconsistent
  state if they are upgraded halfway through their use. More dramatically, failed
  kernel or core package upgrades on Linux may mean that you try to reboot and
  suddenly find yourself locked out as your system now panics on boot.

  Another dimension is that brew frequently installs from source, which is oftentimes
  CPU-hungry (and thus power-hungry), so you'll be happily working at a coffeeshop
  when your battery dwindles to zero while checking your email because of a compile
  running in the background.
