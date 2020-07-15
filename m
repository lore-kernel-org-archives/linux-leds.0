Return-Path: <SRS0=yo7I=A2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B103CC433E0
	for <linux-leds@archiver.kernel.org>; Wed, 15 Jul 2020 12:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 789C9206D5
	for <linux-leds@archiver.kernel.org>; Wed, 15 Jul 2020 12:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="xRTnzRDB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgGOMkh (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 15 Jul 2020 08:40:37 -0400
Received: from lists.nic.cz ([217.31.204.67]:52124 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728656AbgGOMkg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Jul 2020 08:40:36 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 25C73140968;
        Wed, 15 Jul 2020 14:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594816835; bh=tSIIxWOHBtiM/9rHbjeapqUBb7YpDvR/c/R17zuG6+c=;
        h=From:To:Date;
        b=xRTnzRDBFdHvXN1x/ZQfjdlQPeQ2qJ31U6oTcwinfk11WJE35SxyRe4kcbOOVpCNs
         SRKfzg02yvXmE2yNdWCqWKEbU2PJjxYe50fJTRRu/aLb5SLtauROrEkZpieo/vEyZy
         QpEMHMWmwYq1WsvxxcAJgQQVCJlxrJmRO0IweZaw=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v4 0/2] Add Turris Omnia LEDs driver
Date:   Wed, 15 Jul 2020 14:40:32 +0200
Message-Id: <20200715124034.9804-1-marek.behun@nic.cz>
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

this version addresses Jacek's and Rob's discussion, see changes.
This applies on top of Pavel's tree after applying Dan's multicolor
framework patches (v30). Also on Linus' master tree the same way.

Marek

changes since v3:
- added a note in yaml scheme to the description of multi-led property
  that no subnodes for the specific channels are needed since this
  controller only supports RGB LEDs. A comment into the device-tree
  example in the yaml scheme is added saying the same thing.

changes since v2:
- using multicolor LED framework now, major rewrite
- added support for global brightness (Omnia has a button which can
  switch between 8 levels of intensity of all the LEDs at once, but
  in reality any value between 0% and 100% can be set, and we want to
  access this setting via software)

Marek Behún (2):
  dt-bindings: leds: add cznic,turris-omnia-leds binding
  leds: initial support for Turris Omnia LEDs

 .../leds/cznic,turris-omnia-leds.yaml         |  88 ++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-omnia.c              | 296 ++++++++++++++++++
 4 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
 create mode 100644 drivers/leds/leds-turris-omnia.c

-- 
2.26.2

