From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] leds: ledtrig-morse: send out morse code
Date: Fri, 29 Jun 2018 09:48:00 +0200
Message-ID: <CAMuHMdW1NX=BwJE0eauRLkRj1se4iRNGdxHXeajNQ-dKDhnPKw@mail.gmail.com>
References: <20180628134227.GA1719@arbeit> <20180628185630.GA6095@amd>
 <20180628202955.GA1534@imap.1und1.de> <20180628204516.GA29146@amd>
 <20180629064147.GA3219@arbeit> <20180629071724.GA10079@amd>
 <CAMuHMdXaPz3ckT1cPZed4e=iwk3nb75UBGC66hm+b+xRDNNnNg@mail.gmail.com> <20180629072912.GB10079@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180629072912.GB10079@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andreas Klinger <ak@it-klinger.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Ben Whitten <ben.whitten@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Willy Tarreau <w@1wt.eu>, Philippe Ombredanne <pombredanne@nexb.com>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel.

On Fri, Jun 29, 2018 at 9:29 AM Pavel Machek <pavel@ucw.cz> wrote:
> On Fri 2018-06-29 09:21:24, Geert Uytterhoeven wrote:
> > On Fri, Jun 29, 2018 at 9:17 AM Pavel Machek <pavel@ucw.cz> wrote:
> > > > > Yeah, well... I don't think decoding sentences in morse code is going
> > > > > to be much fun.
> > > > >
> > > > > And we don't really want encoder in kernel. Just do encoding in
> > > > > userspace, and use pattern trigger to display it.
> > > > >
> > > > > For many uses, morse code is "too geeky", and other patterns will be
> > > > > used.
> > > > >
> > > > > Like " X    " for error 1, " X X     " for error 2, " .xX .xX " for
> > > > > charging, " .xXx. " for everything okay...
> > > > >
> > > >
> > > > The hardware i'm using is not able to adjust brightness. It can just switch the
> > > > LED on or off. That's it.
> > > >
> > > > If anybody is interested i can submit a version 2 of the morse trigger with the
> > > > improvements suggested by Greg and Geert. Please let me know.
> > >
> > > I'd prefer more general pattern trigger.
> >
> > There are two parts here:
> >   1. The general pattern trigger (which is not yet upstream),
> >   2. A way to supply a string, convert it into morse code, and feed it to
> >      the LED subsystem.
> >
> > Given 1 is not yet upstream, I think Andreas solution is fine.
> > Once 1 is upstream, 2 can be modified to feed into 1, if available.
>
> There's no reason 2. should be in kernel ("mechanism, not policy").
>
> Given 1. is not really more complicated than the morse
> trigger... please just help with pattern trigger if you want this to
> happen.

Ah, you want to do the conversion to morse code in userspace?
Yes, that makes sense.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
