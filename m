Return-Path: <SRS0=6iJU=A3=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4369C433E2
	for <linux-leds@archiver.kernel.org>; Thu, 16 Jul 2020 11:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B281220657
	for <linux-leds@archiver.kernel.org>; Thu, 16 Jul 2020 11:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="yTIBDrgW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgGPLkw (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 16 Jul 2020 07:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgGPLkv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 07:40:51 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949CAC08C5CE
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2020 04:40:51 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 07141140A88;
        Thu, 16 Jul 2020 13:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594899649; bh=aYMZrjhv1UBQSCRla0lhAiVRWYCRYiNz4DNJEQvJ8Rs=;
        h=From:To:Date;
        b=yTIBDrgW+dbN5gfzxM30dJ3YybLr8OfVXEQeDTw9Rd2Hrog+87vW5WZNyypgfUetQ
         7QUU7L5BBahw/z/fLVpjcZO05qXw2tgFNTgNA9hPXIQxTTyn9Guga63mWgKvDUKpT8
         v+f5vkXU4x7alBGdrdoFGp8Yi2zBmUfWUU/vHYnw=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v5 0/3] Add Turris Omnia LEDs driver
Date:   Thu, 16 Jul 2020 13:40:44 +0200
Message-Id: <20200716114047.22943-1-marek.behun@nic.cz>
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

this version addresses some of Dan's suggestions. Uses the multicolor
framework.

Marek

changes since v4:
- fixed a typo in dt-binding
- change to dt-binding documentation as suggested by Dan Murphy so that
  it is less confusing
- cleaning up some things in the code addressed by Dan Murphy
- added sysfs ABI documentation for the brightness file controlling the
  brightness of the whole panel

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

Marek Behún (3):
  dt-bindings: leds: add cznic,turris-omnia-leds binding
  leds: initial support for Turris Omnia LEDs
  Documentation: ABI: leds-turris-omnia: document sysfs attribute

 .../sysfs-class-led-driver-turris-omnia       |  14 +
 .../leds/cznic,turris-omnia-leds.yaml         |  88 ++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-omnia.c              | 293 ++++++++++++++++++
 5 files changed, 407 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
 create mode 100644 drivers/leds/leds-turris-omnia.c

-- 
2.26.2

