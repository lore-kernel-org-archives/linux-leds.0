From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/6] Move dell-led to drivers/platform/x86
Date: Thu, 16 Feb 2017 12:32:58 +0100
Message-ID: <20170216113258.GD1350@ozzy.nask.waw.pl>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170213112640.GA1188@ozzy.nask.waw.pl>
 <CAJ=jqua0W3fmoJFqqVgG2Eq=9E-4toXC0UyQH3TyxZiTtNsODw@mail.gmail.com>
 <20170215135455.GA2014@ozzy.nask.waw.pl>
 <CAJ=jquaJazMKRsKdq=tpPNq=CBtFPcau6SW3nr738v-zTXfC4g@mail.gmail.com>
 <20170216092747.GA1350@ozzy.nask.waw.pl>
 <CAJ=jqub6AwXBeAahmMguq_h4jTkDbxxEL9=T1aLPOOENMdeLcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ=jqub6AwXBeAahmMguq_h4jTkDbxxEL9=T1aLPOOENMdeLcw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Anthony Wong <anthony.wong@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> The led stops working after 4th patch "platform/x86: dell-laptop:
> import dell_micmute_led_set() from drivers/leds/dell-led.c", and the
> .config is with CONFIG_DELL_LAPTOP=m
> 
> However, I found dell-laptop is not loaded on Latitude 7480 as its
> chassis type is Notebook (10), instead of 8 (Portable) or 9 (Laptop).
> That's also what I see for newer Dell laptops.
> 
> After I added the below entry into dell-laptop, the led works fine.
> This is not in kernel 4.10 rc8 either, and I will submit a patch for
> it.
> 
>         {
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>                         DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /*Notebook*/
>                 },
>         },

Great, so it all makes sense now.  Thanks once again for investigating.

For maintainers' convenience, I am planning to submit a v3 with all the
tags supplied by everyone who reviewed this series and also some minor
coding style tweaks suggested along the way.

Alex, in the light of your findings quoted above, would it be okay to
also apply your Tested-by to all patches?

Jacek, Pavel, which linux-leds branch would you like me to base v3 on?

-- 
Best regards,
Michał Kępień
