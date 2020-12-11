Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EFEC4361B
	for <linux-leds@archiver.kernel.org>; Fri, 11 Dec 2020 20:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 268C42311A
	for <linux-leds@archiver.kernel.org>; Fri, 11 Dec 2020 20:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394500AbgLKScm (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 11 Dec 2020 13:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390795AbgLKSck (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Dec 2020 13:32:40 -0500
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A608EC0613CF;
        Fri, 11 Dec 2020 10:32:00 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 125D71420AC;
        Fri, 11 Dec 2020 19:31:58 +0100 (CET)
Date:   Fri, 11 Dec 2020 19:31:52 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     Abanoub Sameh <abanoubsameh8@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] leds: led-core: Get rid of enum led_brightness
Message-ID: <20201211193152.7a6e0fbb@nic.cz>
In-Reply-To: <2ae41868b2604a489927b5903529afb4@AcuMS.aculab.com>
References: <20201211014840.1554095-1-abanoubsameh@protonmail.com>
        <20201211135628.1fe1af79@nic.cz>
        <2ae41868b2604a489927b5903529afb4@AcuMS.aculab.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 11 Dec 2020 14:08:43 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> 
> More than 8 bits would be good.
> While not really relevant for actual 'brightness' it allows
> for 'strange' things be encoded in the brightness field.
>
> For instance we have some hardware that has RGB leds on it.
> They are a single device so it really needs a colour property.
> But it is more complex than that, between the driver and LED
> there is an FPGA - so it can modulate the LED output in many ways.
> As well as using PWM to change the brightness and (eg) 1/2HZ flashing
> it is possible to alternate between red and green to get a reasonable
> orange (works better than driving both at the same time!).

Please don't do that. Don't misuse brightness for other settings.
Instead try to implement the settings in other sysfs files, maybe even
make it generic. Document the new sysfs ABI. But to not encode
non-brightness properties into brightness.

For you multicolor example there is multicolor LED framework now in
kernel.

Marek
