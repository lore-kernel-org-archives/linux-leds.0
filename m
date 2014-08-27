From: Michal Sojka <sojka@merica.cz>
Subject: [PATCH v4 0/3] LED triggers for USB host and device
Date: Wed, 27 Aug 2014 22:57:57 +0200
Message-ID: <1409173080-13921-1-git-send-email-sojka@merica.cz>
References: <20140827193028.GK6347@saruman.home>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from max.feld.cvut.cz ([147.32.192.36]:38003 "EHLO max.feld.cvut.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935732AbaH0U6h (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 27 Aug 2014 16:58:37 -0400
In-Reply-To: <20140827193028.GK6347@saruman.home>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Michal Sojka <sojka@merica.cz>, Alan Stern <stern@rowland.harvard.edu>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz

This adds LED triggers for USB host and device. First patch refactors
UDC drivers as requested by Felipe Balbi, second is a preparation for
the third, which adds the LED triggers.

Changes from v3:
- usb_gadget_giveback_request() moved outside of CONFIG_HAS_DMA
  conditioned block.
- Added kernel-doc for usb_gadget_giveback_request() (Felipe Balbi).
- Removed outdated comment (Alan Stern).
- req->complete == NULL is now a bug. Previously, this was ignored
  (Alan Stern).
- File rename moved to a separate commit (greg k-h).

Changes from v2:
- Host/gadget triggers merged to a single file in usb/common/ (Felipe
  Balbi).
- UDC drivers refactored so that LED trigger works for all of them.

Changes from v1:
- Moved from drivers/leds/ to drivers/usb/.
- Improved Kconfig help.
- Linked with other modules rather than being standalone modules.

Michal Sojka (2):
  usb: gadget: Refactor request completion
  usb: Add LED triggers for USB activity

 drivers/usb/Kconfig                     |  11 +++
 drivers/usb/chipidea/udc.c              |   6 +-
 drivers/usb/common/Makefile             |   5 +-
 drivers/usb/common/common.c             | 144 ++++++++++++++++++++++++++++++++
 drivers/usb/common/led.c                |  59 +++++++++++++
 drivers/usb/common/usb-common.c         | 144 --------------------------------
 drivers/usb/core/hcd.c                  |   2 +
 drivers/usb/dwc2/gadget.c               |   6 +-
 drivers/usb/dwc3/gadget.c               |   2 +-
 drivers/usb/gadget/udc/amd5536udc.c     |   2 +-
 drivers/usb/gadget/udc/at91_udc.c       |   2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c |   4 +-
 drivers/usb/gadget/udc/bcm63xx_udc.c    |   2 +-
 drivers/usb/gadget/udc/dummy_hcd.c      |  10 +--
 drivers/usb/gadget/udc/fotg210-udc.c    |   2 +-
 drivers/usb/gadget/udc/fsl_qe_udc.c     |   6 +-
 drivers/usb/gadget/udc/fsl_udc_core.c   |   6 +-
 drivers/usb/gadget/udc/fusb300_udc.c    |   2 +-
 drivers/usb/gadget/udc/goku_udc.c       |   2 +-
 drivers/usb/gadget/udc/gr_udc.c         |   2 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c    |   2 +-
 drivers/usb/gadget/udc/m66592-udc.c     |   2 +-
 drivers/usb/gadget/udc/mv_u3d_core.c    |   8 +-
 drivers/usb/gadget/udc/mv_udc_core.c    |   8 +-
 drivers/usb/gadget/udc/net2272.c        |   2 +-
 drivers/usb/gadget/udc/net2280.c        |   2 +-
 drivers/usb/gadget/udc/omap_udc.c       |   2 +-
 drivers/usb/gadget/udc/pch_udc.c        |   2 +-
 drivers/usb/gadget/udc/pxa25x_udc.c     |   2 +-
 drivers/usb/gadget/udc/pxa27x_udc.c     |   2 +-
 drivers/usb/gadget/udc/r8a66597-udc.c   |   2 +-
 drivers/usb/gadget/udc/s3c-hsudc.c      |   3 +-
 drivers/usb/gadget/udc/s3c2410_udc.c    |   2 +-
 drivers/usb/gadget/udc/udc-core.c       |  13 +++
 drivers/usb/musb/musb_gadget.c          |   2 +-
 drivers/usb/renesas_usbhs/mod_gadget.c  |   2 +-
 include/linux/usb.h                     |  12 +++
 include/linux/usb/gadget.h              |   8 ++
 38 files changed, 294 insertions(+), 201 deletions(-)
 create mode 100644 drivers/usb/common/common.c
 create mode 100644 drivers/usb/common/led.c
 delete mode 100644 drivers/usb/common/usb-common.c

-- 
2.1.0
