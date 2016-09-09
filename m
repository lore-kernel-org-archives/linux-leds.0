From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V5] leds: trigger: Introduce a USB port trigger
Date: Fri, 9 Sep 2016 11:52:37 +0200
Message-ID: <CACna6ryfxXs5GfHCsss1FarfjeeWfJ9SjQJgPx0V0qEmUgP7dw@mail.gmail.com>
References: <20160908160904.31719-1-zajec5@gmail.com> <20160909093440.GF15637@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33685 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbcIIJwi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Sep 2016 05:52:38 -0400
In-Reply-To: <20160909093440.GF15637@b29397-desktop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Pavel Machek <pavel@ucw.cz>, Stephan Linz <linz@li-pro.net>, Boris Brezillon <boris.brezillon@free-electrons.com>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On 9 September 2016 at 11:34, Peter Chen <hzpeterchen@gmail.com> wrote:
> On Thu, Sep 08, 2016 at 06:08:24PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> This commit adds a new trigger responsible for turning on LED when USB
>> device gets connected to the selected USB port. This can can useful for
>> various home routers that have USB port(s) and a proper LED telling user
>> a device is connected.
>>
>> The trigger gets its documentation file but basically it just requires
>> enabling it and selecting USB ports (e.g. echo 1 > ports/usb1-1).
>>
>> There was a long discussion on design of this driver. Its current state
>> is a result of picking them most adjustable solution as others couldn't
>> handle all cases.
>>
>> 1) It wasn't possible for the driver to register separated trigger for
>>    each USB port. Some physical USB ports are handled by more than one
>>    controller and so by more than one USB port. E.g. USB 2.0 physical
>>    port may be handled by OHCI's port and EHCI's port.
>>    It's also not possible to assign more than 1 trigger to a single LED
>>    and implementing such feature would be tricky due to syncing triggers
>>    and sysfs conflicts with old triggers.
>>
>> 2) Another idea was to register trigger per USB hub. This wouldn't allow
>>    handling devices with multiple USB LEDs and controllers (hubs)
>>    controlling more than 1 physical port. It's common for hubs to have
>>    few ports and each may have its own LED.
>>
>> This final trigger is highly flexible. It allows selecting any USB ports
>> for any LED. It was also modified (compared to the initial version) to
>> allow choosing ports rather than having user /guess/ proper names. It
>> was successfully tested on SmartRG SR400ac which has 3 USB LEDs,
>> 2 physical ports and 3 controllers.
>>
>> Another planned feature is support for LED reacting to the USB activity.
>> This can be implemented with another sysfs file for setting mode. The
>> default mode wouldn't change so there won't be ABI breakage and such
>> feature can be safely implemented later.
>>
>
> It has such driver at: drivers/usb/common/led.c

Oh, great, I had no idea about that. So if it comes to adding activity
support, we'll have to well discuss that. We may e.g. not implement
that or move existing feature into more generic usbport trigger or
partially duplicate this feature.

Anyway, I hope this note on "usb-gadget" and "usb-host" triggers won't
stop our work on "usbport". This driver implements different thing for
now (discovering device in a USB port) and I don't think "usb-gadget"
/ "usb-host" could be extended to handle such cases.

Thanks for a hint though, I'll definitely keep that in mind during
further development!

--=20
Rafa=C5=82
