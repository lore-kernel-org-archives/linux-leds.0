From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: lp3944: improve wording and formatting in a comment
Date: Thu, 28 Jan 2016 08:35:50 +0100
Message-ID: <56A9C4D6.5000505@samsung.com>
References: <1453905098-7020-1-git-send-email-ao2@ao2.it>
 <56A8DA95.7090803@samsung.com> <20160127173144.8e31965802c4880ece34747b@ao2.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20403 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751988AbcA1Hfy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 28 Jan 2016 02:35:54 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1N00DQUJRSMN00@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 28 Jan 2016 07:35:52 +0000 (GMT)
In-reply-to: <20160127173144.8e31965802c4880ece34747b@ao2.it>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Antonio Ospite <ao2@ao2.it>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

On 01/27/2016 05:31 PM, Antonio Ospite wrote:
> On Wed, 27 Jan 2016 15:56:21 +0100
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> Hi Antonio,
>>
>> Thanks for the patch.
>>
>> On 01/27/2016 03:31 PM, Antonio Ospite wrote:
>>> Improve the wording for the comment about the led status, and while at
>>> it also use the standard formatting for multi-line comments.
>>>
>>> Signed-off-by: Antonio Ospite <ao2@ao2.it>
>>> Cc: Richard Purdie <rpurdie@rpsys.net>
>>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>>> ---
>>>    drivers/leds/leds-lp3944.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
>>> index 6c758ae..793838e 100644
>>> --- a/drivers/leds/leds-lp3944.c
>>> +++ b/drivers/leds/leds-lp3944.c
>>> @@ -199,8 +199,10 @@ static int lp3944_led_set(struct lp3944_led_data *led, u8 status)
>>>    	if (status > LP3944_LED_STATUS_DIM1)
>>>    		return -EINVAL;
>>>
>>> -	/* invert only 0 and 1, leave unchanged the other values,
>>> -	 * remember we are abusing status to set blink patterns
>>> +	/*
>>> +	 * Invert status only if it is < 2 (i.e. 0 or 1), leave it unchanged
>>> +	 * otherwise because we are abusing the status to set blink patterns
>>> +	 * too.
>>>    	 */
>>
>> The "too" at the end doesn't improve the comment. It adds some
>> incomplete information. Could you explain what does it mean that status
>> is abused to set blink patterns, please? And usually "too" means
>> "in addition to something", but here we don't know what we are referring
>> to.
>>
>
> Having both the words "abusing" and "too" in the same sentence can be
> confusing, indeed, I see your point.
>
> It could have been either:
>    "abusing the status to set blink patterns."
> or
>    "using the status to set blink patterns too."
>
> The point being that the lp3944_led_set() functions uses the status
> argument not only for the on/off state, but also as a mechanism to
> enable the hardware blinking functionality.
> So when status >= 2 we don't want to invert the status value.
>
> The inversion of the actual duty cycle for inverted LEDs is properly
> handled in lp3944_led_set_blink(), so it's unrelated to
> lp3944_led_set().

Thanks for the explanation.

>
> This is not great, I know, but it's an hack internal to the driver to
> reuse some code, it's not exposed to userspace.
>
> This was one of my first drivers, maybe I'd do things differently today.
>
> Anyhow, do you prefer a more explicit explanation like this one below?
>
> /*
>   * Invert status only when it's < 2 (i.e. 0 or 1) which means it's
>   * controlling the on/off state directly.
>   * When, instead, status is >= 2 don't invert it because it would mean
>   * to mess with the hardware blinking mode.
>   */

It's more informative now. Please modify the patch accordingly.

>>>    	if (led->type == LP3944_LED_TYPE_LED_INVERTED && status < 2)
>>>    		status = 1 - status; >
>>
>
> Thanks,
>     Antonio
>


-- 
Best Regards,
Jacek Anaszewski
