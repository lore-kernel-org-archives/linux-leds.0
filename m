From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: how to represent sequence of brightnesses in /sys (was Re:
 [PATCH] Add the LED burst trigger)
Date: Sat, 28 Dec 2013 20:34:40 +0100
Message-ID: <CAMuHMdXDJ6uhe6srV-+0a8=cpBUgP+VakG+_wyLwAuiQSRVhqQ@mail.gmail.com>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
	<20131225230935.GB13593@amd.pavel.ucw.cz>
	<BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
	<20131226142607.GA15225@amd.pavel.ucw.cz>
	<BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
	<20131227095705.GC17143@amd.pavel.ucw.cz>
	<BLU172-W8D850A8DEA8C0D87FBF45ACCC0@phx.gbl>
	<20131228101622.GA13564@amd.pavel.ucw.cz>
	<CAMuHMdVz7FWgYZRVHy6pK+g_2QKxTW00N8jmjWHe05m5CJvPOw@mail.gmail.com>
	<20131228192935.GA28119@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131228192935.GA28119@amd.pavel.ucw.cz>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <greg@kroah.com>, Joe Xue <lgxue@hotmail.com>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Sat, Dec 28, 2013 at 8:29 PM, Pavel Machek <pavel@ucw.cz> wrote:
>> Sysfs is meant to be human-readable/writable, so please use plain ASCII
>> numbers in strings instead.
>
> Actually, sysfs is meant to be one value per file, and it is

Ideally, yes.

> understood that data that are "natively blob" are just passed as
> blob. (I believe this qualifies).

But it doesn't buy us much here, does it? It will make e.g. shell scripts
needlessly complicated.

> Sequence of ascii numbers would work for me, but I don't think that is
> allowed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
