Return-Path: <SRS0=3xN7=XE=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3326CC433EF
	for <linux-leds@archiver.kernel.org>; Mon,  9 Sep 2019 07:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E53421920
	for <linux-leds@archiver.kernel.org>; Mon,  9 Sep 2019 07:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732269AbfIIHQl (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 9 Sep 2019 03:16:41 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:45532 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727546AbfIIHQl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Sep 2019 03:16:41 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 13E211A244A4;
        Mon,  9 Sep 2019 10:16:39 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Subject: v7 EL15203000
Date:   Mon,  9 Sep 2019 10:16:30 +0300
Message-Id: <20190909071632.14392-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

[PATCH v7 1/2] dt-bindings: Add docs for EL15203000
[PATCH v7 2/2] leds: add LED driver for EL15203000 board

Fixed compilation error missing variable led.
Compiled and checked on real device.

