Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223A9C43334
	for <linux-leds@archiver.kernel.org>; Wed,  6 Jul 2022 11:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbiGFLPO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 6 Jul 2022 07:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiGFLPO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Jul 2022 07:15:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EE527FC1;
        Wed,  6 Jul 2022 04:15:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2007561E95;
        Wed,  6 Jul 2022 11:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE653C3411C;
        Wed,  6 Jul 2022 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657106112;
        bh=pRerA3xJygyVGxUB0rsgEMwJGDa+LIaQoBEZ8coR4Bg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WI7M4B+NfNv6sL6HfTDQMFd/hCPjBYVAh5a8uatMg2HP+ZDWRbd/m360/ChX4OAH3
         J2iYcfWWC4He9mnHh8EBUNJzjj3sQGbPzvwxSocjZVHRrn2cOF6XpXBZ+VW4DDbHIZ
         vAJQKrykC2P7uLNa/6W5fgpOqhjgLP4O5FfgnBXkmpdU2ddacIZTsiBKnCoa/R9+iu
         x3Y3qgUor1wqMS7dX0yMyoaWDz2VKwqg9hGGqDgOWMr2NfWzH5ZZpuCfxXP22g3AkI
         gh60W0nvSDIzQ/gis+3txub7bHZ4n22FLBM0p9N7J2PK5zC9bq2FHFfM7Whi/tlNFI
         f0eO3OpsHkNJw==
Date:   Wed, 6 Jul 2022 13:15:07 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] [RFT] dt-bindings: leds: Add
 cznic,turris1x-leds.yaml binding
Message-ID: <20220706131507.353f0bed@thinkpad>
In-Reply-To: <20220705155929.25565-1-pali@kernel.org>
References: <20220705000448.14337-1-pali@kernel.org>
        <20220705155929.25565-1-pali@kernel.org>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue,  5 Jul 2022 17:59:28 +0200
Pali Roh=C3=A1r <pali@kernel.org> wrote:

> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    cpld@3,0 {

The generic node name should be just "bus". That it is a CPLD
implementation should come from compatible string.

This is similar to how we have generic names like "led-controller",
"switch", "ethernet-phy", ...

Pali, I can take over this and get it merged if you are getting
frustrated here.

Marek
