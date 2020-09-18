Return-Path: <SRS0=RXXv=C3=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8D4C43464
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 17:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F12821734
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 17:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgIRROJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgIRROJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Sep 2020 13:14:09 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A361C0613CE;
        Fri, 18 Sep 2020 10:14:09 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 394E514093B;
        Fri, 18 Sep 2020 19:14:06 +0200 (CEST)
Date:   Fri, 18 Sep 2020 19:14:05 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds v1 10/10] leds: ns2: refactor and use struct
 led_init_data
Message-ID: <20200918191405.516b51ff@nic.cz>
In-Reply-To: <20200918130206.GE29951@kw.sim.vm.gnt>
References: <20200916231650.11484-1-marek.behun@nic.cz>
        <20200916231650.11484-11-marek.behun@nic.cz>
        <20200918130206.GE29951@kw.sim.vm.gnt>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Sep 2020 15:02:06 +0200
Simon Guinot <simon.guinot@sequanux.org> wrote:

> On Thu, Sep 17, 2020 at 01:16:50AM +0200, Marek Behún wrote:
> 
> Hi Marek,
> 
> > By using struct led_init_data when registering we do not need to parse
> > `label` DT property nor `linux,default-trigger` property.
> > 
> > Also, move forward from platform data to device tree only:
> > since commit c7896490dd1a ("leds: ns2: Absorb platform data") the
> > platform data structure is absorbed into the driver, because nothing
> > else in the source tree used it. Since nobody complained and all usage  
> 
> Well, I probably should have...
> 
> I am using this driver on the Seagate Superbee NAS devices. This devices
> are based on a x86 SoC. Since I have been unable to get from the ODM the
> LED information written in the ACPI tables, then platform data are used
> to pass the LED description to the driver.
> 
> The support of this boards is not available mainline yet but it is still
> on my todo list. So that's why I am complaining right now :) If it is
> not too much trouble I'd like to keep platform data support in this
> driver.
> 
> Thanks in advance.
> 
> Simon
> 

Simon, what if we refactored the driver to use fwnode API instead of OF
API? Then if it is impossible for you to write DTS for that device,
instead of platform data you could implement your device via swnode
fwnodes. :)

static const struct property_entry entries[] = {
	PROPERTY_ENTRY_STRING("compatible", "lacie,ns2-leds"),
	...
};

Look at
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/chrome/chromeos_laptop.c?h=v5.9-rc5
search for PROPERTY_ENTRY.

I am willing to work on this with you, but I would really like to rid
the LED drivers of platform data.

Marek
