From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 09/21] ARM: pxa: magician: Add OV9640 camera support
Date: Fri, 21 Aug 2015 15:45:53 +0200
Message-ID: <1634812.ZDaECJ9ClW@wuerfel>
References: <cover.1439843482.git.petr.cvek@tul.cz> <2889798.x6xcIzdYMU@wuerfel> <55D65722.9030508@tul.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:55801 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbbHUNqQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 21 Aug 2015 09:46:16 -0400
In-Reply-To: <55D65722.9030508@tul.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Petr Cvek <petr.cvek@tul.cz>
Cc: linux-arm-kernel@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, linux@arm.linux.org.uk, sameo@linux.intel.com, linux-pm@vger.kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org, cooloney@gmail.com, sre@kernel.org, haojian.zhuang@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, philipp.zabel@gmail.com, lee.jones@linaro.org, j.anaszewski@samsung.com, daniel@zonque.org

On Friday 21 August 2015 00:39:30 Petr Cvek wrote:
> Dne 20.8.2015 v 22:26 Arnd Bergmann napsal(a):
> > On Thursday 20 August 2015 21:48:20 Robert Jarzmik wrote:
> >> Petr Cvek <petr.cvek@tul.cz> writes:
> >>
> >>> +     mdelay(3);
> >> Okay, there are several mdelay(3) in this file.
> >>
> >> Could you please test if removing these mdelays prevents the camera from working
> >> ? If not, I'd like to have them removed.
> >>
> >>
> > 
> > FWIW, it might be possible to replace some of them with msleep() calls,
> > potentially after replacing spinlocks with mutexes where necessary.
> > 
> >       Arnd
> > 
> 
> Datasheet says:
> 
>         tS:RESET        Setting time after software/hardware reset      1 ms
> 
> So at least one ~1 ms should be left there. Are msleep less than 20ms valid? 
> 
> (checkpatch: msleep < 20ms  can sleep for up to 20ms)

On most kernels, an msleep(1) will sleep somewhere between 1 and 3 milliseconds
(but could be much longer), while an mdelay(1) tries to sleep around one
millisecond, more or less.

	Arnd
