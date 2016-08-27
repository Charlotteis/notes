# Notes

## Linux

- 'Linux' is the name of the Kernel
- The Kernel is the first thing loaded on start up, and proceeds to load
everything else
- Kernel manages resources like memory, disk I/O

- Docker: Container management tool
- Containers use your machine resources directly, rather than a VMs virtualised
resource
- Containers combine images; Ubuntu image + PG image = Container

- SSH: Secure Shell
- Root: God of the machine. Administrator++
- Sudo: Elevates privileges to Root
- Permissions: (e.g. drwxrwxr-x-), d = directory. owner|group|public

- `/dev`: where devices are mounted to the system
- `/etc`: where config files live
- `/home/blah`: your shit :poop:
- `/var`: variable shit (like emails, logs)

- `>` = put output, `>>` append output (shell scripting)
- `thing=$(dothething)`, the `$()` is a subshell, the result returned
immediately and assigned to `thing`

## Setting up a web server

- On a Digital Ocean droplet
- nginx: a popular web server
- PostgreSQL: a database server
- PM2: Node.js keep-alive server
- wget: retrieve files over the web
- curl: execute web requests

- `apt-get -y`: `-y` means to say an automatic yes to all questions
- don't use an elevated account to connect to PostgreSQL, better to
have multiple accounts. separation of concerns.

## Make

- make: a build tool, not a compiler.
- to turn 1+ files into other files. build output files from inputs
- make was originally designed for C programs, code and header files
woud be combined/built into object files and then compiled to binary
- `.PHONY`: list what targets/directives don't create a file
- **must use tabs!**

```make
@ command not printed to stdout
command printed to stdout
```

- If you don't specifiy a target to make, the first target in the
Makefile will be chosen
- Make runs all commands in a subshell, outside of its own process
- `$@`: target name
