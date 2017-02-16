From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/6] Move dell-led to drivers/platform/x86
Date: Thu, 16 Feb 2017 10:27:47 +0100
Message-ID: <20170216092747.GA1350@ozzy.nask.waw.pl>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170213112640.GA1188@ozzy.nask.waw.pl>
 <CAJ=jqua0W3fmoJFqqVgG2Eq=9E-4toXC0UyQH3TyxZiTtNsODw@mail.gmail.com>
 <20170215135455.GA2014@ozzy.nask.waw.pl>
 <CAJ=jquaJazMKRsKdq=tpPNq=CBtFPcau6SW3nr738v-zTXfC4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34706 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754047AbdBPJ1w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Feb 2017 04:27:52 -0500
Received: by mail-lf0-f67.google.com with SMTP id q89so953054lfi.1
        for <linux-leds@vger.kernel.org>; Thu, 16 Feb 2017 01:27:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAJ=jquaJazMKRsKdq=tpPNq=CBtFPcau6SW3nr738v-zTXfC4g@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Anthony Wong <anthony.wong@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

> On Wed, Feb 15, 2017 at 9:54 PM, Michał Kępień <kernel@kempniu.pl> wrote:
> > Alex,
> >
> >> I tested the patches with the following setup. Please note I tested
> >> the microphone mute led by GUI, as the hotkey does not work on this
> >> system.
> >
> > Thank you for taking the time to test this series, it is appreciated.  I
> > would not expect the switching method (GUI/hotkey) to matter here, as
> > long as we can compare behavior of two kernel versions by consistently
> > using one of them.
> >
> >>
> >> 1. Downloaded the below patches from patchwork
> >>
> >> 9518737 Awaiting Upstream [v2,1/6] dell-led: remove GUID check from
> >> dell_micmute_led_set()
> >> 9518761 Awaiting Upstream [v2,2/6] ALSA: hda - use
> >> dell_micmute_led_set() instead of dell_app_wmi_led_set()
> >> 9518741 Awaiting Upstream [v2,3/6] ALSA: hda - rename
> >> dell_led_set_func to dell_micmute_led_set_func
> >> 9518725 Awaiting Upstream [v2,4/6] platform/x86: dell-laptop: import
> >> dell_micmute_led_set() from drivers/leds/dell-led.c
> >> 9518727 Awaiting Upstream [v2,5/6] dell-led: remove code related to mic mute LED
> >> 9518735 Awaiting Upstream [v2,6/6] dell-led: move driver to
> >> drivers/platform/x86/dell-wmi-led.c
> >> 9520053 Awaiting Upstream [v2,6+/6] platform/x86: dell-wmi-led: fix
> >> coding style issues
> >>
> >> 2. Installed Ubuntu 16.10 (Linux kernel 4.8) on Dell Latitude 7180
> >
> > Just to be sure, I assume you meant 7280?
> 
> This is a typo, and it should be 7480, which should be the same as 7280.
> 
> >
> >>
> >>   -> Microphone mute led works as expected
> >>
> >> 3. Applied downloaded patches to kernel 4.8 without any conflicts, but
> >> kernel will not compile successfully.
> >
> > I am confused.  This patch series should apply cleanly to 4.9 and its
> > surroundings.  Between 4.8 and 4.9, commit 4875a5f72180 ("ALSA: hda -
> > Fix a failure of micmute led when having multi adcs") happened.   This
> > makes it impossible to apply this patch series cleanly on top of 4.8
> > without reducing context to one line.
> >
> > Moreover, I applied this patch series (with reduced context) to 4.8 and
> > successfully compiled the kernel.  Could you shed some light on where
> > exactly did your build crash?
> 
> The error messages such as below, so it is probably not "fails to
> compile". Since 4.9 works better, I probably will focus on 4.9 & 4.10,
> though.

I agree as I see no reason for this patch series to be backported.

> 
> find /home/alexhung/src/kernel/ubuntu-yakkety/debian/build/build-generic/
> -name \*.ko | \
>     sed -e 's/.*\/\([^\/]*\)\.ko/\1/' | sort >
> /home/alexhung/src/kernel/ubuntu-yakkety/debian.master/abi/4.8.0-37.39/amd64/generic.modules
> II: Checking modules for generic...
>    reading new modules...read 4821 modules.
>    reading old modules...
>       MISS: dell-led
>       NEW : dell-wmi-led
>       read 4821 modules : new(1)  missing(1)
> EE: Missing modules (start begging for mercy)
> debian/rules.d/4-checks.mk:12: recipe for target 'module-check-generic' failed
> make: *** [module-check-generic] Error 1

Ah, okay, so you are using the Debian/Ubuntu build method.  The messages
it spits out are correct as the purpose of this series is to remove
dell-led and create dell-wmi-led.  However, I have never compiled a
kernel using the Debian/Ubuntu way, so I am unable to give you any tips
for getting rid of the "Missing modules" error message.

> 
> 
> >
> >>
> >> 4. Installed Ubuntu Zesty kernel (Linux kernel 4.9)
> >>
> >>   -> Microphone mute led works as expected
> >>
> >> 5. Applied and compiled downloaded patches to kernel 4.9
> >>
> >>   -> Microphone mute led does not work
> >
> > Any chance of a git bisect?
> 
> Certainly. Give me some time.

Sure, no rush, though before you start bisecting, please check whether
CONFIG_DELL_LAPTOP is enabled in your kernel configuration for 4.9.

> 
> >
> >>
> >> 6. Compiled and installed Linux kernel 4.10 rc8
> >>
> >>   -> Microphone mute led does not work
> >
> > This is even more confusing.  Between 4.9, which you claim works fine,
> > and 4.10-rc8, which you claim does not work, I can see no changes to
> > either drivers/leds/dell-led.c or sound/pci/hda/dell_wmi_helper.c.
> > Kernel configuration issue?
> 
> I was surprised too, and I compiled it twice and installed on both
> Ubuntu 16.04 and 16.10.
> 
> I would guess it is config too. On 4.9, it was using Ubuntu default.
> On 4.10rc8, I am pretty much using the instruction on
> https://wiki.ubuntu.com/KernelTeam/GitKernelBuild. The .config is
> available @ http://paste.ubuntu.com/24001113/

CONFIG_DELL_SMBIOS is not set in that .config.  That prevents you from
enabling CONFIG_LEDS_DELL_NETBOOKS, which is required for the microphone
mute LED to work without this patch series applied.

> 
> 
> >
> >>
> >> 7. Applied and compiled downloaded patches to kernel 4.10 rc8
> >>
> >>   -> Microphone mute led does not work
> >
> > No surprises here if it really does not work with 4.10-rc8.

My remark regarding CONFIG_DELL_LAPTOP also applies to 4.10-rc8 with
this patch series applied.

Thanks again for your work on this,

-- 
Best regards,
Michał Kępień
