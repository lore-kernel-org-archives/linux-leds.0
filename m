From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/2] Add led_notify_brightness_change led-core function
 and use in dell-wmi driver
Date: Wed, 19 Oct 2016 16:10:22 +0200
Message-ID: <20161019141022.GG1689@pali>
References: <20161019133355.6192-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33304 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752047AbcJSOKZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Oct 2016 10:10:25 -0400
Content-Disposition: inline
In-Reply-To: <20161019133355.6192-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On Wednesday 19 October 2016 15:33:53 Hans de Goede wrote:
> Checking other sysfs drivers, there is a standard way to notify userspace
> about changes to a sysfs attributes underlying value. This patch-set adds
> a led_notify_brightness_change led-core function using this standard
> mechanism and makes the dell-wmi driver call led_notify_brightness_change
> on the kbd_backlight led_classdev when the firmware has changed the
> brightness. Together with some userspace changes / fixes this leads to
> a much nicer / more integrated experience wrt kbd backlight control.

Thank you for bringing this back! I had similar solution in my mind, but
I have not had time to implement it yet. It is great to see support for
this.

> Currently this patch-set introduces only 1 user (dell-wmi) of the new
> led_notify_brightness_change function, but I plan to also fix the same
> issue on thinkpads (soon),

Look at thinkpad acpi mailing list discussion. There is acpi information
how to listen for firmware event when keyboard backlight on thinkpad was
changed. Maybe it could help you...

-- 
Pali Rohár
pali.rohar@gmail.com
