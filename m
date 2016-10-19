From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/2] Add led_notify_brightness_change led-core function and use in dell-wmi driver
Date: Wed, 19 Oct 2016 15:33:53 +0200
Message-ID: <20161019133355.6192-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33622 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S942341AbcJSOta (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 Oct 2016 10:49:30 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi All,

I was annoyed by the kbd-backlight on my Dell XPS 9550 not working well
together with the GNOME3 ui for kbd-backlight control.

Part of the problem here is that the hotkey on the laptop's keyboard to
control the kbd backlight is fully handled in firmware. So dell-wmi does
not send any key-presses for it. This is the right thing todo since
sending such key-presses will result in userspace adjusting the backlight,
while this has already been done by the firmware.

OTOH userspace should really still get some sort of event when this happens,
just like e.g. on some systems with hardwired volume-up/down buttons the
alsa mixer interface will send events to notify userspace about the changed
volume.

Checking other sysfs drivers, there is a standard way to notify userspace
about changes to a sysfs attributes underlying value. This patch-set adds
a led_notify_brightness_change led-core function using this standard
mechanism and makes the dell-wmi driver call led_notify_brightness_change
on the kbd_backlight led_classdev when the firmware has changed the
brightness. Together with some userspace changes / fixes this leads to
a much nicer / more integrated experience wrt kbd backlight control.

Currently this patch-set introduces only 1 user (dell-wmi) of the new
led_notify_brightness_change function, but I plan to also fix the same
issue on thinkpads (soon), and also one some HP models (when I can borrow
one, hopefully also soon).

Regards,

Hans
