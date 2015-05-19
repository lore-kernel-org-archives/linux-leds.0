From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: put hard limit on minimum blink period for slow leds
Date: Tue, 19 May 2015 08:35:35 +0200
Message-ID: <555AD9B7.1000803@samsung.com>
References: <55562329.9070604@list.ru> <5559A29D.5010204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11914 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753310AbbESGfj (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 May 2015 02:35:39 -0400
In-reply-to: <5559A29D.5010204@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Michael Hennerich <michael.hennerich@analog.com>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Support Opensource <support.opensource@diasemi.com>, Milo Kim <milo.kim@ti.com>, Riku Voipio <riku.voipio@iki.fi>, Kyungmin Park <kyungmin.park@samsung.com>, patches@opensource.wolfsonmicro.com

On 05/18/2015 10:28 AM, Jacek Anaszewski wrote:
> Hi Stas,
>
> On 05/15/2015 06:47 PM, Stas Sergeev wrote:
>>
>> Currently the timer trigger allows to set blink period as small as
>> 1mS. But in fact the minimum period is jiffy, which is usually 10mS.
>> The following mail says:
>> http://lkml.iu.edu/hypermail/linux/kernel/1504.3/03469.html
>> ---
>
> Text after '---' characters is not added to the commit message.
> Please use different characters for this and check how your patch
> looks in git log after applying it locally.
>
>> As I mentioned before even with hr timer it wouldn't be possible
>> to assure that 1ms is achievable due to locking and bus latency
>> reasons.
>> ---
>> So the limit of 10mS should be enforced for drivers that use
>> waiting operations, like transfers across slow bus.
>> This allows to stay on safe side when CONFIG_HZ is set to eg 1000.
>>
>> This patch differentiates the "slow" drivers by marking them with
>> the new LED_BRIGHTNESS_SLOW flag. Currently every driver that uses
>> a work-queue in .brightness_set op, is marked as such.
>> The extra bonus is the possibility of a further development
>> aiming for software PWM for "fast" drivers.

[...]

>> +#define LED_BRIGHTNESS_SLOW    (1 << 24)

I think we'd better add LED_BRIGHTNESS_FAST flag instead.
Then the drivers not using work queue will have to be updated.
It will also indicate what drivers are intended to be the actual
beneficiary of the modification.

-- 
Best Regards,
Jacek Anaszewski
