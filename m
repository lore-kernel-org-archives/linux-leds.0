From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v8 0/7] platform/x86: Notify userspace about hotkeys changing kbd-backlight brightness
Date: Thu,  9 Feb 2017 16:44:10 +0100
Message-ID: <20170209154417.19040-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44962 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752348AbdBIQkO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Feb 2017 11:40:14 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi All,

Here is v8 of the platform drivers changes matching / using the new
v8 LED subsys led_classdev_notify_brightness_hw_changed() functionality
queued in -next.

There have been some changes (and preparation patches added) compared
to the previous versions since the new LED api requires the driver to
only call led_classdev_notify_brightness_hw_changed() on hotkey triggered
changes and the ACPI events indicating brightness changes also get
triggered when setting the brightness to led_set_brightness (or sysfs).

This series depends on the patch adding
led_classdev_notify_brightness_hw_changed() to the LED subsystem,
Jacek can you create a stable branch with just that patch which the
platform/x86 platform maintainers can merge, so that they can apply
this series ?

Regards,

Hans
