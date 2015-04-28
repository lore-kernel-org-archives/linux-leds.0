From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 28 Apr 2015 10:57:04 +0200
Message-ID: <553F4B60.20204@samsung.com>
References: <553E6CF5.4030601@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19566 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932657AbbD1I5K (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 04:57:10 -0400
In-reply-to: <553E6CF5.4030601@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

Hi Stas,

Have you tested it? I tried it with Samsung M0 board and
my leds-aat1290 driver. It didn't work well. And for small delay
intervals it will not have a chance to work reliably with all drivers,
especially the ones which use mutex in their brightness_set op,
since mutex can sleep.

I am afraid that we have to stay with what we have currently.

On 04/27/2015 07:08 PM, Stas Sergeev wrote:
> Hello.
>
> The following patches improve the precision of led
> timer trigger and add the delay unit control.
> That allows to make PWM brightness control with timer
> trigger.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>


-- 
Best Regards,
Jacek Anaszewski
