From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 0/2] ACPI LED and LED flash support, ACPI support for AS3645A LED flash controller
Date: Fri, 15 Sep 2017 17:40:50 +0300
Message-ID: <20170915144052.25903-1-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, mika.westerberg@intel.com, rafael@kernel.org
List-Id: linux-leds@vger.kernel.org

Hello everyone,

This small patchset defines how to use LEDs and refer to LEDs on ACPI as
well as make use of this with the AS3645A driver.

These patches depend on the AS3645A set here:

<URL:http://www.spinics.net/lists/linux-media/msg121423.html>

as well as the V4L2 fwnode / async improvement patchset here:

<URL:https://www.mail-archive.com/linux-media@vger.kernel.org/msg119015.html>

The two patches in this set used to be part of the above set (v9):

<URL:https://www.mail-archive.com/linux-media@vger.kernel.org/msg118522.html>

Comments would be welcome.

Regards,
Sakari

Sakari Ailus (2):
  ACPI: Document how to refer to LEDs from remote nodes
  as3645a: Switch to fwnode property API

 Documentation/acpi/dsd/leds.txt | 94 +++++++++++++++++++++++++++++++++++++++++
 drivers/leds/leds-as3645a.c     | 81 ++++++++++++++++++++---------------
 2 files changed, 140 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/acpi/dsd/leds.txt

-- 
2.11.0

