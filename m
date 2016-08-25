From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 15:35:49 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1608251521480.1395-100000@iolanthe.rowland.org>
References: <57BF3D64.3090402@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57BF3D64.3090402@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Pavel
List-Id: linux-leds@vger.kernel.org

On Thu, 25 Aug 2016, Jacek Anaszewski wrote:

> >>> What kind of description do you mean? Where should it be used / where
> >>> should it appear?
> >>>
> >>
> >> Product name/symbol. Actually it should be USB subsystem responsibility
> >> to provide the means for querying the product name by port id, if it
> >> is possible at all.
> >
> > 	cat /sys/bus/usb/devices/PORT/product
> > 	cat /sys/bus/usb/devices/PORT/manufacturer
> >
> > These will work if there is a device registered under PORT.
> 
> I've found only idProduct and idVendor files. They indeed uniquely
> identify the device, but the numbers are not human readable.
> Is there a way to retrieve the corresponding names in kernel?

If the device provides the string descriptors then the textual product
and manufacturer files are available in sysfs, otherwise they aren't.

> Does the lsusb command do the mapping in the user space or maybe
> it takes the names from kernel?

lsusb does the mapping in userspace, based on an ID database.  On my 
system (Fedora), the database is /etc/udev/hwdb.bin.

Alan Stern
