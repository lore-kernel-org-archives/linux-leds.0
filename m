From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Wed, 21 Dec 2016 21:33:37 +0100
Message-ID: <7e33c395-347d-f480-e8e9-d3b50a25e063@gmail.com>
References: <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de> <20161216101405.GA29069@amd>
 <20161216105648.GT13946@wotan.suse.de> <20161216112700.GB29069@amd>
 <20161216161017.GU13946@wotan.suse.de> <20161216161455.GV13946@wotan.suse.de>
 <7292444e-43d8-3561-2835-34b75a650107@gmail.com> <20161219200835.GA7135@amd>
 <1e47fd1d-53e0-75c7-0c25-42f4c6ccd818@gmail.com> <20161221184902.GA21636@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:36282 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753819AbcLUUeb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Dec 2016 15:34:31 -0500
In-Reply-To: <20161221184902.GA21636@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Milo Kim <woogyom.kim@gmail.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.orga

Hi,

On 12/21/2016 07:49 PM, Pavel Machek wrote:
> Hi!
> 
>>>>> Milo if sysfs is used can't the old userspace be mapped to use the new
>>>>> sysfs interface through a wrapper of some sort ? What exactly would be
>>>>> needed to ensure old userspace will not break?
>>>>
>>>> LP5521 and LP5523 have two ways to load hex code from the userspace - the
>>>> sysfs and firmware I/F. So user program supports both interfaces. Even if
>>>> the firmware I/F is not available, user can still run LED effect through the
>>>> sysfs.
>>>>
>>>> However, LP5562 and LP8501 support only single way which is the firmware
>>>> I/F. So user-space program for LP5562/8501 should be modified if lp55xx
>>>> removes the interface. My idea is
>>>
>>> Actually... it would be good to have some reasonable interface for RGB
>>> LEDs. This way, we need separate "firmware" for each LED
>>> controller. It would be good to have common format for LED effects.
>>
>> We still haven't tried trigger approach discussed over half a year ago.
>> If we used firmware approach we would still have to overcome the problem
>> of defining the LED class drivers affected by the firmware program.
> 
> The firmware approach is in the tree today :-(.

to RGB LEDs? What exactly do you have on mind?

> 
>>>> Device manufactures in Asia & North America requested lp55xx drivers, but I
>>>> don't know how many vendors uses the firmware I/F. Some vendors embeds the
>>>> binary code inside the driver instead of using user-program.
>>>
>>> Nokia N900 uses lp55xx, and I have custom scripts interfacing sysfs.
>>>
>>> Maemo uses the LEDs, too, but maemo is not open source.
>>>
>>> So no, I don't think there's anything important that could be broken.
>>
>> We can't guarantee that. Is there any problem in just using the
>> currently introduced DECLARE_FW_CUSTOM_FALLBACK() in
>> drivers/leds/leds-lp55xx-common.c?
> 
> Well, it would be good to get rid of the custom fallback
> functionality. And no, we don't need to "guarantee" that.  Removing
> obscure functionality noone uses is far game... providing noone
> complains ;-).

As Milo explained:

> Why has no one cried
> after the v4.0 custom fallback mechanism breaking ?

"Well, I don't know the reason exactly but my guess is they maybe still
using old kernel."

and after that:

"Device manufactures in Asia & North America requested lp55xx drivers"

These should be sufficient arguments for us for keeping the API
unchanged. If the users decided to upgrade their kernel then they
would be surprised by the API change.

DECLARE_FW_CUSTOM_FALLBACK macro seems to have been designed for
handling exactly this type of cases.

-- 
Best regards,
Jacek Anaszewski
