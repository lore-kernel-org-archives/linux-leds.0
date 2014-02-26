From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/5] leds: leds-ss4200: remove DEFINE_PCI_DEVICE_TABLE macro
Date: Wed, 26 Feb 2014 14:10:51 +0900
Message-ID: <000c01cf32b1$1e1c8720$5a559560$%han@samsung.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36484 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752463AbaBZFKz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2014 00:10:55 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N1L006BL7Q30W80@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 26 Feb 2014 14:10:51 +0900 (KST)
In-reply-to: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Content-language: ko
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: 'Bryan Wu' <cooloney@gmail.com>
Cc: linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jingoo Han' <jg1.han@samsung.com>, 'Dave Hansen' <dave@linux.vnet.ibm.com>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>

Don't use DEFINE_PCI_DEVICE_TABLE macro, because this macro
is deprecated.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/leds/leds-ss4200.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 3faf550..7dd033d 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -63,7 +63,7 @@ MODULE_LICENSE("GPL");
 /*
  * PCI ID of the Intel ICH7 LPC Device within which the GPIO block lives.
  */
-static DEFINE_PCI_DEVICE_TABLE(ich7_lpc_pci_id) = {
+static const struct pci_device_id ich7_lpc_pci_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_0) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_1) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_30) },
-- 
1.7.10.4
