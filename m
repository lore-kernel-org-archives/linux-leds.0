Return-Path: <SRS0=Un9t=AX=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD63EC433E0
	for <linux-leds@archiver.kernel.org>; Sun, 12 Jul 2020 21:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67BD52063A
	for <linux-leds@archiver.kernel.org>; Sun, 12 Jul 2020 21:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="PW5DO8/1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgGLVGD (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 12 Jul 2020 17:06:03 -0400
Received: from mail.nic.cz ([217.31.204.67]:35300 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729020AbgGLVGD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jul 2020 17:06:03 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 1805E1409F2;
        Sun, 12 Jul 2020 23:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594587962; bh=K6vTef8cAuowvYGKuz8Q83+36pp6d5hIXVJTXWZNwwQ=;
        h=From:To:Date;
        b=PW5DO8/1mZyd/+yLvz2tegp0sVzbpiG0Ooer2cqgVIZH9NhwGt9YfO8sHh+45RA0U
         xZeNvhnDcMIXfB+yj3omWMWpLBozq917gCEqf7+RtLIcz2KNvN5nFTkvCf/taGV2O8
         a1Sg/ZJPu4oztxmjE3ZUUanzVPen0PhDRn1BqSxQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v3 0/2] Add Turris Omnia LEDs driver
Date:   Sun, 12 Jul 2020 23:05:59 +0200
Message-Id: <20200712210601.5239-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
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

Hi,

so I am sending version 3, this time using the multicolor framework.
These patches should apply on top of Pavel's tree after he applies Dan's
patches adding the multicolor LED framework.

Since all the LEDs are only RGB (there is no other possibility for
different channels nor different order of channels), this driver
registers all LEDs via the multicolor framework. In the device-tree only
the address of the LED needs to be specified, any child nodes describing
the red, green and blue channels are ignored.

Marek

changes since v2:
- using multicolor LED framework now, major rewrite
- added support for global brightness (Omnia has a button which can
  switch between 8 levels of intensity of all the LEDs at once, but
  in reality any value between 0% and 100% can be set, and we want to
  access this setting via software)

Marek Behún (2):
  dt-bindings: leds: add cznic,turris-omnia-leds binding
  leds: initial support for Turris Omnia LEDs

 .../leds/cznic,turris-omnia-leds.yaml         |  82 +++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-omnia.c              | 296 ++++++++++++++++++
 4 files changed, 390 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
 create mode 100644 drivers/leds/leds-turris-omnia.c

-- 
2.26.2

