From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2] leds: fix brightness changing when software blinking
 is active
Date: Tue, 23 Jun 2015 19:59:27 +0300
Message-ID: <5589906F.4070901@list.ru>
References: <5554BE12.7050209@list.ru> <20150502145957.GB8156@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp24.mail.ru ([94.100.181.179]:51958 "EHLO smtp24.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932823AbbFWQ7f (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 23 Jun 2015 12:59:35 -0400
In-Reply-To: <20150502145957.GB8156@xo-6d-61-c0.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>

02.05.2015 17:59, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Thu 2015-05-14 18:24:02, Stas Sergeev wrote:
>>
>> The following sequence:
>> echo timer >/sys/class/leds/<name>/trigger
>> echo 1 >/sys/class/leds/<name>/brightness
>> should change the ON brightness for blinking.
>> The function led_set_brightness() was mistakenly initiating the
>> delayed blink stop procedure, which resulted in no blinking with
>> the timer trigger still active.
>>
>> This patch fixes the problem by changing led_set_brightness()
>> to not initiate the delayed blink stop when brightness is not 0.
>=20
> Could we get this part of API documented? It is quite non-obvious... =
0 clears the trigger,
> other values do not, I thought it is a bug when I saw it...
I guess the thinking was that if ON brightness differs
from OFF brightness, you should not clear the trigger.
But if you put ON brightness similar to OFF brightness,
then you can as well stop blinking at all.
Not that I am amused by that kind of logic though.
