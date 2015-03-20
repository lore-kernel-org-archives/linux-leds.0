From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v2 0/2]  LED interface for PowerNV platform
Date: Fri, 20 Mar 2015 16:32:37 +0530
Message-ID: <20150320105921.14866.83209.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:50418 "EHLO
	e28smtp05.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbbCTLDF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 20 Mar 2015 07:03:05 -0400
Received: from /spool/local
	by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Fri, 20 Mar 2015 16:33:02 +0530
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 13229125805C
	for <linux-leds@vger.kernel.org>; Fri, 20 Mar 2015 16:34:33 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay02.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t2KB2cBv22544462
	for <linux-leds@vger.kernel.org>; Fri, 20 Mar 2015 16:32:38 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t2KB2bSR017173
	for <linux-leds@vger.kernel.org>; Fri, 20 Mar 2015 16:32:38 +0530
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Cc: stewart@linux.vnet.ibm.com, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

The following series implements LED driver for PowerNV platform.

PowerNV platform has below type of indicators:
  - System attention indicator (Check log indicator)
      Indicates there is a problem with the system that needs attention.
  - Identify
      Helps the user locate/identify a particular FRU or resource in the
      system.
  - Fault
      Indicates there is a problem with the FRU or resource at the
      location with which the indicator is associated.

On PowerNV (Non Virtualized) platform OPAL firmware provides LED
information to host via device tree (location code and LED type).
During init we check for 'ibm,opal/led' node in device tree to
enable LED driver. And we use OPAL API's to get/set LEDs.

patch 1/2: PowerNV architecture specific code. This adds necessary
           OPAL APIs.
patch 2/2 is actual LED driver implemenation for PowerNV platform.


changes in v2:
  - Rebased patches on top of mpe's next branch
     https://git.kernel.org/cgit/linux/kernel/git/mpe/linux.git/log/?h=next
  - Added System Attention Indicator support
  - Removed redundant code in leds-powernv.c file

---

Anshuman Khandual (2):
      powerpc/powernv: Add OPAL interfaces for accessing and modifying system LED states
      leds/powernv: Add driver for PowerNV platform


 arch/powerpc/include/asm/opal-api.h            |   29 +
 arch/powerpc/include/asm/opal.h                |    5 
 arch/powerpc/platforms/powernv/opal-wrappers.S |    2 
 arch/powerpc/platforms/powernv/opal.c          |   12 
 drivers/leds/Kconfig                           |    9 
 drivers/leds/Makefile                          |    1 
 drivers/leds/leds-powernv.c                    |  620 ++++++++++++++++++++++++
 7 files changed, 676 insertions(+), 2 deletions(-)
 create mode 100644 drivers/leds/leds-powernv.c

--
Vasant
Signature
