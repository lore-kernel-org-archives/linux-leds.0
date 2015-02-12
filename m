From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash class
 extension
Date: Thu, 12 Feb 2015 11:10:38 +0100
Message-ID: <54DC7C1E.5020105@samsung.com>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd> <54DC671E.8010705@samsung.com>
 <20150212090756.GA30508@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:51198 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754892AbbBLKKm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 05:10:42 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJN00H8HLSFZ6A0@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 12 Feb 2015 10:14:39 +0000 (GMT)
In-reply-to: <20150212090756.GA30508@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

On 02/12/2015 10:07 AM, Pavel Machek wrote:
> Hi!
>
>> I can be 0 or 1. Let's make it more precise:
>>
>> - flash_strobe - flash strobe state (RW):
>> 			semantics on write:
>> 				0: turn the flash LED off
>> 				1: strobe the flash LED
>> 			semantics on read:
>> 				0: flash LED is off
>> 				1: flash LED is strobing
>
> Thanks.
>
>>>> +	- available_sync_leds - list of sub-LEDs available for flash strobe
>>>> +				synchronization (RO)
>>>
>>> "space separated"?
>>
>> - available_sync_leds - space separated list of sub-LEDs available for
>> 			flash strobe synchronization; each sub-LED is
>> 			described in the form of chunks:
>> 			[led_id: led_name]
>>
>>
>>> So this will say something like "0 3 5"
>>
>> Rather e.g.: [0: none] [1: max77693-led1] [2: max77693-led2]
>
> No no, sorry, you can't do that. Sysfs is supposed to be one value per
> file, and this is stretching it. (It would be also difficult to parse;
> for example, you can reasonably have ":" in led name, and perhaps even
> " " or "]"....

You acked LED Flash class patch, didn't you? :)

There are many attributes documented in the list fashion, e.g.:
available_frequencies in the Documentation/ABI/testing/sysfs-class-devfreq.

LED flash class attributes should be also probably added to the
Documentation/ABI/testing/sysfs-class-led, or a new file
sysfs-class-flash-led should be created.

If we changed this a bit it would be easily parsed with AWK:

echo "0 none;1 max77693-led1;2 max77693-led2" | awk -F';' '{ for (i=1; 
i<=NF; i++) print $i}' | awk '{print $1": "$2}'


-- 
Best Regards,
Jacek Anaszewski
