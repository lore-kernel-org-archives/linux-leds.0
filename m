Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC328C433EF
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 19:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AF6A61165
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 19:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhINUAN (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 14 Sep 2021 16:00:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232168AbhINUAN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 14 Sep 2021 16:00:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 406EF6112D;
        Tue, 14 Sep 2021 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631649535;
        bh=qxZvpq2ObkRabkfCkaDQcK8UnlAi1MYgjse2mQxM8es=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tFb7bPuaRwmBXnVk75kbd8q4cfQewiisZ2SZMXQocsb8hgcX/D/LTLBLhXNYWffWU
         MmTwymsZeThyIuWTuM8bFY1O2Kf423/sxXlZVu+swqbwytLTxO1PQ63Es8w6uDXE/2
         cSB9rcBA88mg+571fnFDlbujUUzWsq2BUwVohYH1DeLzuJuBmyn0fslMFxm/xyySo6
         MICfWG8+lu56lGnBuoF9NedD69jLzvMCGXK2j+mKXhEDqmpL3n7swKFyvbrlwTYDGY
         6MFKm0hnPrFyjV7j9bNY81FjtYbB2hUeWUw52Kj8HoJmKomRYJ7wjkgNUa+6LUJhdH
         mrsdukuo1KZEg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210913192816.1225025-5-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-5-robh@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: clock: arm,syscon-icst: Use 'reg' instead of 'vco-offset' for VCO register address
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>
Date:   Tue, 14 Sep 2021 12:58:53 -0700
Message-ID: <163164953390.763609.10146042852855351507@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Rob Herring (2021-09-13 12:28:12)
> 'reg' is the standard property for defining register banks/addresses. Add
> it to use for the VCO register address and deprecate 'vco-offset'. This
> will also allow for using standard node names with unit-addresses.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
>=20
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
