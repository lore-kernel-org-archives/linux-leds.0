Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBB2C4361B
	for <linux-leds@archiver.kernel.org>; Mon, 14 Dec 2020 03:04:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6600C20725
	for <linux-leds@archiver.kernel.org>; Mon, 14 Dec 2020 03:04:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgLNDEF (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 13 Dec 2020 22:04:05 -0500
Received: from lists.nic.cz ([217.31.204.67]:58868 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbgLNDEF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 13 Dec 2020 22:04:05 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 4B8EB140005;
        Mon, 14 Dec 2020 04:03:24 +0100 (CET)
Date:   Mon, 14 Dec 2020 04:03:17 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     <pavel@ucw.cz>, <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] drivers: leds: simplify the return expression of
 register_nasgpio_led()
Message-ID: <20201214040317.4c34ec76@nic.cz>
In-Reply-To: <20201210135657.1435-1-zhengyongjun3@huawei.com>
References: <20201210135657.1435-1-zhengyongjun3@huawei.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

subject prefix should be

leds: ss4200: simplify the return expression of register_nasgpio_led
