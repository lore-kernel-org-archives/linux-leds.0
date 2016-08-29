From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Mon, 29 Aug 2016 10:05:52 +0200
Message-ID: <20160829080551.GA7987@amd>
References: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org>
 <57BF3D64.3090402@gmail.com>
 <CACna6rxs0X3wWp2BPdVgOK+0Hrmp3BM9WXcW4oihrcuhjV1W6g@mail.gmail.com>
 <25cdf5e1-c3b5-e8a3-8213-f35a6f6160c2@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <25cdf5e1-c3b5-e8a3-8213-f35a6f6160c2@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, open list:LED SUBSY
List-Id: linux-leds@vger.kernel.org

Hi!

> >2) Having "ports" subdir with RW files, one per each existing physical port
> >In this situation we don't need "new_port" or "remove_port". If we
> >want port to be observable we just do:
> >echo 1 > 1-1
> >Implementing this solution needs reading more details from USB subsystem.
> 
> The situation here is clear IMO - the number of USB ports in the system
> can change dynamically. I'm not sure if this can be handled easily with
> sysfs, where we usually expose an interface for known set of settings.
> struct attribute arrays are usually defined statically at the compile
> time and filled with the variables, that are created with DEVICE_ATTR
> macro.

sysfs already exposes current view of all usb devices. Just use it.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
