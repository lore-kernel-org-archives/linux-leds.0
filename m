Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1C6C43217
	for <linux-leds@archiver.kernel.org>; Wed,  4 May 2022 17:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359714AbiEDSCK (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 4 May 2022 14:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377452AbiEDSA4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:00:56 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D451C12B;
        Wed,  4 May 2022 10:15:51 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-e5e433d66dso1825981fac.5;
        Wed, 04 May 2022 10:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/sZFoGSuVJsC2wZ9dNCc4JLrQrkFZcqEG47d9JqV1Gg=;
        b=Wr9U25nWL8PG6OO8do93gYbUy0N/ihRqkK/bG7hG7rdAZvds4bbbFujaJWEU5A1wdH
         mqR5n3zR+FV6pcTyCAMwXPkipvbJXkQyMKX4BRGQXdrkvQnbS5rD72dILnM2Lcc+C4/g
         UP4u/ZMql1p9cg7qM1vsYvlhxieblw8PXaVIK7UBmegsd/SJpYkfHRohDVqtTWgvG++M
         aEhmU8Ty17KjYU/nBbylIOBrEYFCjoE02eXMz3nz3+1Il9hKZcY5G5pt4TvulFiuOlQe
         jN79sSn3V3ZFmk6DC7n+fxK1sIPVekN6c3TOAJrkIr7bLpe7iFyGRY5Qq0fbue7tE7BG
         U9+A==
X-Gm-Message-State: AOAM531NQFsr89tMQ6FUmSMRh7QTq34GytN4hDYBDwebMZ1yCHmuxfPM
        j055A1eAbtZnsdIcJnFvHg==
X-Google-Smtp-Source: ABdhPJz/D0e0enLqOyhRaOxOcEe96JkZ+yUVLWBCkpaNez82JEr/wX3grMMHjSAk9p5UL5gCadvo6Q==
X-Received: by 2002:a05:6870:9a05:b0:e6:589e:1ec5 with SMTP id fo5-20020a0568709a0500b000e6589e1ec5mr240831oab.203.1651684550678;
        Wed, 04 May 2022 10:15:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f6-20020a4ad806000000b0035eb4e5a6c4sm6234126oov.26.2022.05.04.10.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:15:49 -0700 (PDT)
Received: (nullmailer pid 1896703 invoked by uid 1000);
        Wed, 04 May 2022 17:15:48 -0000
Date:   Wed, 4 May 2022 12:15:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH v6 11/11] dt-bindings: net: dsa: qca8k: add LEDs
 definition example
Message-ID: <YnK0xHOkfXI+rgzs@robh.at.kernel.org>
References: <20220503151633.18760-1-ansuelsmth@gmail.com>
 <20220503151633.18760-12-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503151633.18760-12-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 03, 2022 at 05:16:33PM +0200, Ansuel Smith wrote:
> Add LEDs definition example for qca8k using the offload trigger as the
> default trigger and add all the supported offload triggers by the
> switch.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/net/dsa/qca8k.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> index f3c88371d76c..9b46ef645a2d 100644
> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> @@ -65,6 +65,8 @@ properties:
>                   internal mdio access is used.
>                   With the legacy mapping the reg corresponding to the internal
>                   mdio is the switch reg with an offset of -1.
> +                 Each phy have at least 3 LEDs connected and can be declared

s/at least/up to/ ?

Or your example is wrong with only 2.

> +                 using the standard LEDs structure.
>  
>  patternProperties:
>    "^(ethernet-)?ports$":
> @@ -287,6 +289,24 @@ examples:
>  
>                  internal_phy_port1: ethernet-phy@0 {
>                      reg = <0>;
> +
> +                    leds {
> +                        led@0 {
> +                            reg = <0>;
> +                            color = <LED_COLOR_ID_WHITE>;
> +                            function = LED_FUNCTION_LAN;
> +                            function-enumerator = <1>;
> +                            linux,default-trigger = "netdev";
> +                        };
> +
> +                        led@1 {
> +                            reg = <1>;
> +                            color = <LED_COLOR_ID_AMBER>;
> +                            function = LED_FUNCTION_LAN;
> +                            function-enumerator = <1>;
> +                            linux,default-trigger = "netdev";
> +                        };
> +                    };
>                  };
>  
>                  internal_phy_port2: ethernet-phy@1 {
> -- 
> 2.34.1
> 
> 
