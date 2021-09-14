Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74982C4332F
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 08:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50BD561107
	for <linux-leds@archiver.kernel.org>; Tue, 14 Sep 2021 08:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhINI1N (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 14 Sep 2021 04:27:13 -0400
Received: from foss.arm.com ([217.140.110.172]:41000 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229605AbhINI1M (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 14 Sep 2021 04:27:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACE7F101E;
        Tue, 14 Sep 2021 01:25:55 -0700 (PDT)
Received: from bogus (unknown [10.57.23.241])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D3FA3F719;
        Tue, 14 Sep 2021 01:25:53 -0700 (PDT)
Date:   Tue, 14 Sep 2021 09:25:35 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 6/8] ARM: dts: arm: Update register-bit-led nodes 'reg'
 and node names
Message-ID: <20210914082535.v4ivszrddw45ajpm@bogus>
References: <20210909213118.1087083-1-robh@kernel.org>
 <20210909213118.1087083-7-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909213118.1087083-7-robh@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 09, 2021 at 04:31:16PM -0500, Rob Herring wrote:
> Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> The 'reg' entry is the LED control register address. With this, the node
> name can be updated to use a generic node name, 'led', and a
> unit-address.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>

(For Juno and MPS2)

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
