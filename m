From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Sat, 3 Sep 2016 20:24:05 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1609032022470.11709-100000@netrider.rowland.org>
References: <fd6a12b6-334d-98c6-4492-ba36474d6b22@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:49637 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1752436AbcIDAYH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2016 20:24:07 -0400
In-Reply-To: <fd6a12b6-334d-98c6-4492-ba36474d6b22@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On Sat, 3 Sep 2016, Jacek Anaszewski wrote:

> >> The remaining issue is the sysfs interface design for defining and
> >> presenting multiple USB ports. I'm still in favour of a single
> >> attribute with space separated list. This scheme is commonly used
> >> in existing interfaces.
> >
> > No such interface is needed if you do things the way I outlined above.
> > Each trigger would require the user to specify either one port, one
> > hub, or nothing at all.  Multiple ports would not be used.
> 
> The patch assumes that it is possible to register trigger for many
> ports.

The patch could be changed to remove that assumption.

Alan Stern
