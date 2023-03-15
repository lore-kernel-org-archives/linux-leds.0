Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73996C74A5B
	for <linux-leds@archiver.kernel.org>; Wed, 15 Mar 2023 17:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjCORKD (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 15 Mar 2023 13:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjCORKD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Mar 2023 13:10:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BBB234EA;
        Wed, 15 Mar 2023 10:09:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4D8B8B81DEC;
        Wed, 15 Mar 2023 17:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146B8C433D2;
        Wed, 15 Mar 2023 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678900196;
        bh=dPhgUgCO79PnyBJECFNsEBHevdX5AVq/EVDYsHI7ITs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mQg8Rk8DhNrSWSCzsK3EcaeCpi4zGutbnddyz+mGyU5jxCGtxEWXcsrbQmVw7mKLk
         HfxoSVdcR27IUBBY/RVzR3vd1R9hkoTq9vO522QSuHBu8sq1sNTJ6weqXcHN+Bkt15
         Zcx0Jj1MwYql9dXlLlRz+SmB3b6mystKWducrpg1n03XhFuys9DsIVbleTwOV6yjxm
         GZl9ONqU3yc/b2tVMw8/0s7NY2o9x9u9ArcdO0p8LFHZLoDHd2JvZfQoRwZRAoHMp6
         fW3zxfXRBiDDeCWs+NudD6sFRX0cIhbap4qdIksvQ9hAciKWm7Vi4R5WrcWyU8x8v9
         icO1uQHgFbCug==
Date:   Wed, 15 Mar 2023 17:09:50 +0000
From:   Lee Jones <lee@kernel.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, krzysztof.kozlowski@linaro.org,
        linux-leds@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v8 1/2] leds: flash: add driver to support flash LED
 module in QCOM PMICs
Message-ID: <20230315170950.GD9667@google.com>
References: <20230303095023.538917-1-quic_fenglinw@quicinc.com>
 <20230303095023.538917-2-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303095023.538917-2-quic_fenglinw@quicinc.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 03 Mar 2023, Fenglin Wu wrote:

> Add initial driver to support flash LED module found in Qualcomm
> Technologies, Inc. PMICs. The flash module can have 3 or 4 channels
> and each channel can be controlled indepedently and support full scale
> current up to 1.5 A. It also supports connecting two channels together
> to supply one LED component with full scale current up to 2 A. In that
> case, the current will be split on each channel symmetrically and the
> channels will be enabled and disabled at the same time.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4 + pm6150l
> ---
>  drivers/leds/flash/Kconfig           |  15 +
>  drivers/leds/flash/Makefile          |   1 +
>  drivers/leds/flash/leds-qcom-flash.c | 773 +++++++++++++++++++++++++++
>  3 files changed, 789 insertions(+)
>  create mode 100644 drivers/leds/flash/leds-qcom-flash.c

Applied, thanks

--
Lee Jones [李琼斯]
