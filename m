Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8C7ECAAD4
	for <linux-leds@archiver.kernel.org>; Tue, 30 Aug 2022 12:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiH3MYL (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 30 Aug 2022 08:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiH3MYK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Aug 2022 08:24:10 -0400
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E39F5CDC;
        Tue, 30 Aug 2022 05:24:09 -0700 (PDT)
Date:   Tue, 30 Aug 2022 13:56:41 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCH] leds: MAINTAINERS: include dt-bindings headers
Message-ID: <Yw36+cOL7alcIwQs@ada.ifak-system.com>
Mail-Followup-To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
References: <20220830083625.281462-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830083625.281462-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

Am Tue, Aug 30, 2022 at 11:36:25AM +0300 schrieb Krzysztof Kozlowski:
> Include the Devicetree binding headers in LED SUBSYSTEM entry.

Looks like a follow-up to my yesterday's mail? ;-)

Acked-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8fd6a1721e69..ebc140e71b49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11458,6 +11458,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
>  F:	Documentation/devicetree/bindings/leds/
>  F:	drivers/leds/
> +F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h
>  
>  LEGACY EEPROM DRIVER
> -- 
> 2.34.1
> 
