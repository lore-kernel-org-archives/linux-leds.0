From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v5 01/57] leds: Add brightness_set_nonblocking op
Date: Wed, 19 Aug 2015 16:03:19 +0200
Message-ID: <55D48CA7.1030504@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
 <1439285890-27329-2-git-send-email-j.anaszewski@samsung.com>
 <20150813141547.GB32484@lunn.ch> <55CD9F7F.4020706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51156 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752614AbbHSODY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 10:03:24 -0400
In-reply-to: <55CD9F7F.4020706@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>

On 08/14/2015 09:57 AM, Jacek Anaszewski wrote:
> H Andrew,
>
> On 08/13/2015 04:15 PM, Andrew Lunn wrote:
>> On Tue, Aug 11, 2015 at 11:37:14AM +0200, Jacek Anaszewski wrote:
>>> This patch adds a new brightness_set_nonblocking op to the LED
>>> subsystem.
>>> The op is intended for drivers that set brightness in a non-blocking
>>> way,
>>> i.e. they neither sleep nor use delays while setting brightness.
>>>
>>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>>> Cc: Bryan Wu <cooloney@gmail.com>
>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Cc: Pavel Machek <pavel@ucw.cz>
>>> Cc: Stas Sergeev <stsp@users.sourceforge.net>
>>> ---
>>>   include/linux/leds.h |    3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>> index b122eea..c32f1b8 100644
>>> --- a/include/linux/leds.h
>>> +++ b/include/linux/leds.h
>>> @@ -53,6 +53,9 @@ struct led_classdev {
>>>       /* Must not sleep, use a workqueue if needed */
>>>       void        (*brightness_set)(struct led_classdev *led_cdev,
>>>                         enum led_brightness brightness);
>>> +    /* Intended for drivers that set brightness in a non-blocking
>>> way */
>>> +    void (*brightness_set_nonblocking)(struct led_classdev *led_cdev,
>>> +                      enum led_brightness brightness);
>>
>> Hi Jacek
>>
>>> From an API design point of view, i'm not sure this is the best way to
>> go. You now have two calls which do the same thing, with the plan that
>> you want to invert the meaning of brightness_set, the old well known
>> API call, sometime later. This inverting the meaning is going to catch
>> people out and introduce bugs.
>>
>> I would rather add a brightness_set_blocking op. Then as you go
>> thought the drivers stripping out the work queue, move the driver to
>> use this brightness_set_blocking.
>
> There are around 60 drivers in the other kernel subsystems that register
> LED class devices. If we chose the way you proposed then we would have
> to adjust all of them to the LED core changes, which could complicate
> the situation during merge window if there were other modifications in
> the affected drivers.
>
> With my approach all old-fashion drivers will be treated by the
> LED core in the old-fashion way. This is why I introduced
> LED_BRIGHTNESS_BLOCKING flag - only drivers aware of the LED core
> changes will set it, which will allow for the LED core to find out
> which drivers are aware of brightness_set semantics change and
> implement the op accordingly.
>
> This way the change of brightness_set semantics will not be painful.
>
> After all drivers across all subsystems are adapted to the LED core
> changes the flag will be made redundant and we will remove it.
>

Hi Andrew, Pavel and others,

Do you have any comments to my explanation? It would be great if
we could merge this during upcoming merge window, but I'd like to
obtain some acks for the LED core part beforehand.

-- 
Best Regards,
Jacek Anaszewski
