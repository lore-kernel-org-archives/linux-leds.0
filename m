From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Tue, 13 Nov 2018 22:38:49 +0100
Message-ID: <CAMuHMdVAYpXPZie8DTrmMz+KXiVP=WNyFNtfTZPYHYkFOa9wqg@mail.gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd> <a640167b-3a3e-daea-b377-6e82b653c5e8@gmail.com>
 <20181111201605.GA20160@amd> <57b77d4e-39a0-aaf2-5952-c2c25dc58593@gmail.com>
 <20181112103513.GB5695@amd> <662c02ba-455b-e2bf-a5e2-ae3933161894@gmail.com>
 <20181112190554.GA13959@amd> <b167cfc1-e392-eec6-6455-5983dc1c7212@gmail.com> <20181112220616.GB11942@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112220616.GB11942@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, dmurphy@ti.com, Linus Walleij <linus.walleij@linaro.org>, oleg@kaa.org.ua, Sakari Ailus <sakari.ailus@linux.intel.com>, simon@lineageos.org, xiaotong.lu@spreadtrum.com
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On Mon, Nov 12, 2018 at 11:07 PM Pavel Machek <pavel@ucw.cz> wrote:
> Not really, I'm afraid. Hard drives have no red LEDs on them (and the
> LED would not be visible, anyway) so the "device" symlink in such case
> would point to some kind of i2c LED controller.

I've seen hard drives with LEDs on the PCB.
External USB enclosures with hard drives typically have LEDs, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
