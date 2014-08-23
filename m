From: Michal Sojka <sojka@merica.cz>
Subject: [PATCH v2 0/3] LED triggers for USB host and device
Date: Sat, 23 Aug 2014 02:08:19 +0200
Message-ID: <1408752502-4162-1-git-send-email-sojka@merica.cz>
References: <87ha149j2z.fsf@steelpick.2x.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87ha149j2z.fsf@steelpick.2x.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Michal Sojka <sojka@merica.cz>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz
List-Id: linux-leds@vger.kernel.org

This adds LED triggers for USB host and device.

Changes from v1:
- Moved from drivers/leds/ to drivers/usb/
- Improved Kconfig help
- Linked with other modules rather than being standalone modules

Michal Sojka (3):
  usb: Add missing #include
  usb: Add LED trigger for USB host activity
  usb: Add LED trigger for USB gadget activity

 drivers/usb/core/Kconfig        |  9 +++++++++
 drivers/usb/core/Makefile       |  1 +
 drivers/usb/core/hcd.c          |  2 ++
 drivers/usb/core/led.c          | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/gadget/Kconfig      | 12 ++++++++++++
 drivers/usb/gadget/udc/Makefile |  5 ++++-
 drivers/usb/gadget/udc/led.c    | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/musb/musb_gadget.c  |  5 +++--
 include/linux/usb/gadget.h      | 10 ++++++++++
 include/linux/usb/hcd.h         |  7 +++++++
 10 files changed, 124 insertions(+), 3 deletions(-)
 create mode 100644 drivers/usb/core/led.c
 create mode 100644 drivers/usb/gadget/udc/led.c

-- 
2.1.0
