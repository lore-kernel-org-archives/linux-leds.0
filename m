From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Sat, 3 Sep 2016 17:06:59 +0200
Message-ID: <b41c3864-9986-b1a0-ea33-76f2ec91790b@gmail.com>
References: <Pine.LNX.4.44L0.1609021025470.2027-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1609021025470.2027-100000@iolanthe.rowland.org>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 09/02/2016 04:33 PM, Alan Stern wrote:
> On Fri, 2 Sep 2016, Jacek Anaszewski wrote:
>
>>>>> I'm pretty sure noone ever planned to have more than 1 trigger
>>>>> assigned to a single LED. I just realized there will be a problem with
>>>>> proposed solution: sysfs files conflict.
>
> ...
>
>>>> Currently we support only triggers dedicated to specific type of
>>>> devices. Even in case of triggers that don't expose custom sysfs
>>>> attributes, registered with led_trigger_register_simple(), device
>>>> drivers have to generate trigger event with dedicated function, e.g:
>>>>
>>>> - ledtrig-cpu: void ledtrig_cpu(enum cpu_led_event ledevt)
>>>> - ledtrig-disk: void ledtrig_disk_activity(void)
>>>> - ledtrig-mtd: void ledtrig_mtd_activity(void)
>>>>
>>>> If one wanted to have the LED notified by different type of devices,
>>>> then they would have to implement a trigger that would exposed all
>>>> required types of API.
>>>>
>>>> Unfortunately, there are many possible combinations of
>>>> triggers and that doesn't sound sane to add a new one when someone
>>>> will find it useful. Of course it would entail adding a call to the
>>>> new trigger API in the drivers, which doesn't seem like something
>>>> acceptable in the mainline.
>>>
>>> Maybe it would make more sense, in this case, to allow only three
>>> possibilities for a USB port activity trigger.  Toggle the LED
>>> whenever:
>>>
>>> 	There is activity on the specified port, or
>>>
>>> 	There is any activity on any port on the specified hub, or
>>>
>>> 	There is any USB activity on any port.
>>>
>>> That ought to cover most of the normal use cases, and it would be
>>> simple enough to implement.
>>
>> What would be the benefit of having a USB port activity trigger,
>> for which we would be specifying the port to observe, but in the same
>> time we would react on any activity on any port (cases 1 and 3)?
>
> I meant these three cases to be mutually exclusive.  For a given LED,
> you could have only one of those trigger types (like mentioned above,
> only one trigger per LED).  For example, you might accept any one of:
>
> 	echo usb1-4.2 >/sys/class/led/foo/trigger
>
> 	echo hub1-4 >/sys/class/led/foo/trigger
>
> 	echo usb >/sys/class/led/foo/trigger
>
> Yes, it would be possible to have a port-specific trigger for one LED
> and an overall USB activity trigger for another LED.  I don't know how
> useful this would be -- you could probably imagine some unlikely
> scenario.
>
> The point is that doing things this way wouldn't require any API
> violations, and it would allow users to do almost all of the things
> they are likely to want.

We'd have to define single API for generating USB trigger event,
so as not enforce addition of three different API calls to the USB
drivers. The type of USB events that the LED should react upon could be
defined by parsing the value written to the sysfs file.
This of course implies, that we should have single LED USB port trigger.

The remaining issue is the sysfs interface design for defining and
presenting multiple USB ports. I'm still in favour of a single
attribute with space separated list. This scheme is commonly used
in existing interfaces.

-- 
Best regards,
Jacek Anaszewski
