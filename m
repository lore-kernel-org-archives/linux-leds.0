Return-Path: <SRS0=T4uw=C6=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BCFC43463
	for <linux-leds@archiver.kernel.org>; Mon, 21 Sep 2020 08:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94DF52076B
	for <linux-leds@archiver.kernel.org>; Mon, 21 Sep 2020 08:31:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgIUIbP (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 21 Sep 2020 04:31:15 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47184 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUIbJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2020 04:31:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C0A911C0B7A; Mon, 21 Sep 2020 10:31:06 +0200 (CEST)
Date:   Mon, 21 Sep 2020 10:31:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Adrian Schmutzler <mail@adrianschmutzler.de>,
        linux-leds@vger.kernel.org
Subject: Re: How to name multiple LEDs of the same type and color
Message-ID: <20200921083106.GA13539@ucw.cz>
References: <00ab01d68eca$d2d4fcc0$787ef640$@adrianschmutzler.de>
 <20200920110810.GA15219@duo.ucw.cz>
 <00f701d68fa6$2778ce60$766a6b20$@adrianschmutzler.de>
 <20200921030044.304f0d5c@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921030044.304f0d5c@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!


> > My main interest here was/is that I started to evaluate how OpenWrt can migrate from LED labels to the "new" color/function syntax and to me the rssi leds are a dedicated type that should be supported.
> > So I fear I won't be helpful for the implementation of RSSI leds in the kernel in general.

Yep, I guess staying with old "label" is the right solution for you
for now.

> > For the three leds vs. set of leds discussion: Note that we are interested in (and already do) exposing each LED to the user individually (in user-space via sysfs), so the user can redefine the purpose of the LED freely based on his/her desire. Therefore, a total abstraction of the set of LEDs as a single entity would be detrimental for us here.
> > 
> 
> This is interesting. How does this work? Better signal => faster
> blinking?

I suspect it is "no signal" -> "all LEDs off". "weak signal" -> "one
LED on", "medium signal" -> "two LEDs on", "string signal" -> "three
LEDs on".

Best regards,
								Pavel


