Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C790C0015E
	for <linux-leds@archiver.kernel.org>; Thu, 13 Jul 2023 13:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbjGMNhF (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 13 Jul 2023 09:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbjGMNhC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Jul 2023 09:37:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C812736;
        Thu, 13 Jul 2023 06:36:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0796E6103B;
        Thu, 13 Jul 2023 13:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3144FC433C7;
        Thu, 13 Jul 2023 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689255410;
        bh=m3VNV6756gNglFZKUKhJnrPJQ9ho6HCDgRZbasSkKHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=srraiFezS/iMcbfJ9sgWW/7fPEvQtQFfG51GMaH1NLzJ7orRWQX7nIs5KjVOEVGPZ
         8pEJT0vUTMsB8jgGdm549bEZtTKaAhRAh8jlwKvsdzHKfmVr4oaQfSeJznZShfl1s4
         ggKSsszMuv4FRszjkd9kHChoCrrTIbtDxGfyYBLkY2i5WJQOaGZ1/TCWA3FPbh2VBO
         Gg59qiDhyD1Olmb7wIIUyCAF+SsVvKaHm3WnWO2RQiNz81/lfIVTFR/INJRYHB2BFx
         0/i0CpvVv9eJEbDav7Ra+gTFJ3ezIwtPtdSoCx1aCkGsRjzU4IJqzN0VkcfjsT1wln
         0YrtxyZZXE09A==
Date:   Thu, 13 Jul 2023 14:36:44 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-leds@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] [RFC] dt-bindings: leds: bd2606mvv: Fix maximum register
 value
Message-ID: <20230713133644.GV10768@google.com>
References: <20230704202929.91962-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230704202929.91962-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 04 Jul 2023, Marek Vasut wrote:

> Since the chip can drive up to 6 lines, the maximum
> register number should be only 5, not 6.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
