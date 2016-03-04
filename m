From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 4 Mar 2016 21:55:24 +0100
Message-ID: <56D9F63C.5030608@gmail.com>
References: <20160303234646.GA17641@dtor-ws>
 <1457080729.18482.6.camel@gmail.com> <56D957A0.7070300@samsung.com>
 <20160304191322.GA17145@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:33430 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759987AbcCDUzu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 15:55:50 -0500
In-Reply-To: <20160304191322.GA17145@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Evan McClain <aeroevan@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Olof Johansson <olofj@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On 03/04/2016 08:13 PM, Dmitry Torokhov wrote:
> On Fri, Mar 04, 2016 at 10:38:40AM +0100, Jacek Anaszewski wrote:
>> Hi Evan,
>>
>> On 03/04/2016 09:38 AM, Evan McClain wrote:
>>> On Thu, 2016-03-03 at 15:46 -0800, Dmitry Torokhov wrote:
>>>> From: Simon Que <sque@chromium.org>
>>>>
>>>> This is a driver for ACPI-based keyboard backlight LEDs found on
>>>> Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
>>>> backlight as "chromeos::kbd_backlight" LED class device in sysfs.
>>>
>>> Was it ever decided where this driver should live? I was planning on
>>> submitting to platform/chrome since most keyboard backlights seem to
>>> live over there but I don't think I got a response.
>>>
>>
>> It hasn't been decided yet. I can take it, but could you submit one more
>> version, without
>>
>> 'owner	= THIS_MODULE' in struct platform_driver keyboard_led_driver ?
>>
>> It is redundant, because the core will do it.
>>
>> Also the line with devm_kzalloc has over 80 characters.
>
> Also:
>
> - preferably use sizeof(*cdev) instead of sizeof(struct ...)
> - do not check cdev->flags & LED_SUSPENDED in
>    keyboard_led_set_brightness() as it is not going to be called when led
>    device is suspended anyway
> - change the MODULE_LICENSE from "GPL v2" to "GPL" as to match the

I can see "either version 2 of the License" in the license notice.

>    actual license notice
> - report ACPI errors in error messages (since we clobber them)
> - preferably use ENXIO instead of ENODEV
> - maybe add "depends on CHROME_PLATFORMS || COMPILE_TEST" so that we do
>    not prompt for it on non-Chrome platforms

I agree with the remaining items.

-- 
Best Regards,
Jacek Anaszewski
