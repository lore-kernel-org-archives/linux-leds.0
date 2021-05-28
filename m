Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3A7C4708C
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 06:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80128613DD
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 06:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhE1Gpe (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 May 2021 02:45:34 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:42089 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhE1Gpe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 02:45:34 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 9031522239;
        Fri, 28 May 2021 08:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622184238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yXXSJzxAUmVNLhZeASW5jbLgZYp5eaEL/vUwOyOALjY=;
        b=oVJbRpVc9xvCzFzNzKSWirQ6UBFhS4I5lJ73obWHxBNj14p/UOiAGiBO7nv5gBYsLZV0PK
        qymLOpiLYCp4mYZ2lJZ0cO7Hh2fzNBkKbiKBSpRplZdq6DuRf8zDNz0EYlZ38jaMq2aAuc
        sB+UxzYZGkHfK5tJMVpSNPjQOKyij6k=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 28 May 2021 08:43:58 +0200
From:   Michael Walle <michael@walle.cc>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] pinctrl: Add RTL8231 pin control and GPIO support
In-Reply-To: <b7660b9deff694f7a00431b7e4706635fd4aa2be.camel@svanheule.net>
References: <cover.1621809029.git.sander@svanheule.net>
 <185e8c61893502575c542750c8f27b09029e3078.1621809029.git.sander@svanheule.net>
 <452144b056cb474321481c011ac9ccfb@walle.cc>
 <b7660b9deff694f7a00431b7e4706635fd4aa2be.camel@svanheule.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2fc281bfdbb108a956913779577f5b99@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am 2021-05-28 08:42, schrieb Sander Vanheule:
> On Fri, 2021-05-28 at 08:29 +0200, Michael Walle wrote:
>> > +       gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
>> > +       gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
>> > +       gpio_cfg.reg_dir_in_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DIR0);
>> 
>> Btw. you'd only need GPIO_REGMAP_ADDR(x) if x might be 0. Because you
>> have
>> a constant != 0 there, you could save the GPIO_REGMAP_ADDR() call. You
>> could drop this if you like, but no need to respin the series for 
>> this.
> 
> I will need to respin this series anyway, so I can drop the 
> GPIO_REGMAP_ADDR()
> calls. I was aware they are no-ops in this case, as register address 0 
> is not
> used for the GPIO functions, so mainly included them as a form of 
> documentation.

It's up to you if you like to change it or keep it.

-michael
