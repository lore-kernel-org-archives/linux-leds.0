Return-Path: <SRS0=0aWo=CY=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E78C433E2
	for <linux-leds@archiver.kernel.org>; Tue, 15 Sep 2020 22:22:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0BFE20809
	for <linux-leds@archiver.kernel.org>; Tue, 15 Sep 2020 22:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgIOWWp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 15 Sep 2020 18:22:45 -0400
Received: from mail.nic.cz ([217.31.204.67]:43092 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727672AbgIOQ0P (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 15 Sep 2020 12:26:15 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 95BC91409E0;
        Tue, 15 Sep 2020 18:24:37 +0200 (CEST)
Date:   Tue, 15 Sep 2020 18:24:36 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds + devicetree v2 1/2] leds: trigger: add trigger
 sources validating method and helper functions
Message-ID: <20200915182436.6e90f9d0@nic.cz>
In-Reply-To: <20200915152616.20591-2-marek.behun@nic.cz>
References: <20200915152616.20591-1-marek.behun@nic.cz>
        <20200915152616.20591-2-marek.behun@nic.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 15 Sep 2020 17:26:15 +0200
Marek Behún <marek.behun@nic.cz> wrote:

> +	/*
> +	 * Check whether LED has defined valid source for this trigger.
> +	 * If yes, this trigger should be set as default trigger for LED.
> +	 * This should use of_led_count_trigger_sources and
> +	 * of_led_get_trigger_source functions.
> +	 */
> +	bool		(*has_valid_source)(struct led_classdev *led_cdev);

Hmm, the heartbeat and timer triggers do not need trigger sources. If
we want to deprecate linux,default-trigger device tree property for
these triggers also, this method should look to `function` DT property
for heartbeat and timer triggers.

In that case the name should be changed to something like
of_is_valid_default_for, or something like that.

Marek
