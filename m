From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 1/4] leds: core: add generic support for RGB Color LED's
Date: Fri, 26 Feb 2016 11:55:49 +0100
Message-ID: <56D02F35.4000008@samsung.com>
References: <56CF7C25.4060707@gmail.com> <56D022E4.5090105@samsung.com>
 <CAFSsGVvswc7eBsJ3k9WC+uO5eiKRATaD+v3h7wZhzEOtregSFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:63198 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754023AbcBZKzy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 26 Feb 2016 05:55:54 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O3500HZNID37450@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 26 Feb 2016 10:55:51 +0000 (GMT)
In-reply-to: <CAFSsGVvswc7eBsJ3k9WC+uO5eiKRATaD+v3h7wZhzEOtregSFw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 02/26/2016 11:20 AM, Heiner Kallweit wrote:
> On Fri, Feb 26, 2016 at 11:03 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Hi Heiner,
>>
>> I don't see [PATCH v4 2/4]. Have you sent it?
>>
> Patch 2 of series wasn't changed since v3. Therefore I didn't resend it.
> Do you prefer to always get the full series even if particular patches
> weren't changed?

You set the total number of patches in the patch set to 4,
so not having one of the patches in the middle looks odd.
Yes, for better readability and consistency I prefer to include
all patches to the set even if there are no difference in
comparison to the previous version.

Of course, if only one of e.g. five patches is to be modified
then sending the only one suffices, let's just use common sense.

Note, that I don't expect that you sent the missing one now.

>> On 02/25/2016 11:11 PM, Heiner Kallweit wrote:
>>>
>>> Add generic support for RGB Color LED's.
>>>
>>> Basic idea is to use enum led_brightness also for the hue and saturation
>>> color components.This allows to implement the color extension w/o
>>> changes to struct led_classdev.
>>>
>>> Select LEDS_RGB to enable building drivers using the RGB extension.
>>>
>>> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
>>> should be overridden even if the provided values are zero.
>>>
>>> Some examples for writing values to /sys/class/leds/<xx>/brightness:
>>> (now also hex notation can be used)
>>>
>>> 255 -> set full brightness and keep existing color if set
>>> 0 -> switch LED off but keep existing color so that it can be restored
>>>        if the LED is switched on again later
>>> 0x1000000 -> switch LED off and set also hue and saturation to 0
>>> 0x00ffff -> set full brightness, full saturation and set hue to 0 (red)
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>



-- 
Best regards,
Jacek Anaszewski
