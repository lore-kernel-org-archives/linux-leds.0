From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 06/10] Documentation: leds: Add description of brightness
 setting API
Date: Sun, 18 Oct 2015 09:08:43 +0200
Message-ID: <5623457B.8020208@gmail.com>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com> <1444209048-29415-7-git-send-email-j.anaszewski@samsung.com> <20151016153629.GM26916@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:38481 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796AbbJRHIu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 18 Oct 2015 03:08:50 -0400
In-Reply-To: <20151016153629.GM26916@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch

Hi Sakari,

Thanks for the review.

On 10/16/2015 05:36 PM, Sakari Ailus wrote:
> Hi Jacek,
>
> On Wed, Oct 07, 2015 at 11:10:44AM +0200, Jacek Anaszewski wrote:
>> This patch adds description of the LED subsystem API for
>> setting an LED brightness.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> ---
>>   Documentation/leds/leds-class.txt |   13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
>> index 62261c0..d406d98 100644
>> --- a/Documentation/leds/leds-class.txt
>> +++ b/Documentation/leds/leds-class.txt
>> @@ -52,6 +52,19 @@ above leaves scope for further attributes should they be needed. If sections
>>   of the name don't apply, just leave that section blank.
>>
>>
>> +Brightness setting API
>> +======================
>> +
>> +LED subsystem core exposes following API for setting brightness:
>> +
>> +    - led_set_brightness : it is guaranteed not to sleep, passing LED_OFF stops
>> +		blinking,
>> +    - led_set_brightness_sync : for use cases when immediate effect is desired -
>
> Over 80 characters per line.

There are exactly 80 characters, checkpatch.pl doesn't complain. You
probably counted patch line length, which includes leading '+'.

> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
>> +		it can block the caller for the time required for accessing
>> +		device registers and can sleep, passing LED_OFF stops hardware
>> +		blinking, returns -EBUSY if software blink fallback is enabled.
>> +
>> +
>>   Hardware accelerated blink of LEDs
>>   ==================================
>>
>

-- 
Best Regards,
Jacek Anaszewski
