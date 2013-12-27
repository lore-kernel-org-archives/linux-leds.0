From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Fri, 27 Dec 2013 19:34:25 +0100
Message-ID: <CAMuHMdUMcRz2W_64bYd7tzG_MCrDbRq6o4qpw=duUEm-R6T3xA@mail.gmail.com>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
	<20131225230935.GB13593@amd.pavel.ucw.cz>
	<BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
	<20131227115746.4cbd9523@alan.etchedpixels.co.uk>
	<20131227125725.GA21506@amd.pavel.ucw.cz>
	<20131227141826.3fe406e4@alan.etchedpixels.co.uk>
	<20131227152354.GA24152@amd.pavel.ucw.cz>
	<20131227181349.475abe88@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131227181349.475abe88@alan.etchedpixels.co.uk>
Sender: linux-doc-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Joe Xue <lgxue@hotmail.com>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Dec 27, 2013 at 7:13 PM, One Thousand Gnomes
<gnomes@lxorguk.ukuu.org.uk> wrote:
>> Plus, it will actually save CPU cycles, and thus significant power.
>
> All of which will be totally wiped out if you bump all the millions of
> x86 server boxes in the world up by one page of kernel space and cause a
> few disk I/Os

FWIW, the former is on battery power, the latter isn't.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
