Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7272C636D6
	for <linux-leds@archiver.kernel.org>; Wed, 22 Feb 2023 15:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjBVPWV (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 22 Feb 2023 10:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjBVPWU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Feb 2023 10:22:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EB02D161;
        Wed, 22 Feb 2023 07:22:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD666612AE;
        Wed, 22 Feb 2023 15:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F29CC433D2;
        Wed, 22 Feb 2023 15:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677079338;
        bh=TvHZb1o1kEbSmakR0tXvd95pDlA0fZOcNx0guDBX8Jw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LSPOeUlhk3CXuHpUqiJk1G+Py4V4FyrG2naBbVwhlMffTVMC8F/9Mu4z5TrjGf60c
         QqvgcEr6LTZHreaItWRTMMDkaprr+ODTn9Q45CIE4LYbjpZmdi2XlCnlxGYBx5udgj
         /gZEBIaTmvj4ET1NfRfPo8rlgXJerSMaZcKTOk21fcIiX8zipruxgHDgCfR4vPwwvv
         eVYoNCfv7nJ94HvY5dV7uYz9Y/qLLMlrsM66Mt92o3c6Z1L3+x3GDvpA26P9euldTo
         rViOO+Ad79ohKPgeECsKurDKvIBF5xe4MZe4O0HQUCPdbELdaHgePqnlJlQFNTfG+Y
         g+QhX6UDnsA0w==
Date:   Wed, 22 Feb 2023 15:22:13 +0000
From:   Lee Jones <lee@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        thunder.leizhen@huawei.com, festevam@gmail.com
Subject: Re: [PATCH v5] dt-bindings: leds: Document commonly used LED triggers
Message-ID: <Y/YzJSJ6PdFig1fb@google.com>
References: <20230213070827.5085-1-manivannan.sadhasivam@linaro.org>
 <20230213072311.GC4375@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213072311.GC4375@thinkpad>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Feb 2023, Manivannan Sadhasivam wrote:

> On Mon, Feb 13, 2023 at 12:38:27PM +0530, Manivannan Sadhasivam wrote:
> > Document the commonly used LED triggers by the SoCs. Not all triggers
> > are documented as some of them are very application specific. Most of the
> > triggers documented here are currently used in devicetrees of many SoCs.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Changes in v5:
> > 
> > * Rebased on top of v6.2-rc1
> 
> Noticed that Lee is now maintaining LED subsystem after sending v5.
> So rebased the patch on top of lee/for-leds-next branch and sent v6.

You can normally just work on top of -next.

-- 
Lee Jones [李琼斯]
