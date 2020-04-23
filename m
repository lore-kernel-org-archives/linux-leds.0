Return-Path: <SRS0=GEog=6H=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9765EC2BA19
	for <linux-leds@archiver.kernel.org>; Thu, 23 Apr 2020 06:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 722E121582
	for <linux-leds@archiver.kernel.org>; Thu, 23 Apr 2020 06:51:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="PAe81+iM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgDWGvC (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 23 Apr 2020 02:51:02 -0400
Received: from mail.nic.cz ([217.31.204.67]:49586 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgDWGvC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Apr 2020 02:51:02 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 75D03140A69;
        Thu, 23 Apr 2020 08:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1587624660; bh=/t3Mk/37URq5QsLaiumu9A3H7AZZTBDPxwPKkoyp+is=;
        h=From:To:Date;
        b=PAe81+iMDx28lGHFvP7SJVznLp8T3CtNJxVEOblJoVf3ZwFkI7KfCPImK7MXX7xFM
         PQTBMmd2CkoUJwE8V1e2LGrAd7KjfsJ5g8dkhWexvGSkZE4/xbyNpOf0o2pSv9CIKN
         JNO1wPvh2SYxbjDC1io4YvY1PyIKZUACMqjS7hm4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v2 0/2] Add Turris Omnia LEDs driver
Date:   Thu, 23 Apr 2020 08:50:58 +0200
Message-Id: <20200423065100.2652-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The only changes from previous version is that MAINTAINERS file is not
updated. This will be done separately through another tree.

Marek

Marek Behún (2):
  dt-bindings: leds: add cznic,turris-omnia-leds binding
  leds: initial support for Turris Omnia LEDs

 .../leds/cznic,turris-omnia-leds.yaml         | 113 +++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-omnia.c              | 285 ++++++++++++++++++
 4 files changed, 410 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
 create mode 100644 drivers/leds/leds-turris-omnia.c

-- 
2.24.1

