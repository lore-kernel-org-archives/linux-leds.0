From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 10:30:45 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org>
References: <d9d2ae14-c009-3518-ac4c-4b71abe91e88@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9d2ae14-c009-3518-ac4c-4b71abe91e88@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

On Thu, 25 Aug 2016, Jacek Anaszewski wrote:

> I'd see it as follows:
> 
> #cat available_ports
> #1-1 1-2 2-1
> 
> #echo "1-1" > new_port
> 
> #cat observed_ports
> #1-1
> 
> #echo "2-1" > new_port
> 
> #cat observed_ports
> #1-1 2-1
> 
> We've already had few discussions about the sysfs designs trying
> to break the one-value-per-file rule for LED class device, and
> there was always strong resistance against.

This scheme has multiple values in both the available_ports and 
observed_ports files.  :-(  Not that I have any better suggestions...

> >> Also a description of the device connected to the port would be a nice
> >> feature, however I am not certain about the feasibility thereof.
> >
> > What kind of description do you mean? Where should it be used / where
> > should it appear?
> >
> 
> Product name/symbol. Actually it should be USB subsystem responsibility
> to provide the means for querying the product name by port id, if it
> is possible at all.

	cat /sys/bus/usb/devices/PORT/product
	cat /sys/bus/usb/devices/PORT/manufacturer

These will work if there is a device registered under PORT.

Alan Stern
