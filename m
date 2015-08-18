From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Wed, 19 Aug 2015 00:56:35 +0200
Message-ID: <20150819005635.1daee673@x2>
References: <20150806173558.GZ1540@lahna.fi.intel.com>
	<20150806201820.5ca0764d@x2>
	<20150807105745.GB1540@lahna.fi.intel.com>
	<20150808140656.6b81d3b9@x2>
	<20150811120038.GF1541@lahna.fi.intel.com>
	<20150811194256.08816c63@x2>
	<20150812125314.GS1541@lahna.fi.intel.com>
	<20150815123640.45a5b9bf@x2>
	<20150817230823.61de477a@x2>
	<20150818093226.3db0b553@x2>
	<20150818090216.GG1552@lahna.fi.intel.com>
	<20150818133850.42bb31cf@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:33248 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710AbbHRW4j (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 18:56:39 -0400
Received: by wijp15 with SMTP id p15so112204369wij.0
        for <linux-leds@vger.kernel.org>; Tue, 18 Aug 2015 15:56:37 -0700 (PDT)
In-Reply-To: <20150818133850.42bb31cf@x2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Simon Guinot <simon.guinot@sequanux.org>

Hello,

I did a first pass on gpio-f7188x module, and pushed several commits in
my current working branch:

https://github.com/vpelletier/linux/commits/ts651

This commit contains the relevant part of my changes:
  gpio: gpio-f7188x: Use mutex for access serialisation.
(currently:
  https://github.com/vpelletier/linux/commit/0fecf37bcee67d577f7e1e8e58afc463f452bcff
)
but "of course", it does not work: kernel Oops as soon as I trigger the
concurrent access which caused the original issue. With a single active
core, it works fine of course.

Sadly, the traceback is longer than on-screen info, despite being at
1920x1080 resolution with default console font. I recall reading about
a project to display kernel errors as qr-codes, did it get somewhere ?
Also, watchdog kicks in a few seconds after, complaining about hard
lock on (at least) one core, and scrolling even more. I suspect both
cores are hard locked, and have so far no idea what I did wrong:
- each acquire is followed by a release, with no code path around it
- gpio_device.can_sleep is true (as was the case before my patch)

...would I have somehow poked at another bug ?

Regards,
-- 
Vincent Pelletier
