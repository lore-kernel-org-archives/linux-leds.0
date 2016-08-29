From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Mon, 29 Aug 2016 10:21:48 +0200
Message-ID: <CACna6rzkcpHN8jyB1dXKEgoN6xkO0qUGAjtGs6zEcJoFMo=M8Q@mail.gmail.com>
References: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org>
 <57BF3D64.3090402@gmail.com> <CACna6rxs0X3wWp2BPdVgOK+0Hrmp3BM9WXcW4oihrcuhjV1W6g@mail.gmail.com>
 <25cdf5e1-c3b5-e8a3-8213-f35a6f6160c2@samsung.com> <20160829080551.GA7987@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160829080551.GA7987@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>"open list:LED SUBSYSTEM" <l>
List-Id: linux-leds@vger.kernel.org

On 29 August 2016 at 10:05, Pavel Machek <pavel@ucw.cz> wrote:
>> >2) Having "ports" subdir with RW files, one per each existing physical =
port
>> >In this situation we don't need "new_port" or "remove_port". If we
>> >want port to be observable we just do:
>> >echo 1 > 1-1
>> >Implementing this solution needs reading more details from USB subsyste=
m.
>>
>> The situation here is clear IMO - the number of USB ports in the system
>> can change dynamically. I'm not sure if this can be handled easily with
>> sysfs, where we usually expose an interface for known set of settings.
>> struct attribute arrays are usually defined statically at the compile
>> time and filled with the variables, that are created with DEVICE_ATTR
>> macro.
>
> sysfs already exposes current view of all usb devices. Just use it.

We're talking about USB ports not devices, but this is still true. You
can find them in
/sys/bus/usb/devices/*/*-port*

I can't see how we could use them. How could I develop sysfs interface
in /sys/class/leds/*/ to allow userspace assigning USB ports to the
LED trigger?

--=20
Rafa=C5=82
