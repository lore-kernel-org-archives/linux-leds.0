Return-Path: <SRS0=BIkm=DD=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9460C2D0A8
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 20:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 223272389F
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 20:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601151097;
	bh=xJ/V+7lqkpIFDz2n60/SL7ZY4eDluGumrF3p7ynr6/c=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=hMOfA22+ZdY1rt6eI1mUXD07fvfwi7Wng1BEqaoXlaj5AeOVVE86BKkVi9WeAlP3d
	 q46cB/QAnIiwYXF0sGLVyp1jFxsv0b0uYXBSiHY0YmIQXyVM3Aon/8EbxXAc+9Px3T
	 gZQsbJTUqiXgerlm+f+hpZcO8g9bz22eexMrGhf0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIZULg (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 26 Sep 2020 16:11:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:54502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbgIZULg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 16:11:36 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51F1223888;
        Sat, 26 Sep 2020 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601151096;
        bh=xJ/V+7lqkpIFDz2n60/SL7ZY4eDluGumrF3p7ynr6/c=;
        h=From:To:Cc:Subject:Date:From;
        b=HK+8+4VlVSOf84CDFsFY3StrLw17W3gbQ+3UqSR9tPBmG2hMZT3xyZknbQRu1WKxt
         dzIe6Eq2E7uhxCogiJlcDz27VXO9E4SsIAsPUBz2ZsSfn1WrSZ8jRdL0DPjn4qHmfB
         Dkq8GqxUwV7pHsBfSmCzpTY7OwVaIW+Pge/00k3U=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v2 0/2] leds: ns2: convert to fwnode API
Date:   Sat, 26 Sep 2020 22:11:29 +0200
Message-Id: <20200926201131.23981-1-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Simon wants to bind this driver without device-tree, so this changes
the binding from specific OF API to generic fwnode API.

This applies to your for-next and Simon tested this on a d2 Network
board.

Marek

Marek Behún (2):
  leds: ns2: convert to fwnode API
  leds: ns2: do not guard OF match pointer with of_match_ptr

 drivers/leds/leds-ns2.c | 69 ++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 36 deletions(-)

-- 
2.26.2

