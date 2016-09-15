From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH V5] leds: trigger: Introduce a USB port trigger
Date: Thu, 15 Sep 2016 16:54:39 +0200
Message-ID: <2d537b69-0d46-6eaf-9451-375a7d898f9e@samsung.com>
References: <20160908160904.31719-1-zajec5@gmail.com>
 <20160909093440.GF15637@b29397-desktop> <20160909110509.GB6356@kroah.com>
 <CACna6rxeFqDEH1tnmfS2OhS1eQQt_80Ys_3KhH8YS2OmgbbEGA@mail.gmail.com>
 <20160915125629.GH13132@amd>
 <CGME20160915133322eucas1p1033af4403ce3eb51925bb9367507a6a8@eucas1p1.samsung.com>
 <CACna6rwU_55+xi3ZtZRAaxiCeBmZGSfMZcMtuRdbj-wV_vj+Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19176 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752924AbcIOOyr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2016 10:54:47 -0400
In-reply-to: <CACna6rwU_55+xi3ZtZRAaxiCeBmZGSfMZcMtuRdbj-wV_vj+Lg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Stephan Linz <linz@li-pro.net>, Boris Brezillon <boris.brezillon@free-electrons.com>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On 09/15/2016 03:33 PM, Rafał Miłecki wrote:
> On 15 September 2016 at 14:56, Pavel Machek <pavel@ucw.cz> wrote:
>> On Fri 2016-09-09 13:31:10, Rafał Miłecki wrote:
>>> On 9 September 2016 at 13:05, Greg KH <gregkh@linuxfoundation.org> wrote:
>>>> On Fri, Sep 09, 2016 at 05:34:40PM +0800, Peter Chen wrote:
>>>>> On Thu, Sep 08, 2016 at 06:08:24PM +0200, Rafał Miłecki wrote:
>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>
>>>>>> This commit adds a new trigger responsible for turning on LED when USB
>>>>>> device gets connected to the selected USB port. This can can useful for
>>>>>> various home routers that have USB port(s) and a proper LED telling user
>>>>>> a device is connected.
>>>>>>
>>>>>> The trigger gets its documentation file but basically it just requires
>>>>>> enabling it and selecting USB ports (e.g. echo 1 > ports/usb1-1).
>>>>>>
>>>>>> There was a long discussion on design of this driver. Its current state
>>>>>> is a result of picking them most adjustable solution as others couldn't
>>>>>> handle all cases.
>>>>>>
>>>>>> 1) It wasn't possible for the driver to register separated trigger for
>>>>>>    each USB port. Some physical USB ports are handled by more than one
>>>>>>    controller and so by more than one USB port. E.g. USB 2.0 physical
>>>>>>    port may be handled by OHCI's port and EHCI's port.
>>>>>>    It's also not possible to assign more than 1 trigger to a single LED
>>>>>>    and implementing such feature would be tricky due to syncing triggers
>>>>>>    and sysfs conflicts with old triggers.
>>>>>>
>>>>>> 2) Another idea was to register trigger per USB hub. This wouldn't allow
>>>>>>    handling devices with multiple USB LEDs and controllers (hubs)
>>>>>>    controlling more than 1 physical port. It's common for hubs to have
>>>>>>    few ports and each may have its own LED.
>>>>>>
>>>>>> This final trigger is highly flexible. It allows selecting any USB ports
>>>>>> for any LED. It was also modified (compared to the initial version) to
>>>>>> allow choosing ports rather than having user /guess/ proper names. It
>>>>>> was successfully tested on SmartRG SR400ac which has 3 USB LEDs,
>>>>>> 2 physical ports and 3 controllers.
>>>>>>
>>>>>> Another planned feature is support for LED reacting to the USB activity.
>>>>>> This can be implemented with another sysfs file for setting mode. The
>>>>>> default mode wouldn't change so there won't be ABI breakage and such
>>>>>> feature can be safely implemented later.
>>>>>>
>>>>>
>>>>> It has such driver at: drivers/usb/common/led.c
>>>>
>>>> Ugh, I thought I had seen something like this before...
>>>>
>>>> Rafał, can you just use this in-kernel code instead?
>>>
>>> I really don't think I can because of all the reasons I carefully
>>> listed in the commit message.
>>>
>>> Have you took a look at that simple driver? It does nothing I need.
>>> Its design doesn't allow implementing features I clearly listed in the
>>> commit message.
>>
>> In any case, the new driver should probably go near the old one, at
>> the very least.
>
> I can do that. Anyone objects?
>

It's OK with me.

-- 
Best regards,
Jacek Anaszewski
