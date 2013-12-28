From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Sat, 28 Dec 2013 19:51:59 +0100
Message-ID: <CAMuHMdVz7FWgYZRVHy6pK+g_2QKxTW00N8jmjWHe05m5CJvPOw@mail.gmail.com>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
	<20131225230935.GB13593@amd.pavel.ucw.cz>
	<BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
	<20131226142607.GA15225@amd.pavel.ucw.cz>
	<BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
	<20131227095705.GC17143@amd.pavel.ucw.cz>
	<BLU172-W8D850A8DEA8C0D87FBF45ACCC0@phx.gbl>
	<20131228101622.GA13564@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131228101622.GA13564@amd.pavel.ucw.cz>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Joe Xue <lgxue@hotmail.com>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Sat, Dec 28, 2013 at 11:16 AM, Pavel Machek <pavel@ucw.cz> wrote:
>> Good idea.
>> I have finished but I'll change it to this way soon and test it in next some days.
>>
>> What the idea about the character to indicate stop?
>>
>> I mean this patten maybe indicate just once maybe indicate repeatedly until the next patten.
>>
>> What about "/"?
>> If there is a "/" at end then stop it else repeat it?
>
> Actually, I'd put a do_repeat attribute somewhere instead of using
> magic character for automatic repeats.
>
> And while " " for pause and "#" for light would work. Maybe we chould
> do "\0" for pause and "\177" for light... and interpret everything
> between as an intensity. That will make it useful for LEDs with
> variable intensites, too...

Sysfs is meant to be human-readable/writable, so please use plain ASCII
numbers in strings instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
