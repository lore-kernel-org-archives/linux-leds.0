From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2] leds: fix brightness changing when software blinking
 is active
Date: Fri, 15 May 2015 17:11:41 +0300
Message-ID: <5555FE9D.20103@list.ru>
References: <5554BE12.7050209@list.ru> <5555AA7F.1000001@samsung.com> <5555FDFF.5060402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp39.i.mail.ru ([94.100.177.99]:52458 "EHLO smtp39.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422669AbbEOOLu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 15 May 2015 10:11:50 -0400
In-Reply-To: <5555FDFF.5060402@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>

15.05.2015 17:09, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 05/15/2015 10:12 AM, Jacek Anaszewski wrote:
>> Hi Stas,
>>
>> On 05/14/2015 05:24 PM, Stas Sergeev wrote:
>>>
>>> The following sequence:
>>> echo timer >/sys/class/leds/<name>/trigger
>>> echo 1 >/sys/class/leds/<name>/brightness
>>> should change the ON brightness for blinking.
>>> The function led_set_brightness() was mistakenly initiating the
>>> delayed blink stop procedure, which resulted in no blinking with
>>> the timer trigger still active.
>>>
>>> This patch fixes the problem by changing led_set_brightness()
>>> to not initiate the delayed blink stop when brightness is not 0.
>=20
> This commit message is not valid for this version of the patch.
Why do you think so?
---
-		schedule_work(&led_cdev->set_brightness_work);
+		if (brightness =3D=3D LED_OFF)
+			schedule_work(&led_cdev->set_brightness_work);
---

LED_OFF is a 0 define.
