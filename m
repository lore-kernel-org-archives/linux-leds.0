From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 26 Feb 2016 21:58:51 +0100
Message-ID: <56D0BC8B.6010205@gmail.com>
References: <56CF7C25.4060707@gmail.com> <56D022E4.5090105@samsung.com>
 <CAFSsGVvswc7eBsJ3k9WC+uO5eiKRATaD+v3h7wZhzEOtregSFw@mail.gmail.com>
 <56D02F35.4000008@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35488 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755209AbcBZU71 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 26 Feb 2016 15:59:27 -0500
Received: by mail-wm0-f65.google.com with SMTP id g62so11075676wme.2
        for <linux-leds@vger.kernel.org>; Fri, 26 Feb 2016 12:59:26 -0800 (PST)
In-Reply-To: <56D02F35.4000008@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Am 26.02.2016 um 11:55 schrieb Jacek Anaszewski:
> On 02/26/2016 11:20 AM, Heiner Kallweit wrote:
>> On Fri, Feb 26, 2016 at 11:03 AM, Jacek Anaszewski
>> <j.anaszewski@samsung.com> wrote:
>>> Hi Heiner,
>>>
>>> I don't see [PATCH v4 2/4]. Have you sent it?
>>>
>> Patch 2 of series wasn't changed since v3. Therefore I didn't resend it.
>> Do you prefer to always get the full series even if particular patches
>> weren't changed?
> 
> You set the total number of patches in the patch set to 4,
> so not having one of the patches in the middle looks odd.
> Yes, for better readability and consistency I prefer to include
> all patches to the set even if there are no difference in
> comparison to the previous version.
> 
> Of course, if only one of e.g. five patches is to be modified
> then sending the only one suffices, let's just use common sense.
> 
> Note, that I don't expect that you sent the missing one now.
> 
OK, thanks for explaining.
During further testing I figured out that there is a need to send a v4
of patch 2. I was wrong in how the printf format string is interpreted.
To display 6 digits I need to set precision instead of width.

>>> On 02/25/2016 11:11 PM, Heiner Kallweit wrote:
>>>>
>>>> Add generic support for RGB Color LED's.
>>>>
>>>> Basic idea is to use enum led_brightness also for the hue and saturation
>>>> color components.This allows to implement the color extension w/o
>>>> changes to struct led_classdev.
>>>>
>>>> Select LEDS_RGB to enable building drivers using the RGB extension.
>>>>
>>>> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
>>>> should be overridden even if the provided values are zero.
>>>>
>>>> Some examples for writing values to /sys/class/leds/<xx>/brightness:
>>>> (now also hex notation can be used)
>>>>
>>>> 255 -> set full brightness and keep existing color if set
>>>> 0 -> switch LED off but keep existing color so that it can be restored
>>>>        if the LED is switched on again later
>>>> 0x1000000 -> switch LED off and set also hue and saturation to 0
>>>> 0x00ffff -> set full brightness, full saturation and set hue to 0 (red)
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> 
> 
