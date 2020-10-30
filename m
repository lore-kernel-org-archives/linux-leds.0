Return-Path: <SRS0=i1Fh=EF=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10D7C00A89
	for <linux-leds@archiver.kernel.org>; Fri, 30 Oct 2020 05:02:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 125AD221F9
	for <linux-leds@archiver.kernel.org>; Fri, 30 Oct 2020 05:02:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJ3FCj (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 30 Oct 2020 01:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3FCj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Oct 2020 01:02:39 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64053C0613CF
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 22:02:39 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id B42141409B1;
        Fri, 30 Oct 2020 06:02:36 +0100 (CET)
Date:   Fri, 30 Oct 2020 06:02:29 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: led_classdev->dev is a pointer. Do we want to change it?
Message-ID: <20201030060229.25610754@nic.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel,

various device classes in kernel embed struct device by value, instead
of as a pointer (for example struct mdio_device or struct net_device).

Would you be interested in this for struct led_classdev, or do you
prefer struct led_classdev to have the underlying struct device as a
pointer?

The benefit would be that dev->priv would be free to use by the LED
driver directly. Currently this pointer points to the struct
led_classdev.

Marek
