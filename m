Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7BDC7EE29
	for <linux-leds@archiver.kernel.org>; Thu, 25 May 2023 11:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240813AbjEYLrb (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 25 May 2023 07:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236270AbjEYLrb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 May 2023 07:47:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF7EAA;
        Thu, 25 May 2023 04:47:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A04E66450C;
        Thu, 25 May 2023 11:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD4CC4339C;
        Thu, 25 May 2023 11:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685015248;
        bh=K36bL4iZDVVyZvI+d5JZX62SeV6AaTI25uue5dopNzs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DNpL9DAwG4VSe7UJCsTS5mdc1xkLD5c0s19amaJGqrZk0lEJL/IlrOPI+uYIEPSZY
         RxrpOgM952sYpPV/RVPesSBeqURKdXYvBpQsZyODjd0g5ecjdD9kaiYTjwGUz6oKOb
         8SzEkpBqKi/+ZbRPzqzXVJqEe7YtqW0vzPkgEivyc99kURB6Hqnps0FthUuEg19zLc
         twefJbhUq+j/Audu4oOhpDOWilTqwSq2xtorRKVMTd97TO8DUo2sRuBLynkrFtZRo1
         W07fU2SQAInWHeZ3ANu/fVifn8z9Yysh0XdKT35GK5li7Ua7D6b8p4bl9QFG0QfXQa
         6UvE3MWLUMQEg==
Date:   Thu, 25 May 2023 12:47:22 +0100
From:   Lee Jones <lee@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: add PM8550
Message-ID: <20230525114722.GL423913@google.com>
References: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 16 May 2023, Krzysztof Kozlowski wrote:

> Document compatible for PM8550 Torch and Flash LED controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
