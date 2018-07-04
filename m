From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Wed, 4 Jul 2018 09:46:53 +0200
Message-ID: <CAMuHMdUKpF=x-Se=9sKqiaWCr3YqPH1XOxK-sR=gvQ8uZBOnbg@mail.gmail.com>
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
> > > +       {'a', ".-"},
> > > +       {'b', "-..."},

> >
> > Do you expect this to be changed somehow?
> > Otherwise we might just to keep two char arrays of alphas and digits
> > in an order of ascii appearance.
> >
> > In the code something like
> >
> > ch = tolower(x);
> > if (isalpha(ch))
> >  code = alphas[ch - 'a'];
> > else if (isdigit(ch))
> >  code = digits[ch - '0'];
> > else
> >  code = unknown;
> >
> > > +       {0, NULL},
> >
> > And this will gone, you just provide it with known size,
>
> Well, in this case it's even possible to go further and avoid storing
> 36 strings. Indeed, no representation is longer than 5 symbols, so you
> can use 5 bits for the encoding (0=".", 1="-") and 3 bits for the
> length, it gives you a single byte per character instead of a pointer
> to a string plus 6 chars. Then in order to make it readable, 5 macros

Hehe, https://lkml.org/lkml/2018/6/28/544 ;-)

> can be provided to emit the code :
>
> #define MORSE1(a,b)       (1 | ((a)<<3))
> #define MORSE2(a,b)       (2 | ((a)<<3)|((b)<<4))
> #define MORSE3(a,b,c)     (3 | ((a)<<3)|((b)<<4)|((c)<<5))
> #define MORSE4(a,b,c,d)   (4 | ((a)<<3)|((b)<<4)|((c)<<5)|((d)<<6))
> #define MORSE5(a,b,c,d,e) (5 | ((a)<<3)|((b)<<4)|((c)<<5)|((d)<<6)|((e)<<7))
>
> Then all chars may be defined like this :
>
>     ['a'] = MORSE2(0,1),
>     ['b'] = MORSE4(1,0,0,0),
>     ['c'] = MORSE4(1,0,1,0),
>     ['d'] = MORSE3(1,0,0),
>     ['e'] = MORSE1(0),

Nice!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
