Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E558C7EE25
	for <linux-leds@archiver.kernel.org>; Fri,  9 Jun 2023 06:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237827AbjFIGnL (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238179AbjFIGnE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Jun 2023 02:43:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCA030FF;
        Thu,  8 Jun 2023 23:42:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2ACC0653FB;
        Fri,  9 Jun 2023 06:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AD0C433EF;
        Fri,  9 Jun 2023 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686292978;
        bh=3C820+sLF1Qo0KQ8JukshV36YkUy2TT3VMBrbClPpdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LJHJDsGkST7uYnEg3EjT+s/6BFoAOACcT9ZU/1m0YT2snxgYve3zdvjlwhq2pVeZW
         JMMBDpztQbmG2o6xBdjGxKnbsTSI7LF8iX0jZjX+Z7rMp3C/m3WwEa61juNvwgZF8Y
         7sBFOVE496HMAxlhMdJSMC6SCEAWC8sJKDewOqdYiSeoAeSFNGvW/VtdDzNqhJggt7
         Nglp9tYXgXxUpp2ytT3+XVj1CPvjXTWFm1C7ogo3sPZ380qNjKZ2NHaP64TZRfZnap
         wWT4j3yL3w94l/CcdWZXZveGdwG/4OMzNQjDgZTIWrkKBZTKP2UAUqQcOV7Z2C/Au0
         8/KLK3FJu/1Zg==
Date:   Fri, 9 Jun 2023 07:42:52 +0100
From:   Lee Jones <lee@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     pavel@ucw.cz, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 4/8] leds: leds-mt6323: Specify registers and specs in
 platform data
Message-ID: <20230609064252.GG3635807@google.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
 <20230601110813.2373764-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230601110813.2373764-5-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 01 Jun 2023, AngeloGioacchino Del Regno wrote:

> In order to enhance the flexibility of this driver and let it support
> more than just one MediaTek LEDs IP for more than just one PMIC,
> add platform data structure specifying the register offsets and
> data that commonly varies between different IPs.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/leds-mt6323.c | 153 ++++++++++++++++++++++++++++---------
>  1 file changed, 115 insertions(+), 38 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
