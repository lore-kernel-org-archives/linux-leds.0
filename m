From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 00/16] Common Dell SMBIOS API
Date: Fri, 22 Jan 2016 15:27:12 +0100
Message-ID: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
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
with only 2 final patches touching the LED subsystem.

The first patch generates a lot of checkpatch warnings, but these are
also raised for the original code and I decided that not changing the
code while moving around large quantities of it is critical for
reviewability.

Changes from v1:

  - the SMBIOS buffer is no longer exported from the new dell-smbios
    module (patch 03 from v1 has been dropped, patches 08-09 from v2
    implement this change),

  - dell_smbios_send_request() is changed so that it doesn't return an
    SMBIOS buffer (patch 07 from v2),

  - slight patch reordering.

Note:

    In this series (both v1 and v2) I tried to stick to the overall
    concept used in dell-laptop, but in the v1 thread me and Pali also
    briefly discussed his alternative ideas [1][2] as to what this API
    could look like, so feel free to suggest a different approach.

[1] http://www.spinics.net/lists/platform-driver-x86/msg08260.html
[2] http://www.spinics.net/lists/platform-driver-x86/msg08268.html

 drivers/leds/Kconfig               |    1 +
 drivers/leds/dell-led.c            |  126 ++-----------
 drivers/platform/x86/Kconfig       |   12 +-
 drivers/platform/x86/Makefile      |    1 +
 drivers/platform/x86/dell-laptop.c |  340 ++++++++++------------------=
--------
 drivers/platform/x86/dell-smbios.c |  176 +++++++++++++++++++
 drivers/platform/x86/dell-smbios.h |   44 +++++
 7 files changed, 344 insertions(+), 356 deletions(-)
 create mode 100644 drivers/platform/x86/dell-smbios.c
 create mode 100644 drivers/platform/x86/dell-smbios.h

--=20
1.7.10.4
