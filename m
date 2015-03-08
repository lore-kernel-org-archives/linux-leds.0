From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH 0/2] LED interface for PowerNV platform
Date: Sun, 08 Mar 2015 16:43:57 +0530
Message-ID: <20150308110558.3759.72635.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp09.in.ibm.com ([122.248.162.9]:43495 "EHLO
	e28smtp09.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932AbbCHLOJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 8 Mar 2015 07:14:09 -0400
Received: from /spool/local
	by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Sun, 8 Mar 2015 16:44:06 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 4FAF4125804F
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2015 16:45:29 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t28BE1Uh23920730
	for <linux-leds@vger.kernel.org>; Sun, 8 Mar 2015 16:44:01 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t28BE2Ls005277
	for <linux-leds@vger.kernel.org>; Sun, 8 Mar 2015 16:44:03 +0530
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Cc: mpe@ellerman.id.au, khandual@linux.vnet.ibm.com, cooloney@gmail.com, rpurdie@rpsys.net, benh@kernel.crashing.org

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
enabled LED driver. And we use OPAL API's to get/set LEDs.

patch 1/2: PowerNV architecture specific code. This adds necessary
  OPAL APIs.
patch 2/2 is actual LED driver implemenation for PowerNV platform.

TODO:
  - Add support for System Attention Indicator
---
Anshuman Khandual (2):
      powerpc/powernv: Add OPAL interfaces for accessing and modifying system LED states
      leds/powernv: Add driver for PowerNV platform


 arch/powerpc/include/asm/opal.h                |   19 +
 arch/powerpc/platforms/powernv/opal-wrappers.S |    2 
 arch/powerpc/platforms/powernv/opal.c          |   12 
 drivers/leds/Kconfig                           |    9 
 drivers/leds/Makefile                          |    1 
 drivers/leds/leds-powernv.c                    |  599 ++++++++++++++++++++++++
 6 files changed, 635 insertions(+), 7 deletions(-)
 create mode 100644 drivers/leds/leds-powernv.c

--
Vasant
Signature
