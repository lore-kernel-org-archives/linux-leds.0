From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Fri, 27 Dec 2013 13:33:36 +0100
Message-ID: <CAMuHMdWKa92mKsNtrj-eKdhz=CFf2LfoSmC6=p4-QyEX54LFUw@mail.gmail.com>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
	<20131225230935.GB13593@amd.pavel.ucw.cz>
	<BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
	<20131226142607.GA15225@amd.pavel.ucw.cz>
	<BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Dec 27, 2013 at 1:31 AM, Joe Xue <lgxue@hotmail.com> wrote:
> echo "-.-. *"> patten
> -              a long on then a off
> .              a short on then a off
> space     a long off
> *             mean repeat the patten
> s             mean indicate the patten just one time then stop

Why both "*" and "s"? What happens if none of them is specified?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
