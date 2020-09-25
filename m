Return-Path: <SRS0=X9ll=DC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B71EC4363D
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 14:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E404D2074B
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 14:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIYOqf (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Sep 2020 10:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbgIYOqf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 10:46:35 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FEAC0613CE
        for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2020 07:46:35 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id C8863140934;
        Fri, 25 Sep 2020 16:46:32 +0200 (CEST)
Date:   Fri, 25 Sep 2020 16:46:32 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: Re: [PATCH] leds: Add documentation about possible subsystem
 improvements
Message-ID: <20200925164632.22bcd5af@nic.cz>
In-Reply-To: <20200925093318.GB20659@amd>
References: <20200925093318.GB20659@amd>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 25 Sep 2020 11:33:18 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> +* Command line utility to manipulate the LEDs?
> +
> +/sys interface is not really suitable to use by hand, should we have
> +an utility to perform LED control?
> 
> 

I will try to implement ledtool.
