From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] leds: core: Add led_notify_brightness_change helper
 function
Date: Thu, 20 Oct 2016 09:40:52 +0200
Message-ID: <20161020074052.GH1689@pali>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-2-hdegoede@redhat.com>
 <20161019135958.GE1689@pali>
 <e6f111e6-f921-4f96-3d21-89a16774880a@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e6f111e6-f921-4f96-3d21-89a16774880a@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

On Wednesday 19 October 2016 18:07:47 Hans de Goede wrote:
> Hi,
> 
> On 19-10-16 15:59, Pali Rohár wrote:
> >On Wednesday 19 October 2016 15:33:54 Hans de Goede wrote:
> >>+		itself and the driver can detect this. Changes done by
> >>+		kernel triggers / software blinking and writing the brightness
> >>+		file are not signalled.
> >
> >Why? In case you have desktop application which show current brightness
> >level and you change manually it via echo something > /sys/ then that
> >application does not have any information about your change. And so it
> >show old value...
> 
> Well it seems like a bad idea to me to notify on changes caused by
> triggers and blinking, even though those are visible under sysfs
> if polling the brightness attribute. At which point it seemed to make
> sense to only notify on changes done autonomously by the hardware,
> rather then from any software (running on the main CPU).

I agree, notification for changes done by kernel triggers and blinking
is bad idea!

I mean only notification when somebody write directly to brightness
sysfs attribute.

> As for specifically not notifying on write, the sysfs interface is root only,
> so usually there will be a single daemon controlling the brightness,
> and any users can go through that daemon and it can distribute change
> messages itself (and will do so for the POLL_PRI events).

It is possible that there will be more daemons doing this thing. And on
linux it is supported to have more alternative softwares which do
similar/same thing...

And once some application will need event that keyboard backlight was
changed (e.g. it will show something on screen, etc), then such
application must implement interface of any such daemon. It is easier
for such application to open sysfs file and listen for POLL_PRI.

> Since the usual use case is a single writing process, which is also
> the same single process listening for POLL_PRI, it seems unnecessary
> to me to notify the process about the write it has just done.

Still this can be useful in scenario when only one "keyboard backlight
daemon" is installed and running in system. In some cases for users or
scripts is easier to change level directly by writing value into sysfs
entry. I can imagine that this is what some "universal" power management
scripts will do. For bash scripts it is easier to write some value into
/sys as clicking on some desktop GUI slider or calling some complex dbus
function... And I prefer that echo something > /sys/... too.

> But if people think that we should consider multiple simultaneous
> users (which seems like a bad idea to me, because of coordination
> issues, but the API does allow it) and therefor should notify
> of the brightness change on a write, I'm fine with doing a new
> version implementing those semantics instead.

Probably running more "keyboard backlight daemons" is not what people
start doing, but having more applications which write value into /sys is
not very rare.

And I think that if "running more keyboard backlight daemons" is not
supported by current version of kernel, then kernel should not allow
such situation... It will be hard to debug such thing if happen.

> Either way notifying on brightness changes caused by triggers /
> blinking seems like a bad idea to me.

Agree.

-- 
Pali Rohár
pali.rohar@gmail.com
