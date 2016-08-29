From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Mon, 29 Aug 2016 11:01:21 +0200
Message-ID: <CACna6rzzmvAzS-yaQL8oKVjLkMwotYcwz+=MbjMLs0ordkYb0w@mail.gmail.com>
References: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org>
 <57BF3D64.3090402@gmail.com> <CACna6rxs0X3wWp2BPdVgOK+0Hrmp3BM9WXcW4oihrcuhjV1W6g@mail.gmail.com>
 <25cdf5e1-c3b5-e8a3-8213-f35a6f6160c2@samsung.com> <20160829080551.GA7987@amd>
 <CACna6rzkcpHN8jyB1dXKEgoN6xkO0qUGAjtGs6zEcJoFMo=M8Q@mail.gmail.com> <20160829084127.GA10529@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160829084127.GA10529@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>"open list:LED SUBSYSTEM" <l>
List-Id: linux-leds@vger.kernel.org

On 29 August 2016 at 10:41, Pavel Machek <pavel@ucw.cz> wrote:
> On Mon 2016-08-29 10:21:48, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 29 August 2016 at 10:05, Pavel Machek <pavel@ucw.cz> wrote:
>> >> >2) Having "ports" subdir with RW files, one per each existing physic=
al port
>> >> >In this situation we don't need "new_port" or "remove_port". If we
>> >> >want port to be observable we just do:
>> >> >echo 1 > 1-1
>> >> >Implementing this solution needs reading more details from USB subsy=
stem.
>> >>
>> >> The situation here is clear IMO - the number of USB ports in the syst=
em
>> >> can change dynamically. I'm not sure if this can be handled easily wi=
th
>> >> sysfs, where we usually expose an interface for known set of settings=
.
>> >> struct attribute arrays are usually defined statically at the compile
>> >> time and filled with the variables, that are created with DEVICE_ATTR
>> >> macro.
>> >
>> > sysfs already exposes current view of all usb devices. Just use it.
>>
>> We're talking about USB ports not devices, but this is still true. You
>> can find them in
>> /sys/bus/usb/devices/*/*-port*
>>
>> I can't see how we could use them. How could I develop sysfs interface
>> in /sys/class/leds/*/ to allow userspace assigning USB ports to the
>> LED trigger?
>
> Create /sys/bus/usb/devices/*/*-port*/led_trigger file?
>
> (Do you plan one USB trigger, or multiple ones?)

I guess it means slightly more complex cross-subsystem interaction I
may need help to understand.

First of all: I will need multiple USB port triggers. It's because
there are many devices with multiple USB LEDs. Some complex (but
existing!) case:
USB 2.0 white LED - activated by USB 2.0 dev in USB 2.0 port
USB 3.0 white LED - activated by USB 2.0 dev in USB 3.0 port
USB 3.0 green LED - activated by USB 3.0 dev in USB 3.0 port
(This devices has separated EHCI and XHCI controllers, so we have 2
logical ports for 1 physical one)

So I guess I'll need something more complex like
/sys/bus/usb/devices/*/*-port*/bcm53xx:white:usb2_led_trigger
/sys/bus/usb/devices/*/*-port*/bcm53xx:white:usb3_led_trigger
/sys/bus/usb/devices/*/*-port*/bcm53xx:green:usb3_led_trigger
in case every USB led has "usbport" trigger assigned.

How can I create above sysfs files? Should I write code for this in
ledtrig-usbport.c? That would require accessing struct usb_hub and
then struct usb_port, but both of them are internal structs defined in
drivers/usb/core/hub.h. How could I work with that?

--=20
Rafa=C5=82
