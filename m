Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9C9C433F5
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 20:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 610606113B
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 20:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbhINUBV (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 14 Sep 2021 16:01:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233929AbhINUBH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 14 Sep 2021 16:01:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1514E61107;
        Tue, 14 Sep 2021 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631649590;
        bh=ttsGooB3NEJfRQZomFeXbeFS0nz6PX5UINAWPJsLC44=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dBKRcAdgI7q4J8YNisHk34wH/aEGN5EE2bTLvYM1hYjIAq91qwHPUSVlGr3YX3NXb
         KEvQ9qH8eB4pMCSsazrrCVawAPiqNY/7qRttzwVnnEwG9iQaZ04xRSc+23q/3uAVjy
         sXiV0FPcczf62soOOZfbLsg1JW8rKoYPcZOl9qm3tRSGDyj53nxGdrETt/rDLc/80I
         qGc75cDNMEk60ggOzvxJKY9tvkaEdgd2y1btllcohtxqgOtA3korkuHzapEGP0gPGW
         YvhFaf29njvi4/YR5lVa23fJofwA1nNQjvjbyTw6Q8ESKiPOSWNBqXZGeT39WeCXre
         jJwT4iad1eUBQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210913192816.1225025-6-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-6-robh@kernel.org>
Subject: Re: [PATCH v2 5/8] clk: versatile: clk-icst: Support 'reg' in addition to 'vco-offset' for register address
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>
Date:   Tue, 14 Sep 2021 12:59:48 -0700
Message-ID: <163164958886.763609.7483570624844319215@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Rob Herring (2021-09-13 12:28:13)
> The ICST binding now also supports 'reg' in addition to 'vco-offset' for
> the VCO register address. Add support to the driver to get the VCO
> address from 'reg'.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

I don't think this driver is changing much so you can take it through DT
tree if you prefer.
