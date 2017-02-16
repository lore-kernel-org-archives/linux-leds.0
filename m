From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/6] Move dell-led to drivers/platform/x86
Date: Thu, 16 Feb 2017 10:33:11 +0100
Message-ID: <20170216093311.GB1350@ozzy.nask.waw.pl>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170213112640.GA1188@ozzy.nask.waw.pl>
 <CAJ=jqua0W3fmoJFqqVgG2Eq=9E-4toXC0UyQH3TyxZiTtNsODw@mail.gmail.com>
 <20170215135455.GA2014@ozzy.nask.waw.pl>
 <CAJ=jquaJazMKRsKdq=tpPNq=CBtFPcau6SW3nr738v-zTXfC4g@mail.gmail.com>
 <20170215151224.GF32000@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170215151224.GF32000@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Anthony Wong <anthony.wong@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> > >> 6. Compiled and installed Linux kernel 4.10 rc8
> > >>
> > >>   -> Microphone mute led does not work
> > >
> > > This is even more confusing.  Between 4.9, which you claim works fine,
> > > and 4.10-rc8, which you claim does not work, I can see no changes to
> > > either drivers/leds/dell-led.c or sound/pci/hda/dell_wmi_helper.c.
> > > Kernel configuration issue?
> > 
> > I was surprised too, and I compiled it twice and installed on both
> > Ubuntu 16.04 and 16.10.
> > 
> > I would guess it is config too. On 4.9, it was using Ubuntu default.
> > On 4.10rc8, I am pretty much using the instruction on
> > https://wiki.ubuntu.com/KernelTeam/GitKernelBuild. The .config is
> > available @ http://paste.ubuntu.com/24001113/
> 
> In Patch 6/6 is: Kconfig option is renamed from
> CONFIG_LEDS_DELL_NETBOOKS to CONFIG_DELL_WMI_LED.
> So you need to update your config for testing.

I also thought about this, but CONFIG_DELL_WMI_LED is only needed to
support the Dell Activity LED (present in the Dell Latitude 2100
netbook).  Meanwhile, Alex is only testing the microphone mute LED,
which requires CONFIG_DELL_LAPTOP to be enabled.  The cover letter for
this patch series provides a more thorough explanation.

-- 
Best regards,
Michał Kępień
