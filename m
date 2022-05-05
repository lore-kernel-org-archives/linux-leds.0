Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D97EC433F5
	for <linux-leds@archiver.kernel.org>; Thu,  5 May 2022 09:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346453AbiEEJSP (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 5 May 2022 05:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245698AbiEEJSN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 May 2022 05:18:13 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427774CD4F
        for <linux-leds@vger.kernel.org>; Thu,  5 May 2022 02:14:32 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6D2493F613;
        Thu,  5 May 2022 11:14:28 +0200 (CEST)
Date:   Thu, 5 May 2022 11:14:26 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: qcom-lpg: Add compatible for
 PM660L LPG block
Message-ID: <20220505091426.ycjejqtkf3hvy4u7@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220504205704.699500-1-marijn.suijten@somainline.org>
 <ec1afdc4-54be-71cd-1873-6959e132a45d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec1afdc4-54be-71cd-1873-6959e132a45d@linaro.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2022-05-05 10:35:20, Krzysztof Kozlowski wrote:
> On 04/05/2022 22:57, Marijn Suijten wrote:
> > Document the availability of an LPG configuration for the PM660L PMIC in
> > the Qualcomm Light Pulse Generator driver.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
> 
> Hmm, there is no such file in next-20220503...

Bjorn's patches got pulled into Pavel's linux-leds tree just yesterday:

    https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/log/?h=for-next

Specifically, this file got added in:

    https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=a8e53db46f19f67be6a26488aafb7d10c78e33bd

They don't seem to be in next-20220504 yet either, but should probably
show up in next-20220505.  This shouldn't prevent the patch from being
picked up for linux-leds though, now that everone is scrambling to send
additional LPG configs in hopes of landing for 5.19 all at once.

- Marijn
