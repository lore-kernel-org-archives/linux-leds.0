From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Fri, 6 Jul 2018 09:22:46 +0200
Message-ID: <CAMuHMdXE3MdCQRq6Y5sEu+B8668b5mEEfNT=5qva4AzxWFyijA@mail.gmail.com>
References: <20180703155328.GA18299@arbeit> <CAHp75VcQmUPCqzteHs=EaA5h-ABAQ=GWuLVRGWL3meMKZBJ-iQ@mail.gmail.com>
 <20180704024112.GB9015@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704024112.GB9015@1wt.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Willy Tarreau <w@1wt.eu>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andreas Klinger <ak@it-klinger.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Ben Whitten <ben.whitten@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Philippe Ombredanne <pombredanne@nexb.com>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Willy,

On Wed, Jul 4, 2018 at 4:41 AM Willy Tarreau <w@1wt.eu> wrote:
> On Tue, Jul 03, 2018 at 09:43:06PM +0300, Andy Shevchenko wrote:
> Well, in this case it's even possible to go further and avoid storing
> 36 strings. Indeed, no representation is longer than 5 symbols, so you
> can use 5 bits for the encoding (0=".", 1="-") and 3 bits for the
> length, it gives you a single byte per character instead of a pointer
> to a string plus 6 chars. Then in order to make it readable, 5 macros
> can be provided to emit the code :

And using the scheme from
https://plus.google.com/u/0/117536210417097546339/posts/hvctn17WUZu
you can store up to 7 symbols in a single byte, which you need when going
beyond plain alphanumeric:

-0111111
--011111
---01111
----0111
-----011
------01
-------0

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
