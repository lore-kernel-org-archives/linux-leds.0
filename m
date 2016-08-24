From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 17:04:08 -0400
Message-ID: <20160824210408.GB4305@kroah.com>
References: <20160823220404.9887-1-zajec5@gmail.com>
 <20160824092129.GA23180@kroah.com>
 <CACna6rwt=QbHrwyKqZuK6cSpXCHas26GF7XNDdvAOXYiWp8YKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:57957 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752214AbcHXVHh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Aug 2016 17:07:37 -0400
Content-Disposition: inline
In-Reply-To: <CACna6rwt=QbHrwyKqZuK6cSpXCHas26GF7XNDdvAOXYiWp8YKA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On Wed, Aug 24, 2016 at 11:26:27AM +0200, Rafał Miłecki wrote:
> On 24 August 2016 at 11:21, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Aug 24, 2016 at 12:03:29AM +0200, Rafał Miłecki wrote:
> >> From: Rafał Miłecki <rafal@milecki.pl>
> >>
> >> This commit adds a new trigger responsible for turning on LED when USB
> >> device gets connected to the specified USB port. This can can useful for
> >> various home routers that have USB port(s) and a proper LED telling user
> >> a device is connected.
> >>
> >> The trigger gets its documentation file but basically it just requires
> >> specifying USB port in a Linux format (e.g. echo 1-1 > new_port).
> >>
> >> During work on this trigger there was a plan to add DT bindings for it,
> >> but there wasn't an agreement on the format yet. This can be worked on
> >> later, a sysfs interface is needed anyway for platforms not using DT.
> >>
> >> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> >> ---
> >> V2: Trying to add DT support, idea postponed as it will take more time
> >>     to discuss the bindings.
> >> V3: Fix typos in commit and Documentation (thanks Jacek!)
> >>     Use "ports" sysfs file for adding and removing USB ports (thx Jacek)
> >>     Check if there is USB device connected after adding new USB port
> >>     Fix memory leak or two
> >>
> >> Felipe: I'd like to ask for your Ack before having this patch pushed.
> >> ---
> >>  Documentation/leds/ledtrig-usbport.txt |  49 +++++++
> >>  drivers/leds/trigger/Kconfig           |   8 ++
> >>  drivers/leds/trigger/Makefile          |   1 +
> >>  drivers/leds/trigger/ledtrig-usbport.c | 253 +++++++++++++++++++++++++++++++++
> >>  4 files changed, 311 insertions(+)
> >>  create mode 100644 Documentation/leds/ledtrig-usbport.txt
> >>  create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
> >
> > You are adding sysfs files without adding a Documentation/ABI/ entry,
> > please never do that.
> 
> This is the way all LED triggers are documented, I just blindly
> assumed it's OK. Could you be a bit more helpful and help me to
> understand further steps? Should I drop
> Documentation/leds/ledtrig-usbport.txt and add proper entry in
> Documentation/ABI/testing? Or should I keep both files? What about
> current sysfs of other triggers? Should they be moved/documented in
> ABI?

In the end, all should be moved into Documentation/ABI/  But for you,
might as well start documenting them in there for any new ones so you
don't have to just move them later.

thanks,

greg k-h
