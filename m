From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 4/4] leds: core: add support for RGB LED's
Date: Wed, 30 Mar 2016 10:00:07 +0200
Message-ID: <56FB8787.7090808@samsung.com>
References: <56D60B4C.5000506@gmail.com> <20160329100535.GC24964@amd>
 <56FAE8CD.1010804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31610 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753031AbcC3IAL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 30 Mar 2016 04:00:11 -0400
In-reply-to: <56FAE8CD.1010804@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/29/2016 10:42 PM, Heiner Kallweit wrote:
> Am 29.03.2016 um 12:05 schrieb Pavel Machek:
>> On Tue 2016-03-01 22:36:12, Heiner Kallweit wrote:
>>> Export a function to convert HSV color values to RGB.
>>> It's intended to be called by drivers for RGB LEDs.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>> v2:
>>> - move hsv -> rgb conversion to separate file
>>> - remove flag LED_DEV_CAP_RGB
>>> v3:
>>> - call led_hsv_to_rgb only if LED_DEV_CAP_HSV is set
>>>    This is needed in cases when we have monochrome and color LEDs
>>>    as well in a system.
>>> v4:
>>> - Export led_hsv_to_rgb and let the device driver call it instead
>>>    of doing the conversion in the core
>>> v5:
>>> - don't ignore led_cdev->brightness_get silently if LED_DEV_CAP_RGB
>>>    is set but warn
>>> ---
>>>   drivers/leds/led-class.c    |  7 +++++++
>>>   drivers/leds/led-rgb-core.c | 36 ++++++++++++++++++++++++++++++++++++
>>>   include/linux/leds.h        |  8 ++++++++
>>>   3 files changed, 51 insertions(+)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 8a3748a..a4b144e 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -193,6 +193,13 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>>>   	char name[64];
>>>   	int ret;
>>>
>>> +	/*
>>> +	 * for now reading back the color is not supported as multiple
>>> +	 * HSV -> RGB -> HSV conversions may distort the color due to
>>> +	 * rounding issues in the conversion algorithm
>>> +	 */
>>> +	WARN_ON(led_cdev->flags & LED_DEV_CAP_RGB && led_cdev->brightness_get);
>>> +
>>
>> Backtrace is useless here, you may want to add some ()s and you don't
>> really want user to be causing messages in syslog this easily.
>>
> I agree that the backtrace doesn't provide a benefit here.

I requested it to provide a verbose notification for a LED RGB class
driver developer, in case they try to implement a brightness_get
op, which would be harmful in case of HSV interface for RGB LEDs.

> However I don't see how a user could create syslog entries.
> The warn condition can be true only for drivers implementing the RGB extension
> in a not supported way (by setting flag LED_DEV_CAP_RGB and implementing
> brightness_get).
>
> 									Pavel
>>
>
>
>


-- 
Best regards,
Jacek Anaszewski
