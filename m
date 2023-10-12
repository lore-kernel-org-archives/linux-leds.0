Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7A9CDB482
	for <linux-leds@archiver.kernel.org>; Thu, 12 Oct 2023 09:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbjJLJxM (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 12 Oct 2023 05:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjJLJxL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Oct 2023 05:53:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7EF9D;
        Thu, 12 Oct 2023 02:53:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455B5C433C7;
        Thu, 12 Oct 2023 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697104390;
        bh=2yIx2lIzsN9KVNtfRWhz/dqFHghzum03EvXvSQIZLp8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=KufQl9Ylq84E+AU6DXd0qZndLGrynIAPzig/FOau/ir7/bJZo3x+qy1qdqm1ZaLl8
         1r4trW9SyYtYk3mHdsMMROkrAirusqvTWcFf2lSb8lTbdx+vtHClBvbqLH2ZtUy2jl
         rsoKTe0w7NJlcENwVLWlkrnJDPlQBNGpzPNxDr7oLsO8Ab8dHmR4IBNdylQzfe7hUl
         uHldbySw8F2/1QZI8fc2VeeaNNfriWRV3ocZGu0oAFo3+K8Zvi+zkRk5+EriNj4cOv
         PZ3J6jhsqiwgU64fIoD6HyUT/iIgS4SIm56bYHDRCwxQUPxOKFez5Q90+FyzAJcVSs
         QS3KAMlgjA6hg==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231002-ktd202x-v6-0-26be8eefeb88@apitzsch.eu>
References: <20231002-ktd202x-v6-0-26be8eefeb88@apitzsch.eu>
Subject: Re: [PATCH v6 0/2] leds: Add a driver for KTD202x
Message-Id: <169710438698.1160556.12482476260979824145.b4-ty@kernel.org>
Date:   Thu, 12 Oct 2023 10:53:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 02 Oct 2023 18:48:26 +0200, André Apitzsch wrote:
> Add the binding description and the corresponding driver for
> the Kinetic KTD2026 and KTD2027.
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: Add Kinetic KTD2026/2027 LED
      commit: 25766993d24a623c4ddcbd34a78fdc76026d9b40
[2/2] leds: add ktd202x driver
      commit: 4239b17b5de0dcd5900727be5597ba061acd00b8

--
Lee Jones [李琼斯]

