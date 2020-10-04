Return-Path: <SRS0=VAXg=DL=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D419C4363C
	for <linux-leds@archiver.kernel.org>; Sun,  4 Oct 2020 09:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F2EE206C1
	for <linux-leds@archiver.kernel.org>; Sun,  4 Oct 2020 09:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJDJ64 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 4 Oct 2020 05:58:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49770 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDJ64 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 4 Oct 2020 05:58:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 802831C0B79; Sun,  4 Oct 2020 11:58:54 +0200 (CEST)
Date:   Sun, 4 Oct 2020 11:58:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Beh??n <marek.behun@nic.cz>
Cc:     netdev@vger.kernel.org, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>,
        Ond??ej Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH net-next v1 2/3] net: phy: add API for LEDs controlled by
 ethernet PHY chips
Message-ID: <20201004095852.GB1104@bug>
References: <20200908000300.6982-1-marek.behun@nic.cz>
 <20200908000300.6982-3-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908000300.6982-3-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Many an ethernet PHY supports various HW control modes for LEDs
> connected directly to the PHY chip.
> 
> This patch adds code for registering such LEDs when described in device
> tree and also adds a new private LED trigger called phydev-hw-mode.
> When this trigger is enabled for a LED, the various HW control modes
> which are supported by the PHY for given LED cat be get/set via hw_mode
> sysfs file.
> 
> A PHY driver wishing to utilize this API needs to implement all the
> methods in the phy_device_led_ops structure.
> 
> Signed-off-by: Marek Beh??n <marek.behun@nic.cz>


>  	select MDIO_I2C
>  
> +config PHY_LEDS
> +	bool
> +	default y if LEDS_TRIGGERS
> +
>  comment "MII PHY device drivers"
>  
>  config AMD_PHY

> +/* drivers/net/phy/phy_hw_led_mode.c
> + *

Stale comment.

> +	init_data.fwnode = &np->fwnode;
> +	init_data.devname_mandatory = true;
> +	snprintf(devicename, sizeof(devicename), "phy%d", phydev->phyindex);
> +	init_data.devicename = devicename;
> +
> +	ret = phydev->led_ops->led_init(phydev, led, &pdata);
> +	if (ret < 0)
> +		goto err_free;
> +
> +	ret = devm_led_classdev_register_ext(&phydev->mdio.dev, &led->cdev, &init_data);
> +	if (ret < 0)
> +		goto err_free;
> +
> +	led->flags |= PHY_DEVICE_LED_REGISTERED;
> +
> +	return 0;
> +err_free:
> +	devm_kfree(&phydev->mdio.dev, led);
> +	return ret;

devm should take care of freeing, right?

Plus, format comments to 80 colums. checkpatch no longer warns, but rule still exists.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
