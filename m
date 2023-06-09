Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1041BC7EE29
	for <linux-leds@archiver.kernel.org>; Fri,  9 Jun 2023 06:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238410AbjFIGlx (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238499AbjFIGlh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Jun 2023 02:41:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CA53A9A;
        Thu,  8 Jun 2023 23:41:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AEDA1653FB;
        Fri,  9 Jun 2023 06:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274D4C4339B;
        Fri,  9 Jun 2023 06:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686292878;
        bh=SaFlvbKasVsUXdcHrpaqFf2oR236orijsGhSHOUvvxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FhMROm0UXT15Z4DB45xcucBsiRCXgv0Coi0z6XANYw8xVAR/f1spIX80P5QJp7thX
         I5SR0W6DBplwphakHuSgLW2i9Nd+vATV/sydY6FyMlbAlOG2oHiNQBU0pqOKoZNZb8
         boO3u1IlLMGaZnitp4O8o6kvDA5u0yth2HNXsaLHOqc/tWIQtnvEbLW4+DlsM3Xqsl
         FQPKDeIHMnmw85ZIh1CaYmqOscMc5p4pSq+UnYhZPgz2tAvuxe4f1iejFg2xZ9fbxP
         xtiXcJcIucqbHsHg9hK+2vWkIKtu9L+bojq2Fa4bg3Ts13IzroE2NXi6wYE5HtVx6a
         djOIEVrGhpMjQ==
Date:   Fri, 9 Jun 2023 07:41:11 +0100
From:   Lee Jones <lee@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     pavel@ucw.cz, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: leds: leds-mt6323: Document mt6332
 compatible
Message-ID: <20230609064111.GE3635807@google.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
 <20230601110813.2373764-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230601110813.2373764-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 01 Jun 2023, AngeloGioacchino Del Regno wrote:

> Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6323.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
