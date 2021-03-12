Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40130C433E9
	for <linux-leds@archiver.kernel.org>; Fri, 12 Mar 2021 07:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1276C64F8D
	for <linux-leds@archiver.kernel.org>; Fri, 12 Mar 2021 07:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCLHov convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 12 Mar 2021 02:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhCLHoT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Mar 2021 02:44:19 -0500
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1FAC061574
        for <linux-leds@vger.kernel.org>; Thu, 11 Mar 2021 23:44:18 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 746F8140AB2;
        Fri, 12 Mar 2021 08:44:14 +0100 (CET)
Date:   Fri, 12 Mar 2021 08:44:14 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
Message-ID: <20210312084414.7e4822bb@nic.cz>
In-Reply-To: <20210310070025.9150-1-zajec5@gmail.com>
References: <20210310070025.9150-1-zajec5@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 10 Mar 2021 08:00:25 +0100
Rafał Miłecki <zajec5@gmail.com> wrote:

> From: Rafał Miłecki <rafal@milecki.pl>
> 
> The old regex allowed only 1 character to follow the "led-" prefix which
> was most likely just an overlook. Fix it and while at it allow dashes in
> node names. It allows more meaningful names and it helpful e.g. when
> having the same function name with 2 different colors. For example:
> 1. led-power-white
> 2. led-power-blue
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> index 7ad2baeda0b0..ae46a43e480f 100644
> --- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> @@ -21,7 +21,7 @@ properties:
>  patternProperties:
>    # The first form is preferred, but fall back to just 'led' anywhere in the
>    # node name to at least catch some child nodes.
> -  "(^led-[0-9a-f]$|led)":
> +  "(^led-[0-9a-f][0-9a-f-]*$|led)":

Why not use +, like everywhere else?
  "(^led-[0-9a-f]+$|led)"
