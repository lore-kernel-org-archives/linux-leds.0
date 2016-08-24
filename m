From: Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 13:27:50 +0200
Message-ID: <6beb372b-cc66-0d7b-0111-19a1217f7833@suse.com>
References: <20160823220404.9887-1-zajec5@gmail.com>
 <fbec6ad5-d000-c370-73ed-1c6f57386732@suse.com>
 <CACna6rxz1xV7K__3w+8LM2QO47CC634K4t1iQXPjLADNi-8ObA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:43365 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751168AbcHXLuF (ORCPT
        <rfc822;groupwise-linux-leds@vger.kernel.org:0:0>);
        Wed, 24 Aug 2016 07:50:05 -0400
In-Reply-To: <CACna6rxz1xV7K__3w+8LM2QO47CC634K4t1iQXPjLADNi-8ObA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>



On 24/08/16 13:02, Rafał Miłecki wrote:
> On 24 August 2016 at 12:49, Matthias Brugger <mbrugger@suse.com> wrote:
>> On 24/08/16 00:03, Rafał Miłecki wrote:

[...]

>>> +static int usbport_trig_notify(struct notifier_block *nb, unsigned long
>>> action,
>>> +                              void *data)
>>> +{
>>> +       struct usbport_trig_data *usbport_data =
>>> +               container_of(nb, struct usbport_trig_data, nb);
>>> +       struct led_classdev *led_cdev = usbport_data->led_cdev;
>>> +
>>> +       switch (action) {
>>> +       case USB_DEVICE_ADD:
>>> +               if (usbport_trig_usb_dev_observed(usbport_data, data)) {
>>
>>
>> Maybe we should switch this and fist see if the usbport is observed before
>> evaluating the action. Also cast data to "struct usb_device *" to make that
>> clear.
>
> I'm aware there is one duplicated line of code, I did to first
> evaluate very quick test (checking unsigned long value), then iterate
> over ports & keep only 1 switch block. I could move
> usbport_trig_usb_dev_observed call up, but it would be executed for
> other actions as well (currently just USB_BUS_ADD and USB_BUS_REMOVE).
>

Ok. I'm a USB noop but from my understanding the notifier is only called 
when a device or a hub gets added/removed. So this shouldn't happen that 
much. Therefor it has no impact if we check if the usb device is in the 
observer list for all actions.

>
>>> +                       if (usbport_data->count++ == 0)
>>
>>
>> I'm a bit puzzled. I think:
>> if (++usbport_data->count > 0)
>> makes this more consistent with the remove case.
>
> Your condition would be always true (as we don't use negative
> numbers). The point is to enable LED only if it was disabled before.
> So I need to increase counter unconditionally but enable LED only if
> initial value (before increasing it) was 0.
>

Got it. My personal opinion is, that adding one line for 
incrementing/decrementing the counter would help to make this 
crystal-clear to everyone (at least to me :)

Cheers,
Matthias

>
>>> +module_init(usbport_trig_init);
>>> +module_exit(usbport_trig_exit);
>>> +
>>> +MODULE_AUTHOR("Rafał Miłecki <rafal@milecki@pl>");
>>
>>
>> Nit: rafal@milecki.pl
>
> Oops, thanks!
>
