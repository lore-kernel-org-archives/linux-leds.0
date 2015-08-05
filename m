From: Craig McQueen <craig.mcqueen@innerrange.com>
Subject: RE: Change uevent whenever brightness is set to 0
Date: Wed, 5 Aug 2015 11:42:31 +1000
Message-ID: <5500469A22567C4BAF673A6E86AFA3A40227C1D64219@IR-CENTRAL.corp.innerrange.com>
References: <5500469A22567C4BAF673A6E86AFA3A40227C1D640EC@IR-CENTRAL.corp.innerrange.com>
 <55C0996C.6020905@gmail.com>
 <5500469A22567C4BAF673A6E86AFA3A40227C1D641F5@IR-CENTRAL.corp.innerrange.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 122-143-146.dsl.connexus.net.au ([203.122.143.146]:21259 "EHLO
	remote.innerrange.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751205AbbHEBmf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 4 Aug 2015 21:42:35 -0400
In-Reply-To: <5500469A22567C4BAF673A6E86AFA3A40227C1D641F5@IR-CENTRAL.corp.innerrange.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>



> I wrote:
> > Jacek Anaszewski wrote:
> >
> > On 08/04/2015 05:56 AM, Craig McQueen wrote:
> > > I've written a udev rule to catch uevent "change" events, with the
> > > goal of
> > setting LED user/group/permissions whenever trigger settings are
> changed.
> > >
> > > http://unix.stackexchange.com/a/202870/34376
> > >
> > > However, I've noticed that a TRIGGER uevent "change" event is
> > > generated
> > every time an LED is turned off.
> > >
> > > E.g. in one terminal:
> > >      udevadm monitor -p
> > >
> > > In another terminal:
> > >      echo 0 > /sys/class/leds/beaglebone:green:usr3/brightness
> > >
> > > The first terminal shows:
> > >
> > >      KERNEL[15446.374466] change
> > /devices/leds/leds/beaglebone:green:usr3 (leds)
> > >      ACTION=change
> > >      DEVPATH=/devices/leds/leds/beaglebone:green:usr3
> > >      SEQNUM=39147
> > >      SUBSYSTEM=leds
> > >      TRIGGER=none
> > >
> > > This behaviour is not ideal, because I really only want this uevent
> > > if the
> > trigger really has changed.
> > >
> > > I presume this is due to these two lines in brightness_store() in led-
> class.c:
> > > 	if (state == LED_OFF)
> > > 		led_trigger_remove(led_cdev);
> > >
> > > What would be the recommended way to improve this, so a TRIGGER
> > uevent "change" event is only generated if the trigger is actually
> > reset to 'none' in this scenario?
> > >
> > > I've noticed this on kernel 3.14.48 running on BeagleBone Black.
> > >
> >
> > You can define your rule so that it would not be matched when
> > TRIGGER=none.
> 
> I tried adding TRIGGER!="none" as in this rule:
> 
> SUBSYSTEM=="leds", ACTION=="change", TRIGGER!="none",
> RUN+="/bin/chgrp -R leds /sys%p", RUN+="/bin/chmod -R g=u /sys%p"
> 
> But the rule never seems to run. I can't figure out why not. Unless the older
> version of udev I'm using (182) doesn't support !=.

I figured it out. I need ENV{TRIGGER} and not just TRIGGER.

SUBSYSTEM=="leds", ACTION=="change", ENV{TRIGGER}!="none", RUN+="/bin/chgrp -R leds /sys%p", RUN+="/bin/chmod -R g=u /sys%p"

-- 
Craig McQueen
