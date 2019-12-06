https://kov4l3nko.github.io/blog/2017-12-15-jb-ios-coding-basics/#compilation-for-ios-from-command-line-or-makefile

This runs on macOS. You require jtool (http://www.newosxbook.com/tools/jtool.html), Xcode Command Line Tools.

Create a `vars.mk` file starting from `vars.mk.sample` and update the `CERT_ID` and `JTOOL` variables. `CERT_ID` is the certificate ID you get by running `security find-identity`. `JTOOL` is the path to the `jtool` executable.

Use `make hello_ent` to do all steps:
  * compile the `hello` universal/fat binary for armv7, armv7s, arm64
  * sign the binary
  * extract the `hello_arm64` non-fat binary for arm64
  * add the entitlement in `ent.xml` and resign it in the the `hello_ent`

##### For jailbroken devices running iOS 12 or above only

After you obtain the non-fat binary for arm64 and you transfer it to the mobile
device, you will likely get a `Killed: 9` error when trying to run the
executable. This is happening because the Trust Cache doesn't have any
information about this new binary. To solve this simply run `inject hello_ent`.
