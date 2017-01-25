From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v6 1/4] leds: class: Add new optional brightness_hw_changed
Date: Wed, 25 Jan 2017 17:11:26 +0100
Message-ID: <20170125161130.5424-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:15800 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751868AbdAYQLe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 25 Jan 2017 11:11:34 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi,

Here is v6 of my patch(es) to allow userspace to get notified about
hw initiated brightness changes.

As agreed upon before the API has been changed to introduce a new
hw_brightness_changed attribute for this.

This has been tested on a Dell XPS 15, I'm travelling atm so I've
not tested the new version of the thinkpad patch.

The platform patches here are included mostly as an example of
users of the new API, they are currently not intended for merging
as we first need to have the LED class API for this merged.

Regards,

Hans
