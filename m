From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Sun, 15 Jan 2017 10:25:52 -0200
Message-ID: <20170115122552.GA4665@khazad-dum.debian.net>
References: <20161125110557.GA13204@amd>
 <2367b9a7-68f7-2038-0d3a-a9561055b4f6@samsung.com>
 <20161125144859.GA20139@amd>
 <9844f7b3-c3e8-99d8-61b6-1550b1b8ab7e@samsung.com>
 <20161125204045.GA28036@amd>
 <b35b19a0-5abd-154a-cf3b-d4a7f7e76f00@gmail.com>
 <20161221184948.GB21636@amd>
 <eb246ac1-bed1-a1c7-8d69-e5529c774322@gmail.com>
 <20170113191734.GB17467@localhost.localdomain>
 <eae37524-50bf-5601-3137-663d707ffa5e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:55665 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750860AbdAOMZ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 15 Jan 2017 07:25:57 -0500
Content-Disposition: inline
In-Reply-To: <eae37524-50bf-5601-3137-663d707ffa5e@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, gdg@zplane.com, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On Sun, 15 Jan 2017, Hans de Goede wrote:
> Do you want me to also send out a new version of the platform patches when
> I send the next shot at the LED side of things, or shall I keep those
> in my personal tree until the LED api is finalized ?

If you don't sent the entire patch set here, please keep me CC'd.  You
guys seem to have some misconceptions about how the ThinkPad LEDs work.

For one, they're LIFO, as in: whomever set their state last, wins.  And
you have several agents trying to command them: EC itself, SMBIOS (in
SMM mode), ACPI DSDT, thinkpad-acpi.   Most of the time, changes are
event-driven, so you _could_ try to have the last word on those which
all such events are visible...

Anyway, the fact is that you can never be really ensure they're at the
state you want.  It is a best-effort kind of thing.   Also, they're
controlled by EC firmware, not GPIO, so you don't know their physical
state (on/off/brightness level): you just know what high-level state the
EC is set to (on/off/blink/ramp) and that information is not always
available (the LEDs can be write-only, or worse, turn-on-only or
turn-off-only at the ACPI DSDT interface level, which is what we
typically use in thinkpad-acpi :p).

I.e: some thinkpad LEDs are better behaved than others, and more
controllable than others.  And this changes with firmware model/version.

-- 
  Henrique Holschuh
