From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: LED devices & poll() for brightness attribute
Date: Thu, 23 Feb 2017 15:48:52 +0100
Message-ID: <20170223144852.GD24201@pali>
References: <20170222090630.GB21558@pali>
 <20170222123929.GD21558@pali>
 <20170222205408.GB8467@amd>
 <201702222216.32131@pali>
 <20170223143726.GB12511@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36110 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdBWOs4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2017 09:48:56 -0500
Content-Disposition: inline
In-Reply-To: <20170223143726.GB12511@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Thursday 23 February 2017 15:37:26 Pavel Machek wrote:
> Hi!
> 
> > > So... you don't want to use systemd, so don't use systemd. What is
> > > the problem? :-)
> > > 
> > > > And my own application for controlling leds should know current
> > > > state of them if it is possible.
> > > 
> > > If you have at most one application controlling each LED, you are
> > > fine. That's quite common situation, serial port can also be opened
> > > at most once. Do you actually have two applications accessing one
> > > led? If so, what applications?
> > 
> > First application which controls leds is integrated into desktop 
> > environment. In basic/default settings it do nothing automatically, just 
> > show GUI bar to user and allow user to adjust LED level.
> 
> Ok. Desktop wants to control the backlight, because it makes sense to
> turn it off when the screen is blanked, and dim it when screen is
> dimmed. Situation is quite similar to display backlight, actually.
> 
> > Second one is basic shell script executed at specific situation (e.g. 
> > power adapter was unplugged) which changes LED level.
> 
> Ok, and this is where the problems start. You are not supposed to
> control keyboard backlight like that. (In the same way you can't
> control display backlight like that.)
> 
> There are numerous problems with the shell script:
> 
> 1) how to identify the keyboard backlight LED

Exactly same as it is doing desktop. It is possible to 100% reimplement
desktop logic for identification of keyboard backlight LED

> 2) there may be more then one

Yes and script can be adjusted to use specific one (config option for
script).

> 3) synchronization problems

This is reason why poll() is needed. So desktop GUI will receive
information that somebody else changed LED.

> 4) need to be root

Hm? Why should be this a problem? Anyway you can chmod brightness
attribute... But this "root need" is not a problem.

Also your script can be spawned by some udev rule or some other program
which detect e.g. power supply connection/disconnection.

> Your shell script should talk to the desktop, because it already knows
> where the backlight is, and the problems disappear.

Sometime there does not have to be any desktop loaded. It could but it
does not have to be.

Look at TLP scripts. They are very popular, and they have no problems
with 1) (needs proper configuration) 2) (fixed by 1) 3) (no visible
problem) 4) (spawned by root udev daemon or manually as root).

> > > Yes, we _could_ do that. Would be slightly confusing
> > > w.r.t. triggers. But is it good idea?
> > 
> > Above situation for setting manual level of led is normal. And in this 
> > situation setting trigger or blink support does not make sense. 
> > Specially when user want to manually set led level.
> > 
> > I think it is good idea to provide some poll-able sysfs for this change. 
> > And if brightness is used for writing, then I would expect that 
> > brightness also provide poll() state.
> > 
> > Yes, it could be little confusing due to triggers/blinking support, but 
> > I think it is better as providing new sysfs file and it does not make 
> > this interface worse...
> 
> I believe the confusion is not worth it. Talk to the desktop people,
> there should be good way to control the backlight without reaching
> lowlevel interfaces directly.

And probably every desktop will use own different method like before. No
thanks. I do not want to depend on particular desktop or implement
zillions of different desktop APIs. And even depend on desktop.

If I think about addition to TLP scripts they should work also without
running desktop...

> > > And yes, with three color LEDs, userspace daemon managing LED state
> > > will be pretty much mandatory...
> > 
> > Why it should be running daemon? Script which you start when you want 
> > change is also enough... no need to have permanently running process.
> 
> Because you want to play multiple patterns on the LED.

One script can set 3 LEDs too. I do not see any problem here.

> You probably also want to automatically control the keyboard backlight
> LEDs using ambient light sensor. Shell should not be involved.

That is something different. For automatic configuration of LEDs some
running daemon is needed. But for manual and static configuration it is
not needed. So depends on what you want...

> This is one example of automatic backlight / keyboard backlight / LED
> patterns. And yes, this should be integrated with desktop, not using
> /sys/class/leds directly.
> 
> https://gitlab.com/tui/tui/blob/master/ofone/mond
> 
> 									Pavel

-- 
Pali Rohár
pali.rohar@gmail.com
