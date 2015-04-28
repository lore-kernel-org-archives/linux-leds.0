From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 28 Apr 2015 13:12:15 +0300
Message-ID: <553F5CFF.9090601@list.ru>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp34.i.mail.ru ([94.100.177.94]:53480 "EHLO smtp34.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933106AbbD1KMb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 28 Apr 2015 06:12:31 -0400
In-Reply-To: <553F4B60.20204@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

28.04.2015 11:57, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Stas,
>=20
> Have you tested it?
Of course I did.
Works with gpio driver and provides up to 10usec precision on
armada-xp board.
This is 1000 times better than without my patch - the precision
was 10ms (jiffy).

> I tried it with Samsung M0 board and
> my leds-aat1290 driver. It didn't work well. And for small delay
> intervals it will not have a chance to work reliably with all drivers=
,
> especially the ones which use mutex in their brightness_set op,
> since mutex can sleep.
OK, I can remove the nsec resolution.
I added it for the future, it doesn't work for me either, but
hrtimer has an API for it, so I thought it may work on another hw.
I don't see why it can't stay, but if it bothers you that much,
I'll remove it.

> I am afraid that we have to stay with what we have currently.
This is a counter-productive conclusion.
My patch does 1000 times precision improvement with gpio driver.
If you only want nsec to be removed as it doesn't work - that's
fine with me.
