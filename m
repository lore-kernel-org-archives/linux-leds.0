From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH] leds: fix brightness changing when software blinking
 is active
Date: Thu, 14 May 2015 12:45:16 +0300
Message-ID: <55546EAC.70408@list.ru>
References: <55535DA4.2010509@list.ru> <55546084.9050704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp36.i.mail.ru ([94.100.177.96]:36584 "EHLO smtp36.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752642AbbENJpW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 14 May 2015 05:45:22 -0400
In-Reply-To: <55546084.9050704@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>

14.05.2015 11:44, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>=20
>>       if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>           led_cdev->delayed_set_value =3D brightness;
>> -        schedule_work(&led_cdev->set_brightness_work);
>=20
> This line is still required. Please refer to the patch d23a22a74.
But I really want to get rid of this line and
vacate the work-queue, so that in the future the
per-driver work-queues can be replaced with this.

Why do you think it is still needed?
Are there any valid cases where you need to disable the
soft-blink from hard-irq context? IMHO the soft-blink is
only disabled as a result of user's actions, which is not
in a hard-irq context.
Could you please explain the use-case?

>>       /* Stop blinking */
>> +    led_stop_software_blink(led_cdev);
> This won't be needed.
Indeed, but with these changes there should be no requirement
for disabling a soft-blink from hard-irq context, which is what
I really wanted to have. What am I missing?
