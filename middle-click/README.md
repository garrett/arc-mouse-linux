# Extremely hacky way to remap scroll touch to middle click

The Arc Touch acts not just as a mouse, but also as a keyboard. The
touch-sensitive area has a top and bottom region that, by default, send "page
up" and "page down" events.

1. Ensure your computer meets the correct requirements:

   - Add yourself to the `wheel` group. You're probably already there, for
     sudo-related reasons. This script allows those who are root-capable to
     read devices, which is needed for `evrouter`. (Choosing the `wheel`
     group wasn't just for irony.)

   - Install [`evrouter`](http://www.bedroomlan.org/projects/evrouter). Sadly,
     there's no package of this for most distros, so you'll probably have to
     compile it if you're not on Debian. (The page claims there are RPMs, but
     I haven't found them...)

2. Copy the `arc-middle.sh` script to someplace safe, like your local `bin` directory.

   ```
   mkdir -p ~/bin/ # If you don't have a local ~/bin/ dir already
   cp arc-middle.sh ~/bin/
   ```

3. Copy the `99-arc-mouse.hwdb` to the udev hwdb.d directory:

   ```
   cp 99-arc-mouse.hwdb /usr/lib/udev/hdwb.d/
   ```

4. Run `udevadm --update`

5. Unplug and replug your USB pairing device.

6. Run `~/bin/arc-middle.sh`.

   - If you have `~/bin/` in your path, you can just run `arc-middle.sh` whenever you reconnect your mouse.

  - If you don't have `~/bin/` in your path, then add this line to your `~/.bashrc` or `~/.zshrc` file:

    ```
    export PATH=$HOME/bin:$PATH
    ```

Afterward, since steps 1 - 4 are for the initial setup, all you'll have to do
from now on is to run step 6, after plugging in your USB adapter.

---

Note: Yes, this is annoying and not so great for all sorts of reasons... but
it's the only thing I've found that works for now. A much better approach is if
udev could allow keyboards to map mouse clicks; but it seems key remapping only
works for other keys. I chose a silly "MSDOS" key that's not likely to be used
on Linux and simply tell evrouter to listen for that and perform a middle
click.

If you know of a better way of doing this (perhaps even building on some of the
info contained here), then please
[open an issue](https://github.com/garrett/arc-mouse-linux/issues/new).
