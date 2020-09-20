Return-Path: <SRS0=P4mj=C5=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F1FC43463
	for <linux-leds@archiver.kernel.org>; Sun, 20 Sep 2020 17:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6617720866
	for <linux-leds@archiver.kernel.org>; Sun, 20 Sep 2020 17:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgITRfG (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 20 Sep 2020 13:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgITRfG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 13:35:06 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82133C061755
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 10:35:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 83E0C1409ED;
        Sun, 20 Sep 2020 19:35:03 +0200 (CEST)
Date:   Sun, 20 Sep 2020 19:35:03 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds + devicetree 02/13] leds: tca6507: use fwnode API
 instead of OF
Message-ID: <20200920193503.735bc66c@nic.cz>
In-Reply-To: <BD25CCC6-343D-4624-9718-276B3C7C6510@goldelico.com>
References: <20200919221548.29984-1-marek.behun@nic.cz>
        <20200919221548.29984-3-marek.behun@nic.cz>
        <BD25CCC6-343D-4624-9718-276B3C7C6510@goldelico.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Sep 2020 19:10:19 +0200
H. Nikolaus Schaller <hns@goldelico.com> wrote:

> I wanted to test, but was not able to git am this patch to my working
> environment (v5.9-rc5 or linux-next). So maybe some prerequisite is missing.

Could you try applying on Pavel's for-next?

https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/log/?h=for-next

Marek
