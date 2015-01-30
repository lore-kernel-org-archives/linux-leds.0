From: Greg KH <greg@kroah.com>
Subject: Re: Reading /sys with side effects (was Re: [PATCH 1/2]
 Documentation: leds: Add description of LED Flash class extension)
Date: Fri, 30 Jan 2015 08:40:27 -0800
Message-ID: <20150130164027.GA25830@kroah.com>
References: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
 <20150127221958.GA18993@amd>
 <54C8A130.8000807@samsung.com>
 <20150129211420.GA21140@amd>
 <54CB4702.1090508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54CB4702.1090508@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 30, 2015 at 09:55:30AM +0100, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 01/29/2015 10:14 PM, Pavel Machek wrote:
> >Hi!
> >
> >>>>+	- flash_fault - list of flash faults that may have occurred:
> >>>>+		* led-over-voltage - flash controller voltage to the flash LED
> >>>>+			has exceededthe limit specific to the flash controller
> >>>>+		* flash-timeout-exceeded - the flash strobe was still on when
> >>>>+			the timeout set by the user has expired; not all flash
> >>>>+			controllers may set this in all such conditions
> >>>>+		* controller-over-temperature - the flash controller has
> >>>>+			overheated
> >>>>+		* controller-short-circuit - the short circuit protection
> >>>>+			of the flash controller has been triggered
> >>>>+		* led-power-supply-over-current - current in the LED power
> >>>>+			supply has exceeded the limit specific to the flash
> >>>>+			controller
> >>>>+		* indicator-led-fault - the flash controller has detected
> >>>>+			a short or open circuit condition on the indicator LED
> >>>>+		* led-under-voltage - flash controller voltage to the flash
> >>>>+			LED has been below the minimum limit specific to
> >>>>+			the flash
> >>>>+		* controller-under-voltage - the input voltage of the flash
> >>>>+			controller is below the limit under which strobing the
> >>>>+			flash at full current will not be possible. The condition
> >>>>+			persists until this flag is no longer set
> >>>>+		* led-over-temperature - the temperature of the LED has exceeded
> >>>>+			its allowed upper limit
> >>>>+
> >>>>+		Flash faults are cleared, if possible, by reading the attribute.
> >>>
> >>>That's bad. Now you can no longer present flash_fault file as readable
> >>>to non-root users, and grep -ri foo /sys will interfere with your
> >>>camera application.
> >>>
> >>>Bad interface, just fix it.
> >>
> >>In my opinion it isn't crucial for the user to be aware of the
> >>fact that some non-persistent fault happened right after strobing the
> >>flash (e.g. over temperature).
> >>
> >>I cannot see anything harmful in the situation when someone does grep
> >>on /sys and clears non-persistent fault on a flash LED device.
> >
> >So why export the faults at all?
> 
> Faults may prevent strobing the flash in case of some devices.
> The example of such a device is ADP1663 (drivers/media/i2c/adp1653.c).
> This driver reads the faults before strobing the flash and if a
> fault preventing strobing has occurred it returns -EBUSY.
> 
> If this driver was made a LED Flash class driver, then it would
> expose flash_faults attribute. The driver would probably need
> redesigning - checking the faults before strobing would have to be
> avoided and it should be left to the userspace.

That's fine, but Pavel's point is that you shouldn't "clear a fault" by
reading a sysfs file as you don't control who reads all sysfs files
(hint, libudev might cache all attributes when they are found / change,
which could prevent anyone else from seeing that fault.)

So please fix this, make a write to clear a fault or some other such
explicit action, not a simple read.  That's not an acceptable api.

thanks,

greg k-h
