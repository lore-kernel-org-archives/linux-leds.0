Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77DBC77B7E
	for <linux-leds@archiver.kernel.org>; Thu, 25 May 2023 04:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239442AbjEYEyP (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 25 May 2023 00:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238959AbjEYEwn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 May 2023 00:52:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B6B10F4;
        Wed, 24 May 2023 21:51:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE293642B3;
        Thu, 25 May 2023 04:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF79C4339C;
        Thu, 25 May 2023 04:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990288;
        bh=EEZIbq5GQVshGiUAgWZIrOHQDej6uHs4yXwVw1hd65c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dX730BkkYpOVkmMNeUepyqJJruGJWQvSHGcOgpr6si6cKep/OOJt/96Gq1ixBD1Uz
         BVLKK4+lPl01c+nSeDNNw5QFm7to9sdrahRYJbXAjoqWcAWnx0pvCpva7LDJI9ra2z
         Wj/n/OllEJbMwJ0y47QQi2vFYeUZ397F67QVQ4/dWMUlm9TuLEpq3ujrRlyH6/5VEq
         32S01485aF1r/X6osO9p+BTS2+CpPPu5v6FE8MJwjoJhsfhA2wdRMJUMSOFeqr3MUh
         vENeLIMeNjRUSYnyTYsKoCTHj2cFG15YmqCwA1tVH7psPYL6E8lVys6p9pwMK6/e1Q
         MZzMchhLnB7Qw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-leds@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: add PM8550
Date:   Wed, 24 May 2023 21:54:07 -0700
Message-Id: <168499048186.3998961.6640469391424267234.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
References: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 16 May 2023 17:02:00 +0200, Krzysztof Kozlowski wrote:
> Document compatible for PM8550 Torch and Flash LED controller.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: pm8550: add flash LED controller
      commit: cf51d2be057b19f2ef72233788c3211f0781678d
[3/3] arm64: dts: qcom: sm8550-qrd: add flash LEDs
      commit: a158f00cdf68852850df231526ce0df0bb7dc1b4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
