Return-Path: <SRS0=7Jdc=DE=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168E4C2D0A8
	for <linux-leds@archiver.kernel.org>; Sun, 27 Sep 2020 01:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D14A72371F
	for <linux-leds@archiver.kernel.org>; Sun, 27 Sep 2020 01:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgI0BNI (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 26 Sep 2020 21:13:08 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:57592 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbgI0BNI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 21:13:08 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kMLFS-00GKzd-K5; Sun, 27 Sep 2020 03:13:06 +0200
Date:   Sun, 27 Sep 2020 03:13:06 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     netdev <netdev@vger.kernel.org>, linux-leds@vger.kernel.org,
        David Miller <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: Request for Comment: LED device naming for netdev LEDs
Message-ID: <20200927011306.GE3889809@lunn.ch>
References: <20200927004025.33c6cfce@nic.cz>
 <20200927002935.GA3889809@lunn.ch>
 <20200927024522.06df813f@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927024522.06df813f@nic.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> So I will have
>   /sys/class/net/eth0/phydev/leds/eth0:green:activity
>                  |        |
>                  symlink  |
>                           |
>                         symlink
> 
> and I will also have
>   /sys/class/leds/eth0:green:activity
>                   |
>                   symlink

So this forces the name to be globally unique, not netns unique. So
you cannot use the interface name alone.

i don't think the name is actually too important. You are going to
find it via /sys/class/net/eth0/phydev/leds/eth0:green:activity so the
proposal of an incremental number works.

    Andrew
