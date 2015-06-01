From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Mon, 01 Jun 2015 17:37:35 +0300
Message-ID: <556C6E2F.7050100@list.ru>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru> <556C1855.7070903@samsung.com> <556C4851.7060900@list.ru> <556C69EA.10000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp37.i.mail.ru ([94.100.177.97]:48327 "EHLO smtp37.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751507AbbFAOhv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 1 Jun 2015 10:37:51 -0400
In-Reply-To: <556C69EA.10000@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>

01.06.2015 17:19, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> In fact, the things are more complicated: some drivers do small
>> udelay()'s but do not use a work-queue. I was not marking them as
>> FAST, although perhaps they could still be marked as SYNC?
> This could be handled by adding a property to struct led_classdev
> for defining minimum acceptable delay. Then FAST flag should not
> be needed.
Oh c'mon, that's too difficult!
Lets just have a flag whether we can do an SW PWM from hrtimer irq call=
back.
If we can't do from irq callback - simply do not do anything below 10mS=
=2E
IMHO a simple and practical solution.
Otherwise we'll not have anything implemented at all I guess.
