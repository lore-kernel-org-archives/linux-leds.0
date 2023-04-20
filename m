Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D532AC77B72
	for <linux-leds@archiver.kernel.org>; Thu, 20 Apr 2023 10:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbjDTKNb (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 20 Apr 2023 06:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbjDTKNH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 06:13:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6353D5FEE;
        Thu, 20 Apr 2023 03:09:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB70160A5B;
        Thu, 20 Apr 2023 10:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80760C433EF;
        Thu, 20 Apr 2023 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681985392;
        bh=8NFULnBDmamWIw3HzY5amFC+JJA5fjtGm86/JlSCAmQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tI0LBal/ZkTIbNMpz5g280up5GX4AQNjBrU3PoRN5Y/twdTLR9QRxqUGpkz2f6uCH
         9eBtKRhNEjWk8Nq79g5HRTM4CIgZ6aMwdgGes5N21kzXDAcwWGaonX3z5ZfXRy7YJ1
         3YZqK85aKB+71beHcbO8qacAfdBzfxPiyfVdg69YNY2QB0QV4dGwYUTlvL+9EXdMIl
         lnzqezWkS0zgnEYAAqTbnirF1ww9ey8k7NejdCVJqrr5w5r6GwcMvjftV+BiAlxGWi
         iOvh8XINelafFtk1LiMew7pgAJ4ML9NZ3gaNw87YgchM+un/gYIXXovxRTOo6vGFfz
         L/awCMUrz8U1A==
Date:   Thu, 20 Apr 2023 11:09:47 +0100
From:   Lee Jones <lee@kernel.org>
To:     Anjelique Melendez <quic_amelende@quicinc.com>
Cc:     pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] leds: rgb: leds-qcom-lpg: Add support for high
 resolution PWM
Message-ID: <20230420100947.GE9904@google.com>
References: <20230407223849.17623-1-quic_amelende@quicinc.com>
 <20230407223849.17623-3-quic_amelende@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407223849.17623-3-quic_amelende@quicinc.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 07 Apr 2023, Anjelique Melendez wrote:

> Certain PMICs like PMK8550 have a high resolution PWM module which can
> support from 8-bit to 15-bit PWM. Add support for it.
> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 151 ++++++++++++++++++++++---------
>  1 file changed, 106 insertions(+), 45 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
