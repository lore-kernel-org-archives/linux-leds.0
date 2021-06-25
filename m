Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FF5C48BC2
	for <linux-leds@archiver.kernel.org>; Fri, 25 Jun 2021 20:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B71161988
	for <linux-leds@archiver.kernel.org>; Fri, 25 Jun 2021 20:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhFYUlj (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Jun 2021 16:41:39 -0400
Received: from lists.nic.cz ([217.31.204.67]:49216 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229629AbhFYUlj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Jun 2021 16:41:39 -0400
Received: from thinkpad (unknown [172.20.6.87])
        by mail.nic.cz (Postfix) with ESMTPSA id D251C140A51;
        Fri, 25 Jun 2021 22:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1624653557; bh=u6EMeSK1Qnlc29tD+E2egIEvb4ysZ1mRyK+uKuoRxgM=;
        h=Date:From:To;
        b=PY0v4FA6SF/ENMySW5FyqcEySryDtRT1HDaHe8RbkVoFR+l7QHRIyh31TQ0XClzsu
         8QW2FStFeiJWtKarsepfUSun4pyoxxYRsSN/Tl/nGjBdzniUhampNA/1rAmeVxjN/t
         ZuiD/7pzr9DyQpllBPGrc1Zi4eMDNZrb+KLDD5FI=
Date:   Fri, 25 Jun 2021 22:39:16 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/18] auxdisplay: ht16k33: Add segment display LED
 support
Message-ID: <20210625223916.7e00e710@thinkpad>
In-Reply-To: <20210625125902.1162428-19-geert@linux-m68k.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
        <20210625125902.1162428-19-geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 25 Jun 2021 14:59:02 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Instantiate a single LED for a segment display.  This allows the user to
> control display brightness and blinking through the LED class API and
> triggers, and exposes the display color.
> The LED will be named "auxdisplay:<color>:backlight".

What if there are multiple "auxdisplay"s ?
Doesn't this subsystem have IDs? So that you can use auxdisplayN for
device name, for example?


> +	of_property_read_u32(node, "color", &color);
> +	seg->led.name = devm_kasprintf(dev, GFP_KERNEL,
> +			"auxdisplay:%s:" LED_FUNCTION_BACKLIGHT,
> +			color < LED_COLOR_ID_MAX ? led_colors[color] : "");

If you use devm_led_classdev_register_ext and pass struct
led_init_data, LED core will generate name of the LED itself.

Marek
