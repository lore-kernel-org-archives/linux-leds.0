From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 16:08:14 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1608251601090.1395-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1608251521480.1395-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1608251521480.1395-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Pavel
List-Id: linux-leds@vger.kernel.org

On Thu, 25 Aug 2016, Alan Stern wrote:

> > Does the lsusb command do the mapping in the user space or maybe
> > it takes the names from kernel?
> 
> lsusb does the mapping in userspace, based on an ID database.  On my 
> system (Fedora), the database is /etc/udev/hwdb.bin.

There's also /usr/share/hwdata/usb.ids -- I don't know if or how the
two databases are related.  And there's /usr/lib/udev/hwdb.d/20-usb*.

Alan Stern
