Return-Path: <SRS0=bC6L=D6=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E8BC388F9
	for <linux-leds@archiver.kernel.org>; Fri, 23 Oct 2020 22:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5223E2137B
	for <linux-leds@archiver.kernel.org>; Fri, 23 Oct 2020 22:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="HVeDY2pM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="O8/BuNXl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758355AbgJWWss (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 23 Oct 2020 18:48:48 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:45476 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758354AbgJWWsr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 23 Oct 2020 18:48:47 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 8FB6DC72DB; Fri, 23 Oct 2020 22:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1603493325; bh=9QylOst88qmIKbi24iDZJMCrYnGPoE0UiB9RlCsxFQ8=;
        h=From:To:Cc:Subject:Date;
        b=HVeDY2pMXcaxX1XCmGXjkUTKodIoz6rdWVZyGLbgwv8oC2XYIoHjkl2ffxH0cqZ0o
         ij78hgVqB29ZxktLpaNOKuv4hIyjevaovkTilpSCBl0DSGG7mlz4LiLqoNAi1dpi/l
         vSekiJ60Y4OwsmdgmyikQCsjBs6DtcNm793rEpX0=
Received: from g550jk.localnet (80-110-125-173.cgn.dynamic.surfer.at [80.110.125.173])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 3E532C7284;
        Fri, 23 Oct 2020 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1603493323; bh=9QylOst88qmIKbi24iDZJMCrYnGPoE0UiB9RlCsxFQ8=;
        h=From:To:Cc:Subject:Date;
        b=O8/BuNXlPPyRsxIruFt4kL/dHk2ScaWMnB8QubcPF8mJZi/nlzOh7m5+0K1jyR0W0
         qandpnXlkoq+tDCNHv6qyDXQ6W2AZuv5fAXxLEEVqYEmLgo9X0nXksaWWL/jmPjOeW
         ryp7MZV1JSG2TLyjkkE0lGU8Jox5qBxBM5CYAgwQ=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Linux LED Subsystem <linux-leds@vger.kernel.org>
Cc:     bjorn.andersson@linaro.org
Subject: Clarification regarding multicolor leds
Date:   Sat, 24 Oct 2020 00:48:42 +0200
Message-ID: <24145961.oFyDssk0vh@g550jk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
I'm currently experimenting with the qcom lpg[0] which is a driver for the rgb 
notification led found on e.g. Snapdragon 801 devices (and many more), 
specifically my example is about the Fairphone 2 (msm8974-fairphone-fp2).

[0] https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.andersson@linaro.org/

My dts is looking like the following (abbreviated):

    [in lpg node]
    multi-led {
        color = <LED_COLOR_ID_MULTI>;
        function = LED_FUNCTION_STATUS;
        ....
    };

I'm comparing this to the PinePhone where the leds are defined as follows:

    [in gpio-leds node]
    blue {
        function = LED_FUNCTION_INDICATOR;
        color = <LED_COLOR_ID_BLUE>;
    };
    
    green {
        function = LED_FUNCTION_INDICATOR;
        color = <LED_COLOR_ID_GREEN>;
    };
    
    red {
        function = LED_FUNCTION_INDICATOR;
        color = <LED_COLOR_ID_RED>;
    };

(sidenote: the LED_FUNCTION_INDICATOR should probably also be 
LED_FUNCTION_STATUS there; the dts was made before the better descriptions for 
the defines have been added)

This gets the following directories created in /sys/class/leds/:

    blue:indicator
    green:indicator
    red:indicator

But with the multicolor led on the Fairphone 2 only a directory with the name 
of "multi-led" gets created which I would have expected to be 
"multicolor:status" instead.


What's further confusing me is that include/dt-bindings/leds/common.h states 
(reformatted for clarity):

/* For multicolor LEDs */
#define LED_COLOR_ID_MULTI	8

/* For multicolor LEDs that can do arbitrary color, so this would include RGBW 
and similar */
#define LED_COLOR_ID_RGB	9

It sounds like these comments are the wrong way around as it says that RGB 
does RGBW & others while MULTI is normal RGB?

I have also found this commit[1] while browsing through lkml which seems to 
validate my suspicions that _ID_RGB should be used normally? This commit seems 
have been applied early September but hasn't been merged in the 5.10 merge 
window?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
commit/?h=for-next&id=3d93edc77515c6f51fa9bbbe2185e2ec32bad024

But drivers/leds/led-core.c also states "We want to label LEDs that can 
produce full range of colors as RGB, not multicolor" - not sure what "full 
range" means here.

Thanks for reading through my long email and I'd appreciate any clarification 
on the situation!
Regards,
Luca


