From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 00/14] Common Dell SMBIOS API
Date: Tue, 12 Jan 2016 15:02:46 +0100
Message-ID: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The Linux kernel tree currently contains two Dell laptop-related driver=
s
issuing SMBIOS requests in different ways (dell-laptop in
drivers/platform/x86 and dell-led in drivers/led).  As an upcoming patc=
h
series for the dell-wmi driver (also in drivers/platform/x86) will
change it so that it also performs SMBIOS requests, I took the
opportunity to unify the API used for issuing Dell SMBIOS requests
throughout the kernel before any further code duplication happens.
Credit for suggesting this goes to Pali Roh=C3=A1r.

This patch series is primarily intended for the platform-x86 subsystem,
with only 2 final patches touching the LED subsystem.  I decided to sen=
d
the whole series to everyone involved to provide context - my apologies
if this is frowned upon.

As for making dell-led dependent on a driver in drivers/platform/x86,
let me just hint that Pali and I think it could be possible to
eventually move all of dell-led's code to drivers/platform/x86.  But
first things first.

The first patch generates a lot of checkpatch warnings, but these are
also raised for the original code and I decided that not changing the
code while moving around large quantities of it is critical for
reviewability.

Alex, as I don't have the hardware to test the changes in dell-led
(beyond compilation) and you contributed the parts of it which this
patch series changes, is there any way you might test it on relevant
hardware?

 drivers/leds/Kconfig               |    1 +
 drivers/leds/dell-led.c            |  125 ++--------
 drivers/platform/x86/Kconfig       |   12 +-
 drivers/platform/x86/Makefile      |    1 +
 drivers/platform/x86/dell-laptop.c |  444 ++++++++++++----------------=
--------
 drivers/platform/x86/dell-smbios.c |  179 +++++++++++++++
 drivers/platform/x86/dell-smbios.h |   48 ++++
 7 files changed, 395 insertions(+), 415 deletions(-)
 create mode 100644 drivers/platform/x86/dell-smbios.c
 create mode 100644 drivers/platform/x86/dell-smbios.h

--=20
1.7.10.4
