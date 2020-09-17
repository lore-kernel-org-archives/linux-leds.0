Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817FDC433E2
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 15:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AF642224D
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 15:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbgIQP2y (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 11:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgIQPZn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 11:25:43 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280A6C06178A;
        Thu, 17 Sep 2020 08:25:08 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id AC959140A3F;
        Thu, 17 Sep 2020 17:24:22 +0200 (CEST)
Date:   Thu, 17 Sep 2020 17:24:22 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        Ond??ej Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds v1 06/10] leds: pm8058: use struct led_init_data
 when registering
Message-ID: <20200917172422.5924d3af@nic.cz>
In-Reply-To: <20200917004625.GJ1893@yoga>
References: <20200916231650.11484-1-marek.behun@nic.cz>
        <20200916231650.11484-7-marek.behun@nic.cz>
        <20200917004625.GJ1893@yoga>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 16 Sep 2020 19:46:25 -0500
Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> The pdev->dev -> dev and of_node changes are reasonable, but shouldn't
> be part of this patch. It simply makes it hard to reason about he actual
> change.
> 
> Please respin this with only the introduction of led_init_data.
> 
> Thanks,
> Bjorn
> 
Am working on this :)
