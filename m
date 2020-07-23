Return-Path: <SRS0=tL0n=BC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE59C433E1
	for <linux-leds@archiver.kernel.org>; Thu, 23 Jul 2020 12:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C18602086A
	for <linux-leds@archiver.kernel.org>; Thu, 23 Jul 2020 12:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="MleRE5rs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgGWMxZ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 23 Jul 2020 08:53:25 -0400
Received: from mail.nic.cz ([217.31.204.67]:48430 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbgGWMxZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Jul 2020 08:53:25 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id D2412140A70;
        Thu, 23 Jul 2020 14:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595508803; bh=IQReeDJ9c8I9/xKdViVi48C2pN777OMUIhXFTeEMiOM=;
        h=From:To:Date;
        b=MleRE5rsGqxcc64lfz8Norx9yla3Wei0Y9amJbk9Qmb1x8mFlfoYbLCxYBo9/wBTo
         emKyYDVwAwK7LaoKdkmRwVm/bFUGRvn1y5N/SKcdPq3la/1pp9wCSyE9NUKnQ96cDH
         05Mnp1YzmJVulINQV68n7GLYYAA+A0cXnrcCo7P4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v7 3/3] Documentation: ABI: leds-turris-omnia: document sysfs attribute
Date:   Thu, 23 Jul 2020 14:53:20 +0200
Message-Id: <20200723125320.3572-4-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723125320.3572-1-marek.behun@nic.cz>
References: <20200723125320.3572-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document the global brightness attribute for the Turris Omnia LED
controller.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 .../testing/sysfs-class-led-driver-turris-omnia    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia

diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
new file mode 100644
index 000000000000..795a5de12fc1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
@@ -0,0 +1,14 @@
+What:		/sys/class/leds/<led>/device/brightness
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(RW) On the front panel of the Turris Omnia router there is also
+		a button which can be used to control the intensity of all the
+		LEDs at once, so that if they are too bright, user can dim them.
+
+		The microcontroller cycles between 8 levels of this global
+		brightness (from 100% to 0%), but this setting can have any
+		integer value between 0 and 100. It is therefore convenient to be
+		able to change this setting from software.
+
+		Format: %i
-- 
2.26.2

