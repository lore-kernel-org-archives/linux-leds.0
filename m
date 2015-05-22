From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH 19/20] leds: mark versatile driver with LED_BRIGHTNESS_FAST
 flag
Date: Fri, 22 May 2015 13:06:18 +0300
Message-ID: <555EFF9A.9090605@list.ru>
References: <555CA58A.10700@list.ru>	<555DF87A.8030108@list.ru> <CACRpkdbbgJzv+XVZ6O5kU4snRiaxK5ew-fS0JP4TzAq4v5RbKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp21.mail.ru ([94.100.179.250]:44243 "EHLO smtp21.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757059AbbEVKG2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 22 May 2015 06:06:28 -0400
In-Reply-To: <CACRpkdbbgJzv+XVZ6O5kU4snRiaxK5ew-fS0JP4TzAq4v5RbKg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <triad@df.lth.se>

22.05.2015 10:14, Linus Walleij =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Thu, May 21, 2015 at 5:23 PM, Stas Sergeev <stsp@list.ru> wrote:
>=20
>> This driver doesn't use sleeping operations in .brightness_set
>> method, and can be marked with LED_BRIGHTNESS_FAST flag.
>> That flag allows changing brightness at high rates (over 100Hz).
>>
>> CC: Bryan Wu <cooloney@gmail.com>
>> CC: Richard Purdie <rpurdie@rpsys.net>
>> CC: Jacek Anaszewski <j.anaszewski@samsung.com>
>> CC: linux-leds@vger.kernel.org
>> CC: linux-kernel@vger.kernel.org
>> CC: Linus Walleij <triad@df.lth.se>
>>
>> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
Thanks!

> Interesting that you're mailing my student account from 1997.
> Luckily, it still works.
=46or some reason, get_maintainer.pl script didn't give me
anything useful for most of the 20 files I modified. So
I simply took e-mails from copyright headings.
Script should be improved.
