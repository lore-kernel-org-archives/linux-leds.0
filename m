From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 28 Apr 2015 01:23:07 +0300
Message-ID: <553EB6CB.6070104@list.ru>
References: <553E6CF5.4030601@list.ru> <20150427205441.GB1301@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp8.mail.ru ([94.100.181.96]:58760 "EHLO smtp8.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965187AbbD0WXi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 27 Apr 2015 18:23:38 -0400
In-Reply-To: <20150427205441.GB1301@xo-6d-61-c0.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

27.04.2015 23:54, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi!
>
>> The following patches improve the precision of led
>> timer trigger and add the delay unit control.
>> That allows to make PWM brightness control with timer
>> trigger.
> Are you sure that is good idea? Doing LED pwm with main cpu is quite =
harsh...
>
> We already have "brightness" for... well... brightness level.
Btw, your concern can also be addressed in a simple way:
just remove the "brightness" attribute in "timer" mode if the
HW does not support brightness. In some modes you still
need brightness to write either 0 or 255, but in timer mode
it seems absolutely redundant without a HW implementation.
I'd like to create the patch to conditionally disable the
brightness attr in "timer" mode, but I wonder if the change
will have the unexpected compatibility problems...
